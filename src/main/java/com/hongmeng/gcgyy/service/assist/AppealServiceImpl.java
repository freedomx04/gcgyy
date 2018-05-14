package com.hongmeng.gcgyy.service.assist;

import java.math.BigInteger;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.entity.assist.AppealEntity;
import com.hongmeng.gcgyy.entity.assist.BaseAppealEntity;
import com.hongmeng.gcgyy.entity.assist.UrgeEntity;
import com.hongmeng.gcgyy.entity.authority.EnterpriseEntity;
import com.hongmeng.gcgyy.entity.baseData.AppealTypeEntity;
import com.hongmeng.gcgyy.repository.assist.AppealRepositoy;
import com.hongmeng.gcgyy.repository.assist.UrgeRepository;
import com.hongmeng.gcgyy.repository.authority.EnterpriseRepository;

@Service
public class AppealServiceImpl implements AppealService {

	@Autowired
	AppealRepositoy appealRepository;

	@Autowired
	EnterpriseRepository enterpriseRepository;

	@Autowired
	UrgeRepository urgeRepository;

	@Override
	public AppealEntity findOne(Long appealId) {
		return appealRepository.findOne(appealId);
	}

	@Override
	public AppealEntity save(AppealEntity appeal) {
		return appealRepository.save(appeal);
	}

	@Override
	public void update(AppealEntity appeal, String title, AppealTypeEntity appealType, String description) {
		appeal.setTitle(title);
		appeal.setAppealType(appealType);
		appeal.setDescription(description);
		appealRepository.save(appeal);
	}

	@Override
	public void delete(List<Long> appealIds) {
		Iterable<AppealEntity> it = appealRepository.findByIdIn(appealIds);
		appealRepository.delete(it);
	}
	
	@Override
	public BaseAppealEntity toBaseAppeal(AppealEntity appeal) {
		BaseAppealEntity base = new BaseAppealEntity(appeal.getTitle(), appeal.getDescription(), appeal.getStatus());
		base.setId(appeal.getId());
		base.setCreateTime(appeal.getCreateTime());
		base.setSendTime(appeal.getSendTime());
		base.setDispatchTime(appeal.getDispatchTime());
		base.setAcceptTime(appeal.getAcceptTime());
		base.setHandleTime(appeal.getHandleTime());
		return base;
	}

	@Override
	public List<AppealEntity> list() {
		return appealRepository.findAllByOrderByCreateTimeDesc();
	}

	@Override
	public List<AppealEntity> listPaging(int page, int size) {
		Page<AppealEntity> appealPage = appealRepository.findAllByOrderByCreateTimeDesc(new PageRequest(page, size));
		return appealPage.getContent();
	}

	@Override
	public List<Object[]> getAppealCountByType(Long departmentId) {
		if (departmentId == null || "".equals(departmentId)) {
			return appealRepository.getAppealCountByType();
		} else {
			return appealRepository.getAppealCountByType(departmentId);
		}
	}

	@Override
	public List<BigInteger> getAllOverDaysByTypeId(Long departmentId, Long appealTypeId, int page, int size) {
		int startIndex = (page - 1) * size;
		if (departmentId == null || "".equals(departmentId)) {
			if (appealTypeId == null || "".equals(appealTypeId)) {
				return appealRepository.getAllOverDaysByTypeId(startIndex, size);
			} else {
				return appealRepository.getAllOverDaysByTypeId(appealTypeId, startIndex, size);
			}
		} else {
			if (appealTypeId == null || "".equals(appealTypeId)) {
				return appealRepository.getOverDaysByTypeId(departmentId, startIndex, size);
			} else {
				return appealRepository.getOverDaysByTypeId(departmentId, appealTypeId, startIndex, size);
			}
		}
	}

	@Override
	public BigInteger getOverAcceptDaysCount(Long departmentId, Long appealTypeId) {
		if (departmentId == null || "".equals(departmentId)) {
			return appealRepository.getOverAcceptDaysCount(appealTypeId);
		} else {
			return appealRepository.getOverAcceptDaysCount(departmentId, appealTypeId);
		}
	}

	@Override
	public BigInteger getOverHandleDaysCount(Long departmentId, Long appealTypeId) {
		if (departmentId == null || "".equals(departmentId)) {
			return appealRepository.getOverHandleDaysCount(appealTypeId);
		} else {
			return appealRepository.getOverHandleDaysCount(departmentId, appealTypeId);
		}
	}

	@Override
	public List<BigInteger> getOverAcceptDays(Long departmentId, Long enterpriseId, Long appealTypeId) {
		if ((departmentId == null || "".equals(departmentId)) && enterpriseId == null || "".equals(enterpriseId)) {
			return appealRepository.getOverAcceptDays(appealTypeId);
		} else if (departmentId != null && !"".equals(departmentId)) {
			return appealRepository.getOverAcceptDaysByDepartmentId(departmentId, appealTypeId);
		} else {
			return appealRepository.getOverAcceptDaysByEnterpriseId(enterpriseId, appealTypeId);
		}
	}

