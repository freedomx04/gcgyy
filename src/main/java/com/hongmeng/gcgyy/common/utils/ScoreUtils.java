package com.hongmeng.gcgyy.common.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ScoreUtils {
	
	static Logger log = LoggerFactory.getLogger(ScoreUtils.class);
	
	public static boolean checkReportTime(String monthly, Integer days) {
		Date now = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(now);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		String nowStr = sdf.format(now);
		String lastMonthStr = FormulaUtils.getLastMonthMonthly(nowStr);
		
		if (!monthly.equals(lastMonthStr)) {
			return false;
		}
		
		int nowDay = cal.get(Calendar.DAY_OF_MONTH);
		if (nowDay > days) {
			return false;
		}
		
		return true;
	}
	
}