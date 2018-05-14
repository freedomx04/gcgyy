package com.hongmeng.gcgyy.service.ranking;

import java.io.InputStream;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public interface RankingReportService {
	
	HSSFWorkbook createTemplate(String monthly, Integer type) throws Exception;
	
	void importReport(InputStream is, Integer type) throws Exception;
	
	HSSFWorkbook export(String monthly, Integer type) throws Exception;

}
