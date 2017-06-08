package com.hongmeng.gcgyy.repository.industryService;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hongmeng.gcgyy.entity.industryService.JobEntity;

public interface JobRepository extends PagingAndSortingRepository<JobEntity, Long> {

	Iterable<JobEntity> findByIdIn(List<Long> jobIds);

	Iterable<JobEntity> findByUserId(Long userId);

	Page<JobEntity> findAllByOrderByCreateTimeDesc(Pageable pageable);

	Page<JobEntity> findAllByUserIdOrderByCreateTimeDesc(Long userId, Pageable pageable);

}
