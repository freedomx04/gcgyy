package com.hongmeng.gcgyy.service.industryService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.entity.authority.EnterpriseEntity;
import com.hongmeng.gcgyy.entity.baseData.BusinessEntity;
import com.hongmeng.gcgyy.entity.industryService.HireEntity;
import com.hongmeng.gcgyy.repository.industryService.HireRepository;

@Service
public class HireServiceImpl implements HireService {

	@Autowired
	HireRepository hireRepository;

	@Override
	public void save(HireEntity hire) {
		hireRepository.save(hire);
	}

	@Override
	public void update(HireEntity hire, String imagePath, EnterpriseEntity enterprise, String position,
			String telephone, String salary, BusinessEntity business, String description) {
		hire.setImagePath(imagePath);
		hire.setEnterprise(enterprise);
		hire.setPosition(position);
		hire.setTelephone(telephone);
		hire.setSalary(salary);
		hire.setBusiness(business);
		hire.setDescription(description);
		hireRepository.save(hire);
	}

	@Override
	public void delete(List<Long> hireIds) {
		Iterable<HireEntity> it = hireRepository.findByIdIn(hireIds);
		hireRepository.delete(it);
	}

	@Override
	public List<HireEntity> list() {
		return (List<HireEntity>) hireRepository.findAll();
	}

	@Override
	public HireEntity findOne(Long hireId) {
		return hireRepository.findOne(hireId);
	}

	@Override
	public List<HireEntity> findByEnterpriseId(Long enterpriseId) {
		return (List<HireEntity>) hireRepository.findByEnterpriseId(enterpriseId);
	}

	@Override
	public List<HireEntity> listPaging(int page, int size) {
		Page<HireEntity> hirePage = hireRepository.findAllByOrderByCreateTimeDesc(new PageRequest(page, size));
		return hirePage.getContent();
	}

	@Override
	public List<HireEntity> listPagingByEnterpriseId(Long enterpriseId, int page, int size) {
		Page<HireEntity> hirePage = hireRepository.findAllByEnterpriseIdOrderByCreateTimeDesc(enterpriseId,
				new PageRequest(page, size));
		return hirePage.getContent();
	}
}
