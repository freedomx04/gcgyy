package com.hongmeng.gcgyy.service.assist;

import java.util.List;

import com.hongmeng.gcgyy.entity.assist.AnnounceEntity;

public interface AnnounceService {
	
	AnnounceEntity findOne(Long announceId);
	
	void save(AnnounceEntity announce);
	
	void update(AnnounceEntity announce, String title, String linkPath);
	
	void delete(List<Long> announceIds);
	
	List<AnnounceEntity> list();
	
	List<AnnounceEntity> listPaging(int page, int size);

}
