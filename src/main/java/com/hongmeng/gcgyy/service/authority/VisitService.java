package com.hongmeng.gcgyy.service.authority;

import java.util.List;

import com.hongmeng.gcgyy.entity.authority.VisitEntity;

public interface VisitService {
	
	void save(VisitEntity visit);
	
	List<?> listByDate();
	
}
