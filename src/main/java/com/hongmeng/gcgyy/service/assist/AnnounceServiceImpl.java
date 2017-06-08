package com.hongmeng.gcgyy.service.assist;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.entity.assist.AnnounceEntity;
import com.hongmeng.gcgyy.repository.assist.AnnounceRepository;

@Service
public class AnnounceServiceImpl implements AnnounceService {

	@Autowired
	AnnounceRepository announceRepository;

	@Override
	public AnnounceEntity findOne(Long announceId) {
		return announceRepository.findOne(announceId);
	}

	@Override
	public void save(AnnounceEntity announce) {
		announceRepository.save(announce);
	}

	@Override
	public void update(AnnounceEntity announce, String title, String linkPath) {
		announce.setTitle(title);
		announce.setLinkPath(linkPath);
		announceRepository.save(announce);
	}

	@Override
	public void delete(List<Long> announceIds) {
		Iterable<AnnounceEntity> it = announceRepository.findByIdIn(announceIds);
		announceRepository.delete(it);
	}

	@Override
	public List<AnnounceEntity> list() {
		return announceRepository.findAllByOrderByCreateTimeDesc();
	}

	@Override
	public List<AnnounceEntity> listPaging(int page, int size) {
		Page<AnnounceEntity> announcePage = announceRepository.findAllByOrderByCreateTimeDesc(new PageRequest(page, size));
		return announcePage.getContent();
	}

}