	@Override
	public List<BigInteger> getOverHandleDays(Long departmentId, Long enterpriseId, Long appealTypeId) {
		if ((departmentId == null || "".equals(departmentId)) && enterpriseId == null || "".equals(enterpriseId)) {
			return appealRepository.getOverHandleDays(appealTypeId);
		} else if (departmentId != null && !"".equals(departmentId)) {
			return appealRepository.getOverHandleDaysByDepartmentId(departmentId, appealTypeId);
		} else {
			return appealRepository.getOverHandleDaysByEnterpriseId(enterpriseId, appealTypeId);
		}
	}

	@Override
	public List<AppealEntity> findUnconfirm() {
		return appealRepository.findByStatusLessThanOrderByCreateTimeDesc(5);
	}

	@Override
	public List<AppealEntity> findUnconfirmPaging(int page, int size) {
		Page<AppealEntity> appealPage = appealRepository.findByStatusLessThanOrderByCreateTimeDesc(5,
				new PageRequest(page, size));
		return appealPage.getContent();
	}

	@Override
	public List<AppealEntity> findConfirmed() {
		return appealRepository.findByStatusGreaterThanOrderByCreateTimeDesc(4);
	}

	@Override
	public List<AppealEntity> findConfirmedPaging(int page, int size) {
		Page<AppealEntity> appealPage = appealRepository.findByStatusGreaterThanOrderByCreateTimeDesc(4,
				new PageRequest(page, size));
		return appealPage.getContent();
	}

	@Override
	public List<AppealEntity> findByAppealTypeId(Long appealTypeId, Long departmentId) {
		if (departmentId == null || "".equals(departmentId)) {
			return appealRepository.findByAppealTypeIdOrderByCreateTimeDesc(appealTypeId);
		} else {
			return appealRepository.findByAppealTypeIdOrderByCreateTimeDesc(appealTypeId, departmentId);
		}
	}

	@Override
	public List<AppealEntity> findByAppealTypeIdAndStatus(Long appealTypeId, Integer status, Long departmentId) {
		if (departmentId == null || "".equals(departmentId)) {
			return appealRepository.findByAppealTypeIdAndStatusOrderByCreateTimeDesc(appealTypeId, status);
		} else {
			return appealRepository.findByAppealTypeIdAndStatusAndDepartmentIdOrderByCreateTimeDesc(appealTypeId,
					status, departmentId);
		}
	}

	@Override
	public List<AppealEntity> findByAppealTypeId(Long appealTypeId, Long departmentId, int page, int size) {
		int startIndex = (page - 1) * size;
		if (departmentId == null || "".equals(departmentId)) {
			return appealRepository.findByAppealTypeIdOrderByCreateTimeDesc(appealTypeId, startIndex, size);
		} else {
			return appealRepository.findByAppealTypeIdOrderByCreateTimeDesc(appealTypeId, departmentId, startIndex,
					size);
		}
	}

	@Override
	public List<UrgeEntity> getUrges(Long appealId) {
		return urgeRepository.findByAppealIdOrderByCreateTimeDesc(appealId);
	}

	@Override
	public List<UrgeEntity> getUrges(Long appealId, int page, int size) {
		Page<UrgeEntity> urgePage = urgeRepository.findByAppealIdOrderByCreateTimeDesc(appealId,
				new PageRequest(page, size));
		return urgePage.getContent();
	}

	/**
	 * enterprise
	 */
	@Override
	public List<AppealEntity> findByEnterpriseId(Long enterpriseId) {
		return appealRepository.findByEnterpriseIdOrderByCreateTimeDesc(enterpriseId);
	}

	@Override
	public List<AppealEntity> findByEnterpriseId(Long enterpriseId, int page, int size) {
		Page<AppealEntity> appealPage = appealRepository.findByEnterpriseIdOrderByCreateTimeDesc(enterpriseId,
				new PageRequest(page, size));
		return appealPage.getContent();
	}

	@Override
	public List<AppealEntity> findByEnterpriseIdUnconfirm(Long enterpriseId) {
		return appealRepository.findByEnterpriseIdAndStatusLessThanOrderByCreateTimeDesc(enterpriseId, 5);
	}

	@Override
	public List<AppealEntity> findByEnterpriseIdUnconfirm(Long enterpriseId, int page, int size) {
		Page<AppealEntity> appealPage = appealRepository
				.findByEnterpriseIdAndStatusLessThanOrderByCreateTimeDesc(enterpriseId, 5, new PageRequest(page, size));
		return appealPage.getContent();
	}

