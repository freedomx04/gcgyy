package com.hongmeng.gcgyy.repository.assist;

import java.math.BigInteger;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hongmeng.gcgyy.entity.assist.AppealEntity;
import com.hongmeng.gcgyy.entity.authority.EnterpriseEntity;

public interface AppealRepositoy extends PagingAndSortingRepository<AppealEntity, Long> {

	Iterable<AppealEntity> findByIdIn(List<Long> appealIds);

	@Query(value = "select ap.appeal_type_id, bap.name, count(*) from assist_appeal ap, base_appeal_type bap "
			+ "where ap.appeal_type_id = bap.id and ap.status <>0 group by ap.appeal_type_id, bap.name", nativeQuery = true)
	List<Object[]> getAppealCountByType();

	@Query(value = "select ap.appeal_type_id, bap.name, count(*) from assist_appeal ap, base_appeal_type bap "
			+ "where ap.appeal_type_id = bap.id and ap.status <>0 and ap.department_id = ?1 "
			+ "group by ap.appeal_type_id, bap.name", nativeQuery = true)
	List<Object[]> getAppealCountByType(Long departmentId);

	@Query(value = "select ap.id from assist_appeal ap, base_appeal_type apt where ap.appeal_type_id = apt.id "
			+ "and (((TIMESTAMPDIFF(SECOND,ap.dispatch_time,now()) > apt.accept_days*24*60*60) "
			+ "and ap.dispatch_time is not null and ap.status=2) or((TIMESTAMPDIFF(SECOND,ap.accept_time,now()) > apt.handle_days*24*60*60) "
			+ "and ap.accept_time is not null  and ap.status=3)) limit ?1, ?2", nativeQuery = true)
	List<BigInteger> getAllOverDaysByTypeId(int startIndex, int size);

	@Query(value = "select ap.id from assist_appeal ap, base_appeal_type apt where ap.appeal_type_id = apt.id and ap.department_id = ?1 "
			+ "and (((TIMESTAMPDIFF(SECOND,ap.dispatch_time,now()) > apt.accept_days*24*60*60) "
			+ "and ap.dispatch_time is not null and ap.status=2) or((TIMESTAMPDIFF(SECOND,ap.accept_time,now()) > apt.handle_days*24*60*60) "
			+ "and ap.accept_time is not null  and ap.status=3)) limit ?2, ?3", nativeQuery = true)
	List<BigInteger> getOverDaysByTypeId(Long departmentId, int startIndex, int size);

	@Query(value = "select ap.id from assist_appeal ap, base_appeal_type apt where ap.appeal_type_id = apt.id "
			+ "and (((TIMESTAMPDIFF(SECOND,ap.dispatch_time,now()) > apt.accept_days*24*60*60) "
			+ "and ap.dispatch_time is not null and ap.status=2) or((TIMESTAMPDIFF(SECOND,ap.accept_time,now()) > apt.handle_days*24*60*60) "
			+ "and ap.accept_time is not null  and ap.status=3)) and ap.appeal_type_id=?1 limit ?2,?3", nativeQuery = true)
	List<BigInteger> getAllOverDaysByTypeId(Long appealTypeId, int startIndex, int size);

	@Query(value = "select ap.id from assist_appeal ap, base_appeal_type apt where ap.appeal_type_id = apt.id  and ap.department_id = ?1 "
			+ "and (((TIMESTAMPDIFF(SECOND,ap.dispatch_time,now()) > apt.accept_days*24*60*60) "
			+ "and ap.dispatch_time is not null and ap.status=2) or((TIMESTAMPDIFF(SECOND,ap.accept_time,now()) > apt.handle_days*24*60*60) "
			+ "and ap.accept_time is not null  and ap.status=3)) and ap.appeal_type_id=?2 limit ?3,?4", nativeQuery = true)
	List<BigInteger> getOverDaysByTypeId(Long departmentId, Long appealTypeId, int startIndex, int size);

	@Query(value = "select count(*) from assist_appeal ap, base_appeal_type apt where ap.appeal_type_id = apt.id "
			+ "and ap.appeal_type_id=?1 and (TIMESTAMPDIFF(SECOND,ap.dispatch_time,now()) > apt.accept_days*24*60*60) "
			+ "and ap.dispatch_time is not null and ap.status=2", nativeQuery = true)
	BigInteger getOverAcceptDaysCount(Long appealTypeId);

	@Query(value = "select count(*) from assist_appeal ap, base_appeal_type apt where ap.appeal_type_id = apt.id and ap.department_id=?1 "
			+ "and ap.appeal_type_id=?2 and (TIMESTAMPDIFF(SECOND,ap.dispatch_time,now()) > apt.accept_days*24*60*60) "
			+ "and ap.dispatch_time is not null and ap.status=2", nativeQuery = true)
	BigInteger getOverAcceptDaysCount(Long departmentId, Long appealTypeId);

