package com.hongmeng.gcgyy.service.assist;

import java.math.BigInteger;
import java.util.List;

import com.hongmeng.gcgyy.entity.assist.AppealEntity;
import com.hongmeng.gcgyy.entity.assist.BaseAppealEntity;
import com.hongmeng.gcgyy.entity.assist.UrgeEntity;
import com.hongmeng.gcgyy.entity.authority.EnterpriseEntity;
import com.hongmeng.gcgyy.entity.baseData.AppealTypeEntity;

public interface AppealService {
	
	AppealEntity findOne(Long appealId);
	
	AppealEntity save(AppealEntity appeal);
	
	void update(AppealEntity appeal, String title, AppealTypeEntity appealType, String description);
	
	void delete(List<Long> appealIds);
	
	BaseAppealEntity toBaseAppeal(AppealEntity appeal);
	
	List<AppealEntity> list();
	
	List<AppealEntity> listPaging(int page, int size);
	
	List<Object[]> getAppealCountByType(Long departmentId);

	List<BigInteger> getAllOverDaysByTypeId(Long departmentId, Long appealTypeId, int page, int size);
	
	BigInteger getOverAcceptDaysCount(Long departmentId, Long appealTypeId);
	
	BigInteger getOverHandleDaysCount(Long departmentId, Long appealTypeId);
	
	List<BigInteger> getOverAcceptDays(Long enterpriseId);
	
	List<BigInteger> getOverHandleDays(Long enterpriseId);
	
	List<BigInteger> getOverAcceptDays(Long departmentId, Long enterpriseId, Long appealTypeId);
	
	List<BigInteger> getOverHandleDays(Long departmentId, Long enterpriseId, Long appealTypeId);
	
	List<AppealEntity> findUnconfirm();
	
	List<AppealEntity> findUnconfirmPaging(int page, int size);
	
	List<AppealEntity> findConfirmed();
	
	List<AppealEntity> findConfirmedPaging(int page, int size);
	
	List<AppealEntity> findByAppealTypeId(Long appealTypeId, Long departmentId);
	
	List<AppealEntity> findByAppealTypeId(Long appealTypeId, Long departmentId, int page, int size);
	
	List<AppealEntity> findByAppealTypeIdAndStatus(Long appealTypeId, Integer status, Long departmentId);
	
	List<UrgeEntity> getUrges(Long appealId);
	
	List<UrgeEntity> getUrges(Long appealId, int page, int size);
	
	/**
	 * enterprise
	 */
	List<AppealEntity> findByEnterpriseId(Long enterpriseId);
	
	List<AppealEntity> findByEnterpriseId(Long enterpriseId, int page, int size);
	
	List<AppealEntity> findByEnterpriseIdUnconfirm(Long enterpriseId);
	
	List<AppealEntity> findByEnterpriseIdUnconfirm(Long enterpriseId, int page, int size);
	
	List<AppealEntity> findByEnterpriseIdConfirmed(Long enterpriseId);
	
	List<AppealEntity> findByEnterpriseIdConfirmed(Long enterpriseId, int page, int size);
	
	List<AppealEntity> searchByEnterpriseName(String name);
	
	List<AppealEntity> searchByEnterpriseName(String name, int page, int size);
	
	List<AppealEntity> findByEnterpriseIn(List<EnterpriseEntity> list);
	
	List<AppealEntity> findByEnterpriseIn(List<EnterpriseEntity> list, int page, int size);
	
	/**
	 * department
	 */
	List<AppealEntity> findByDepartmentId(Long departmentId);
	
	List<AppealEntity> findByDepartmentId(Long departmentId, int page, int size);
	
	List<AppealEntity> findByDepartmentIdUnconfirm(Long departmentId);
	
	List<AppealEntity> findByDepartmentIdUnconfirm(Long departmentId, int page, int size);
	
	List<AppealEntity> findByDepartmentIdConfirmed(Long departmentId);
	
	List<AppealEntity> findByDepartmentIdConfirmed(Long departmentId, int page, int size);
	
	List<AppealEntity> findByDepartmentIdAndEnterpriseName(Long departmentId, String name);
	
	List<AppealEntity> findByDepartmentIdAndEnterpriseName(Long departmentId, String name, int page, int size);
	
}
