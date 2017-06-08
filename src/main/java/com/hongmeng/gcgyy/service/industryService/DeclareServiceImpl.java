package com.hongmeng.gcgyy.service.industryService;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.entity.industryService.BaseDeclareEntity;
import com.hongmeng.gcgyy.entity.industryService.DeclareEntity;
import com.hongmeng.gcgyy.entity.industryService.DeclareEntity.DeclareStatus;
import com.hongmeng.gcgyy.repository.industryService.BaseDeclareRepository;
import com.hongmeng.gcgyy.repository.industryService.DeclareRepository;

@Service
public class DeclareServiceImpl implements DeclareService {

	@Autowired
	DeclareRepository declareRepository;

	@Autowired
	BaseDeclareRepository baseDeclareRepository;

	@Override
	public DeclareEntity findOne(Long declareId) {
		return declareRepository.findOne(declareId);
	}

	@Override
	public BaseDeclareEntity findOneBase(Long declareId) {
		return baseDeclareRepository.findOne(declareId);
	}

	@Override
	public void save(DeclareEntity declare) {
		declareRepository.save(declare);
	}

	@Override
	public void update(DeclareEntity declare, String itemName, String description, Date startTime, Date endTime,
			String attachName, String attachPath) {
		declare.setItemName(itemName);
		declare.setDescription(description);
		declare.setStartTime(startTime);
		declare.setEndTime(endTime);
		declare.setAttachName(attachName);
		declare.setAttachPath(attachPath);
		declareRepository.save(declare);
	}

	@Override
	public void delete(DeclareEntity declare) {
		declareRepository.delete(declare);
	}

	@Override
	public void delete(List<Long> declareIds) {
		Iterable<DeclareEntity> it = declareRepository.findByIdIn(declareIds);
		declareRepository.delete(it);
	}

	@Override
	public List<DeclareEntity> list() {
		return declareRepository.findAllByOrderByCreateTimeDesc();
	}

	@Override
	public List<DeclareEntity> list(int page, int size) {
		Page<DeclareEntity> declarePage = declareRepository.findAllByOrderByCreateTimeDesc(new PageRequest(page, size));
		return declarePage.getContent();
	}

	@Override
	public List<DeclareEntity> listByUserId(Long userId) {
		return declareRepository.findByUserIdOrderByCreateTimeDesc(userId);
	}

	@Override
	public List<DeclareEntity> listByUserId(Long userId, int page, int size) {
		Page<DeclareEntity> declarePage = declareRepository.findByUserIdOrderByCreateTimeDesc(userId,
				new PageRequest(page, size));
		return declarePage.getContent();
	}

	@Override
	public List<DeclareEntity> listOnline() {
		return declareRepository.findByStatusOrderByCreateTimeDesc(DeclareStatus.ONLINE);
	}

	@Override
	public List<DeclareEntity> listOnline(int page, int size) {
		Page<DeclareEntity> declarePage = declareRepository.findByStatusOrderByCreateTimeDesc(DeclareStatus.ONLINE,
				new PageRequest(page, size));
		return declarePage.getContent();
	}

}