	@Query(value = "select count(*) from assist_appeal ap, base_appeal_type apt where ap.appeal_type_id = apt.id "
			+ "and ap.appeal_type_id=?1 and (TIMESTAMPDIFF(SECOND,ap.accept_time,now()) > apt.handle_days*24*60*60) and ap.accept_time is not null "
			+ "and ap.status=3", nativeQuery = true)
	BigInteger getOverHandleDaysCount(Long appealTypeId);

	@Query(value = "select count(*) from assist_appeal ap, base_appeal_type apt where ap.appeal_type_id = apt.id and ap.department_id=?1 "
			+ "and ap.appeal_type_id=?2 and (TIMESTAMPDIFF(SECOND,ap.accept_time,now()) > apt.handle_days*24*60*60) and ap.accept_time is not null "
			+ "and ap.status=3", nativeQuery = true)
	BigInteger getOverHandleDaysCount(Long departmentId, Long appealTypeId);

	@Query(value = "select ap.id from assist_appeal ap, base_appeal_type apt where ap.appeal_type_id = apt.id "
			+ "and (TIMESTAMPDIFF(SECOND,ap.dispatch_time,now()) > apt.accept_days*24*60*60) "
			+ "and ap.dispatch_time is not null and ap.status=2 and ap.enterprise_id = ?1", nativeQuery = true)
	List<BigInteger> getAllOverAcceptDaysByEnterpriseId(Long enterpriseId);

	@Query(value = "select ap.id from assist_appeal ap, base_appeal_type apt where ap.appeal_type_id = apt.id "
			+ "and (TIMESTAMPDIFF(SECOND,ap.dispatch_time,now()) > apt.accept_days*24*60*60) "
			+ "and ap.dispatch_time is not null and apt.id = ?1 and ap.status=2", nativeQuery = true)
	List<BigInteger> getOverAcceptDays(Long appealTypeId);

	@Query(value = "select ap.id from assist_appeal ap, base_appeal_type apt where ap.appeal_type_id = apt.id "
			+ "and (TIMESTAMPDIFF(SECOND,ap.dispatch_time,now()) > apt.accept_days*24*60*60) "
			+ "and ap.dispatch_time is not null and apt.id = ?2 and ap.department_id = ?1 and ap.status=2", nativeQuery = true)
	List<BigInteger> getOverAcceptDaysByDepartmentId(Long departmentId, Long appealTypeId);

	@Query(value = "select ap.id from assist_appeal ap, base_appeal_type apt where ap.appeal_type_id = apt.id "
			+ "and (TIMESTAMPDIFF(SECOND,ap.dispatch_time,now()) > apt.accept_days*24*60*60) "
			+ "and ap.dispatch_time is not null and apt.id = ?2 and ap.enterprise_id = ?1 and ap.status=2", nativeQuery = true)
	List<BigInteger> getOverAcceptDaysByEnterpriseId(Long enterpriseId, Long appealTypeId);

	@Query(value = "select ap.id from assist_appeal ap, base_appeal_type apt where ap.appeal_type_id = apt.id "
			+ "and (TIMESTAMPDIFF(SECOND,ap.accept_time,now()) > apt.handle_days*24*60*60) "
			+ "and ap.accept_time is not null and ap.status=3 and ap.enterprise_id = ?1", nativeQuery = true)
	List<BigInteger> getAllOverHandleDaysByEnterpriseId(Long enterpriseId);

	@Query(value = "select ap.id from assist_appeal ap, base_appeal_type apt where ap.appeal_type_id = apt.id "
			+ "and (TIMESTAMPDIFF(SECOND,ap.accept_time,now()) > apt.handle_days*24*60*60) "
			+ "and ap.accept_time is not null and apt.id = ?1 and ap.status=3", nativeQuery = true)
	List<BigInteger> getOverHandleDays(Long appealTypeId);

	@Query(value = "select ap.id from assist_appeal ap, base_appeal_type apt where ap.appeal_type_id = apt.id "
			+ "and (TIMESTAMPDIFF(SECOND,ap.accept_time,now()) > apt.handle_days*24*60*60) "
			+ "and ap.accept_time is not null and apt.id = ?2 and ap.enterprise_id = ?1 and ap.status=3", nativeQuery = true)
	List<BigInteger> getOverHandleDaysByEnterpriseId(Long enterpriseId, Long appealTypeId);

	@Query(value = "select ap.id from assist_appeal ap, base_appeal_type apt where ap.appeal_type_id = apt.id "
			+ "and (TIMESTAMPDIFF(SECOND,ap.accept_time,now()) > apt.handle_days*24*60*60) "
			+ "and ap.accept_time is not null and apt.id = ?2 and ap.department_id = ?1 and ap.status=3", nativeQuery = true)
	List<BigInteger> getOverHandleDaysByDepartmentId(Long departmentId, Long appealTypeId);

	List<AppealEntity> findAllByOrderByCreateTimeDesc();

