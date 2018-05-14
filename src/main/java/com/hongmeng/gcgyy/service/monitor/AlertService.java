package com.hongmeng.gcgyy.service.monitor;

import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;

public interface AlertService {
	
	AlertEnterpriseVO detailEnterprise(String monthly, BaseEnterpriseEntity enterprise);
	
	AlertReportVO detailReport(String monthly, BaseEnterpriseEntity enterprise);

}
