package com.hongmeng.gcgyy.service.industryService;

import java.util.List;

import com.hongmeng.gcgyy.entity.industryService.DeclareApplyEntity;

public interface DeclareApplyService {
	
	DeclareApplyEntity findOne(Long declareApplyId);
	
	DeclareApplyEntity findOne(Long declareId, Long enterpriseId);

	void save(DeclareApplyEntity declareApply);

	void update(DeclareApplyEntity declareApply, String description, String attachName, String attachPath);

	void delete(List<Long> declareApplyIds);
	
	List<DeclareApplyEntity> list(Long enterpriseId);
	
	List<DeclareApplyEntity> list(Long enterpriseId, int page, int size);

}
