package com.hongmeng.gcgyy.repository.authority;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.hongmeng.gcgyy.entity.authority.VisitEntity;

public interface VisitRepository extends PagingAndSortingRepository<VisitEntity, Long> {

	@Query(value = "SELECT date, COUNT(*) FROM authority_visit GROUP BY date order by date desc;", nativeQuery = true)
	List<?> listByDate();

}
