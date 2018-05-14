package com.hongmeng.gcgyy.service.monitor;

import java.io.InputStream;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;

public interface ReportFormService {
	
	HSSFWorkbook createTemplate(String monthly, Integer type) throws Exception;
	
	HSSFWorkbook export(String monthly, Integer type) throws Exception;
	
	HSSFWorkbook export(BaseEnterpriseEntity enterprise, Integer type) throws Exception;
	
	void importEnergy(InputStream is) throws Exception;
	
	void importEconomic(InputStream is) throws Exception;
	
	void importBenefit(InputStream is) throws Exception;
	
	void importNationalTax(InputStream is) throws Exception;
	
	void importLocalTax(InputStream is) throws Exception;

}
