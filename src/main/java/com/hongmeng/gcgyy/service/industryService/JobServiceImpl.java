package com.hongmeng.gcgyy.service.industryService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.entity.authority.BaseUserEntity;
import com.hongmeng.gcgyy.entity.baseData.BusinessEntity;
import com.hongmeng.gcgyy.entity.industryService.JobEntity;
import com.hongmeng.gcgyy.repository.industryService.JobRepository;

@Service
public class JobServiceImpl implements JobService {

	@Autowired
	JobRepository jobRepository;

	@Override
	public void save(JobEntity job) {
		jobRepository.save(job);
	}

	@Override
	public void update(JobEntity job, BaseUserEntity user, Integer age, String telephone, BusinessEntity business,
			String salary, String description, String experience) {
		job.setUser(user);
		job.setAge(age);
		job.setTelephone(telephone);
		job.setBusiness(business);
		job.setSalary(salary);
		job.setDescription(description);
		job.setExperience(experience);
		jobRepository.save(job);
	}

	@Override
	public void delete(List<Long> jobIds) {
		Iterable<JobEntity> it = jobRepository.findByIdIn(jobIds);
		jobRepository.delete(it);
	}

	@Override
	public List<JobEntity> list() {
		return (List<JobEntity>) jobRepository.findAll();
	}

	@Override
	public JobEntity findOne(Long jobId) {
		return jobRepository.findOne(jobId);
	}

	@Override
	public List<JobEntity> findByUserId(Long userId) {
		return (List<JobEntity>) jobRepository.findByUserId(userId);
	}

	@Override
	public List<JobEntity> listPaging(int page, int size) {
		Page<JobEntity> jobPage = jobRepository.findAllByOrderByCreateTimeDesc(new PageRequest(page, size));
		return jobPage.getContent();
	}

	@Override
	public List<JobEntity> listPagingByUserId(Long userId, int page, int size) {
		Page<JobEntity> jobPage = jobRepository.findAllByUserIdOrderByCreateTimeDesc(userId,
				new PageRequest(page, size));
		return jobPage.getContent();
	}
}