	Page<AppealEntity> findAllByOrderByCreateTimeDesc(Pageable pageable);

	List<AppealEntity> findByStatusGreaterThanOrderByCreateTimeDesc(Integer status);

	Page<AppealEntity> findByStatusGreaterThanOrderByCreateTimeDesc(Integer status, Pageable pageable);

	List<AppealEntity> findByStatusLessThanOrderByCreateTimeDesc(Integer status);

	Page<AppealEntity> findByStatusLessThanOrderByCreateTimeDesc(Integer status, Pageable pageable);

	@Query(value = "select * from assist_appeal ap where ap.status <>0 and ap.appeal_type_id = ?1 order by ap.create_time desc", nativeQuery = true)
	List<AppealEntity> findByAppealTypeIdOrderByCreateTimeDesc(Long appealTypeId);

	@Query(value = "select * from assist_appeal ap where ap.status <>0 and ap.appeal_type_id = ?1 and ap.department_id =?2 "
			+ "order by ap.create_time desc", nativeQuery = true)
	List<AppealEntity> findByAppealTypeIdOrderByCreateTimeDesc(Long appealTypeId, Long departmentId);

	List<AppealEntity> findByAppealTypeIdAndStatusOrderByCreateTimeDesc(Long appealTypeId, Integer status);

	List<AppealEntity> findByAppealTypeIdAndStatusAndDepartmentIdOrderByCreateTimeDesc(Long appealTypeId,
			Integer status, Long departmentId);

	@Query(value = "select * from assist_appeal ap where ap.status <>0 and ap.appeal_type_id = ?1 order by ap.create_time desc limit ?2,?3", nativeQuery = true)
	List<AppealEntity> findByAppealTypeIdOrderByCreateTimeDesc(Long appealTypeId, int startIndex, int size);

	@Query(value = "select * from assist_appeal ap where ap.status <>0 and ap.appeal_type_id = ?1 and ap.department_id = ?2 "
			+ "order by ap.create_time desc limit ?3,?4", nativeQuery = true)
	List<AppealEntity> findByAppealTypeIdOrderByCreateTimeDesc(Long appealTypeId, Long departmentId, int startIndex,
			int size);

	/**
	 * enterprise
	 */
	List<AppealEntity> findByEnterpriseIdOrderByCreateTimeDesc(Long enterpriseId);

	Page<AppealEntity> findByEnterpriseIdOrderByCreateTimeDesc(Long enterpriseId, Pageable pageable);

	List<AppealEntity> findByEnterpriseIdAndStatusGreaterThanOrderByCreateTimeDesc(Long enterpriseId, Integer status);

	Page<AppealEntity> findByEnterpriseIdAndStatusGreaterThanOrderByCreateTimeDesc(Long enterpriseId, Integer status,
			Pageable pageable);

	List<AppealEntity> findByEnterpriseIdAndStatusLessThanOrderByCreateTimeDesc(Long enterpriseId, Integer status);

	Page<AppealEntity> findByEnterpriseIdAndStatusLessThanOrderByCreateTimeDesc(Long enterpriseId, Integer status,
			Pageable pageable);

	List<AppealEntity> findByEnterpriseInOrderByCreateTimeDesc(List<EnterpriseEntity> list);

	Page<AppealEntity> findByEnterpriseInOrderByCreateTimeDesc(List<EnterpriseEntity> list, Pageable pageable);
	
	List<AppealEntity> findByEnterpriseInAndStatusGreaterThanOrderByCreateTimeDesc(List<EnterpriseEntity> list, Integer status);
	
	Page<AppealEntity> findByEnterpriseInAndStatusGreaterThanOrderByCreateTimeDesc(List<EnterpriseEntity> list, Integer status, Pageable pageable);

	/**
	 * department
	 */
	List<AppealEntity> findByDepartmentIdOrderByCreateTimeDesc(Long departmentId);

	Page<AppealEntity> findByDepartmentIdOrderByCreateTimeDesc(Long departmentId, Pageable pageable);

	List<AppealEntity> findByDepartmentIdAndStatusGreaterThanOrderByCreateTimeDesc(Long departmentId, Integer status);

	Page<AppealEntity> findByDepartmentIdAndStatusGreaterThanOrderByCreateTimeDesc(Long departmentId, Integer status,
			Pageable pageable);

	List<AppealEntity> findByDepartmentIdAndStatusLessThanOrderByCreateTimeDesc(Long departmentId, Integer status);

	Page<AppealEntity> findByDepartmentIdAndStatusLessThanOrderByCreateTimeDesc(Long departmentId, Integer status,
			Pageable pageable);

	List<AppealEntity> findByDepartmentIdAndEnterpriseInOrderByCreateTimeDesc(Long departmentId,
			List<EnterpriseEntity> list);

	Page<AppealEntity> findByDepartmentIdAndEnterpriseInOrderByCreateTimeDesc(Long departmentId,
			List<EnterpriseEntity> list, Pageable pageable);
}
