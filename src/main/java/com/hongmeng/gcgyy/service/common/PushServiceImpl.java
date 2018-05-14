package com.hongmeng.gcgyy.service.common;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.common.utils.JsonUtils;
import com.hongmeng.gcgyy.common.utils.UPushUtils;
import com.hongmeng.gcgyy.entity.assist.AppealEntity;
import com.hongmeng.gcgyy.entity.assist.BaseAppealEntity;
import com.hongmeng.gcgyy.entity.common.LoginEntity;
import com.hongmeng.gcgyy.entity.common.LoginEntity.LoginType;
import com.hongmeng.gcgyy.entity.common.PushEntity;
import com.hongmeng.gcgyy.entity.common.PushEntity.PushStatus;
import com.hongmeng.gcgyy.entity.common.PushEntity.PushType;
import com.hongmeng.gcgyy.repository.common.PushRepository;
import com.hongmeng.gcgyy.service.assist.AppealService;

@Service
public class PushServiceImpl implements PushService {
	
	@Autowired
	PushRepository pushRepository;
	
	@Autowired
	LoginService loginService;
	
	@Autowired
	AppealService appealService;
	
	@Override
	public PushEntity findOne(Long pushId) {
		return pushRepository.findOne(pushId);
	}

	@Override
	public void save(PushEntity push) {
		pushRepository.save(push);
	}

	@Override
	public void delete(List<Long> pushIds) {
		Iterable<PushEntity> it = pushRepository.findByIdIn(pushIds);
		pushRepository.delete(it);
	}

	@Override
	public List<PushEntity> list() {
		return (List<PushEntity>) pushRepository.findAll();
	}

	@Override
	public List<PushEntity> listByUserId(Long userId) {
		List<PushEntity> list = pushRepository.findByUserIdOrderByCreateTimeDesc(userId);
		for (PushEntity push: list) {
			push.setContent(getContent(push));
		}
		return list;
	}
	
	@Override
	public List<PushEntity> listByUserId(Long userId, int page, int size) {
		Page<PushEntity> pushPage = pushRepository.findByUserIdOrderByCreateTimeDesc(userId, new PageRequest(page, size));
		List<PushEntity> list = pushPage.getContent();
		for (PushEntity push: list) {
			push.setContent(getContent(push));
		}
		return list;
	}

	@Override
	public void push(PushEntity push) {
		LoginEntity login = loginService.findByUserAndLoginType(push.getUser(), LoginType.MOBILE);
		push.setCreateTime(new Date());
		
		if (login != null) {
			push.setPushStatus(PushStatus.PUSH);
			push = pushRepository.save(push);
			
			push.setContent(getContent(push));
			UPushUtils.getInstance().pushAndroidUnicast(login.getDeviceToken(), push);
		} else {
			pushRepository.save(push);
		}
	}
	
	@Override
	public void pushByUserId(Long userId) {
		List<PushEntity> list = pushRepository.findByUserIdOrderByCreateTimeDesc(userId);
		for (PushEntity push: list) {
			if (push.getPushStatus() == PushStatus.UNPUSH) {
				LoginEntity login = loginService.findByUserAndLoginType(push.getUser(), LoginType.MOBILE);
				
				if (login != null) {
					push.setPushStatus(PushStatus.PUSH);
					pushRepository.save(push);
					push.setContent(getContent(push));
					UPushUtils.getInstance().pushAndroidUnicast(login.getDeviceToken(), push);
				}
			}
		}
	}
	
	@Override
	public String getContent(PushEntity push) {
		PushMsg msg = new PushMsg();
		switch (push.getPushType()) {
		case PushType.APPEAL:
			msg.setSendType(push.getSendType());
			AppealEntity appeal = appealService.findOne(push.getPushTypeId());
			BaseAppealEntity baseAppeal = appealService.toBaseAppeal(appeal);
			msg.setData(baseAppeal);
			break;
		default:
			break;
		}
		return JsonUtils.toJson(msg);
	}

}