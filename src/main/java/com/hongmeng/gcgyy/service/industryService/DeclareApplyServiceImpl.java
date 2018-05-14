package com.hongmeng.gcgyy.service.industryService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.entity.industryService.DeclareApplyEntity;
import com.hongmeng.gcgyy.repository.industryService.DeclareApplyRepository;

@Service
public class DeclareApplyServiceImpl implements DeclareApplyService {

	@Autowired
	DeclareApplyRepository declareApplyRepository;

	@Override
	public DeclareApplyEntity findOne(Long declareApplyId) {
		return declareApplyRepository.findOne(declareApplyId);
	}
	
	@Override
	public DeclareApplyEntity findOne(Long declareId, Long enterpriseId) {
		return declareApplyRepository.findByDeclareIdAndEnterpriseId(declareId, enterpriseId);
	}

	@Override
	public void save(DeclareApplyEntity declareApply) {
		declareApplyRepository.save(declareApply);
	}

	@Override
	public void update(DeclareApplyEntity declareApply, String description, String attachName, String attachPath) {
		declareApply.setDescription(description);
		declareApply.setAttachName(attachName);
		declareApply.setAttachPath(attachPath);
		declareApplyRepository.save(declareApply);
	}

	@Override
	public void delete(List<Long> declareApplyIds) {
		Iterable<DeclareApplyEntity> it = declareApplyRepository.findByIdIn(declareApplyIds);
		declareApplyRepository.delete(it);
	}

	@Override
	public List<DeclareApplyEntity> list(Long enterpriseId) {
		return declareApplyRepository.findByEnterpriseId(enterpriseId);
	}

	@Override
	public List<DeclareApplyEntity> list(Long enterpriseId, int page, int size) {
		Page<DeclareApplyEntity> declareApplyPage = declareApplyRepository.findByEnterpriseId(enterpriseId,
				new PageRequest(page, size));
		return declareApplyPage.getContent();
	}

}