	@Override
	public List<AppealEntity> findByEnterpriseIdConfirmed(Long enterpriseId) {
		return appealRepository.findByEnterpriseIdAndStatusGreaterThanOrderByCreateTimeDesc(enterpriseId, 4);
	}

	@Override
	public List<AppealEntity> findByEnterpriseIdConfirmed(Long enterpriseId, int page, int size) {
		Page<AppealEntity> appealPage = appealRepository.findByEnterpriseIdAndStatusGreaterThanOrderByCreateTimeDesc(
				enterpriseId, 4, new PageRequest(page, size));
		return appealPage.getContent();
	}

	@Override
	public List<AppealEntity> searchByEnterpriseName(String name) {
		List<EnterpriseEntity> list = enterpriseRepository.findByNameLike("%" + name + "%");
		return appealRepository.findByEnterpriseInOrderByCreateTimeDesc(list);
	}

	@Override
	public List<AppealEntity> searchByEnterpriseName(String name, int page, int size) {
		List<EnterpriseEntity> list = enterpriseRepository.findByNameLike("%" + name + "%");
		Page<AppealEntity> appealPage = appealRepository.findByEnterpriseInOrderByCreateTimeDesc(list,
				new PageRequest(page, size));
		return appealPage.getContent();
	}

	@Override
	public List<AppealEntity> findByEnterpriseIn(List<EnterpriseEntity> list) {
		return appealRepository.findByEnterpriseInAndStatusGreaterThanOrderByCreateTimeDesc(list, 0);
	}

	@Override
	public List<AppealEntity> findByEnterpriseIn(List<EnterpriseEntity> list, int page, int size) {
		Page<AppealEntity> appealPage = appealRepository
				.findByEnterpriseInAndStatusGreaterThanOrderByCreateTimeDesc(list, 0, new PageRequest(page, size));
		return appealPage.getContent();
	}

	/**
	 * department
	 */
	@Override
	public List<AppealEntity> findByDepartmentId(Long departmentId) {
		return appealRepository.findByDepartmentIdOrderByCreateTimeDesc(departmentId);
	}

	@Override
	public List<AppealEntity> findByDepartmentId(Long departmentId, int page, int size) {
		Page<AppealEntity> appealPage = appealRepository.findByDepartmentIdOrderByCreateTimeDesc(departmentId,
				new PageRequest(page, size));
		return appealPage.getContent();
	}

	@Override
	public List<AppealEntity> findByDepartmentIdUnconfirm(Long departmentId) {
		return appealRepository.findByDepartmentIdAndStatusLessThanOrderByCreateTimeDesc(departmentId, 5);
	}

	@Override
	public List<AppealEntity> findByDepartmentIdUnconfirm(Long departmentId, int page, int size) {
		Page<AppealEntity> appealPage = appealRepository
				.findByDepartmentIdAndStatusLessThanOrderByCreateTimeDesc(departmentId, 5, new PageRequest(page, size));
		return appealPage.getContent();
	}

	@Override
	public List<AppealEntity> findByDepartmentIdConfirmed(Long departmentId) {
		return appealRepository.findByDepartmentIdAndStatusGreaterThanOrderByCreateTimeDesc(departmentId, 4);
	}

	@Override
	public List<AppealEntity> findByDepartmentIdConfirmed(Long departmentId, int page, int size) {
		Page<AppealEntity> appealPage = appealRepository.findByDepartmentIdAndStatusGreaterThanOrderByCreateTimeDesc(
				departmentId, 4, new PageRequest(page, size));
		return appealPage.getContent();
	}

	public List<AppealEntity> findByDepartmentIdAndEnterpriseName(Long departmentId, String name) {
		List<EnterpriseEntity> list = enterpriseRepository.findByNameLike("%" + name + "%");
		return appealRepository.findByDepartmentIdAndEnterpriseInOrderByCreateTimeDesc(departmentId, list);
	}

	public List<AppealEntity> findByDepartmentIdAndEnterpriseName(Long departmentId, String name, int page, int size) {
		List<EnterpriseEntity> list = enterpriseRepository.findByNameLike("%" + name + "%");
		Page<AppealEntity> appealPage = appealRepository.findByDepartmentIdAndEnterpriseInOrderByCreateTimeDesc(
				departmentId, list, new PageRequest(page, size));
		return appealPage.getContent();
	}

	/**
	 * chart
	 */
	@Override
	public List<BigInteger> getOverAcceptDays(Long enterpriseId) {
		return appealRepository.getAllOverAcceptDaysByEnterpriseId(enterpriseId);
	}

	@Override
	public List<BigInteger> getOverHandleDays(Long enterpriseId) {
		return appealRepository.getAllOverHandleDaysByEnterpriseId(enterpriseId);
	}

}