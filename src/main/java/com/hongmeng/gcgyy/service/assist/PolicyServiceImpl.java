package com.hongmeng.gcgyy.service.assist;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.entity.assist.PolicyEntity;
import com.hongmeng.gcgyy.entity.baseData.PolicyTypeEntity;
import com.hongmeng.gcgyy.repository.assist.PolicyRepository;

@Service
public class PolicyServiceImpl implements PolicyService {

	@Autowired
	PolicyRepository policyRepository;

	@Override
	public PolicyEntity findOne(Long policyId) {
		return policyRepository.findOne(policyId);
	}

	@Override
	public void save(PolicyEntity policy) {
		policyRepository.save(policy);
	}

	@Override
	public void update(PolicyEntity policy, String title, PolicyTypeEntity policyType, String linkPath) {
		policy.setTitle(title);
		policy.setPolicyType(policyType);
		policy.setLinkPath(linkPath);
		policyRepository.save(policy);
	}

	@Override
	public void delete(List<Long> policyIds) {
		Iterable<PolicyEntity> it = policyRepository.findByIdIn(policyIds);
		policyRepository.delete(it);
	}

	@Override
	public List<PolicyEntity> list() {
		return policyRepository.findAllByOrderByCreateTimeDesc();
	}

	@Override
	public List<PolicyEntity> listPaging(int page, int size) {
		Page<PolicyEntity> policyPage = policyRepository.findAllByOrderByCreateTimeDesc(new PageRequest(page, size));
		return policyPage.getContent();
	}

}