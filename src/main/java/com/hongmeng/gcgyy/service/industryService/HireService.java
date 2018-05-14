package com.hongmeng.gcgyy.service.industryService;

import java.util.List;

import com.hongmeng.gcgyy.entity.authority.EnterpriseEntity;
import com.hongmeng.gcgyy.entity.baseData.BusinessEntity;
import com.hongmeng.gcgyy.entity.industryService.HireEntity;

public interface HireService {

	void save(HireEntity hire);

	void update(HireEntity hire, String imagePath, EnterpriseEntity enterprise, String position, String telephone,
			String salary, BusinessEntity business, String description);

	void delete(List<Long> hireIds);

	List<HireEntity> list();

	HireEntity findOne(Long hireId);

	List<HireEntity> findByEnterpriseId(Long enterpriseId);

	List<HireEntity> listPaging(int page, int size);

	List<HireEntity> listPagingByEnterpriseId(Long enterpriseId, int page, int size);

}
