package com.hongmeng.gcgyy.service.industryService;

import java.util.List;

import com.hongmeng.gcgyy.entity.authority.BaseUserEntity;
import com.hongmeng.gcgyy.entity.baseData.BusinessEntity;
import com.hongmeng.gcgyy.entity.industryService.JobEntity;

public interface JobService {

	void save(JobEntity job);

	void update(JobEntity job, BaseUserEntity user, Integer age, String telephone, BusinessEntity business,
			String salary, String description, String experience);

	void delete(List<Long> jobIds);

	List<JobEntity> list();

	JobEntity findOne(Long jobId);

	List<JobEntity> findByUserId(Long userId);

	List<JobEntity> listPaging(int page, int size);

	List<JobEntity> listPagingByUserId(Long userId, int page, int size);

}
