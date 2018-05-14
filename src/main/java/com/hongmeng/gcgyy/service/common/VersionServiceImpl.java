package com.hongmeng.gcgyy.service.common;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.entity.common.VersionEntity;
import com.hongmeng.gcgyy.repository.common.VersionRepository;

@Service
public class VersionServiceImpl implements VersionService {
	
	@Autowired
	VersionRepository versionRepository;

	@Override
	public VersionEntity findOne(Long versionId) {
		return versionRepository.findOne(versionId);
	}

	@Override
	public VersionEntity findOne(Integer code) {
		return versionRepository.findByCode(code);
	}
	
	@Override
	public void save(VersionEntity version) {
		versionRepository.save(version);
	}

	@Override
	public List<VersionEntity> list() {
		return (List<VersionEntity>) versionRepository.findAll();
	}

	@Override
	public VersionEntity findLastest() {
		List<VersionEntity> list = versionRepository.findByOrderByCodeDesc();
		if (list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	@Override
	public void delete(List<Long> versionIds) {
		Iterable<VersionEntity> it = versionRepository.findByIdIn(versionIds);
		versionRepository.delete(it);
	}

}
