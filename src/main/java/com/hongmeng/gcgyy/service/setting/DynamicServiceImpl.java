package com.hongmeng.gcgyy.service.setting;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.entity.setting.DynamicEntity;
import com.hongmeng.gcgyy.repository.setting.DynamicRepository;

@Service
public class DynamicServiceImpl implements DynamicService {

	static Logger log = LoggerFactory.getLogger(DynamicServiceImpl.class);

	@Autowired
	DynamicRepository dynamicRepository;

	@Override
	public DynamicEntity findOne(Long dynamicId) {
		return dynamicRepository.findOne(dynamicId);
	}

	@Override
	public void save(DynamicEntity dynamic) {
		dynamicRepository.save(dynamic);
	}

	@Override
	public void update(DynamicEntity dynamic, String title, Integer type, String imagePath, String linkPath) {
		dynamic.setTitle(title);
		dynamic.setType(type);
		dynamic.setImagePath(imagePath);
		dynamic.setLinkPath(linkPath);
		dynamicRepository.save(dynamic);
	}

	@Override
	public void delete(List<Long> dynamicIds) {
		Iterable<DynamicEntity> it = dynamicRepository.findByIdIn(dynamicIds);
		dynamicRepository.delete(it);
	}

	@Override
	public List<DynamicEntity> list() {
		return dynamicRepository.findAllByOrderByCreateTimeDesc();
	}

	@Override
	public List<DynamicEntity> listPaging(int page, int size) {
		Page<DynamicEntity> dynamicPage = dynamicRepository.findAllByOrderByCreateTimeDesc(new PageRequest(page, size));
		return dynamicPage.getContent();
	}

	@Override
	public List<DynamicEntity> listByType(Integer type) {
		return dynamicRepository.findByTypeOrderByCreateTimeDesc(type);
	}

	@Override
	public List<DynamicEntity> listByTypePaging(Integer type, int page, int size) {
		Page<DynamicEntity> dynamicPage = dynamicRepository.findByTypeOrderByCreateTimeDesc(type,
				new PageRequest(page, size));
		return dynamicPage.getContent();
	}

}
