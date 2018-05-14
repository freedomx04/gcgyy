package com.hongmeng.gcgyy.repository.industryService;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hongmeng.gcgyy.entity.industryService.DeclareApplyEntity;

public interface DeclareApplyRepository extends PagingAndSortingRepository<DeclareApplyEntity, Long> {

	Iterable<DeclareApplyEntity> findByIdIn(List<Long> declareApplyIds);
	
	DeclareApplyEntity findByDeclareIdAndEnterpriseId(Long declareId, Long enterpriseId);

	List<DeclareApplyEntity> findByEnterpriseId(Long enterpriseId);

	Page<DeclareApplyEntity> findByEnterpriseId(Long enterpriseId, Pageable pageable);

}
