package com.hongmeng.gcgyy.common.utils;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class FormulaUtils {

	static Logger log = LoggerFactory.getLogger(FormulaUtils.class);
	
	public static String getYear(String monthly) {
		return StringUtils.split(monthly, "-")[0];
	}
	
	public static String getNowMonthly() {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		return sdf.format(date);
	}
	
	public static String getPercent(float complete, float target) {
		if (complete != 0 && target != 0) {
			float num = complete / target;
			DecimalFormat df = new DecimalFormat("0.0000"); // 格式化小数
			return df.format(num);
		}
		return null;
	}
	
	public static String getGrowth(float current, float last) {
		if (current != 0 && last != 0) {
			float num = (current - last) / last;
			DecimalFormat df = new DecimalFormat("0.0000"); // 格式化小数
			return df.format(num);
		}
		return null;
	}
	
	public static String getGrowth(String currentStr, String lastStr) {
		//Double current = Double.valueOf(currentStr);
		//Double last = Double.valueOf(lastStr);
		Double current = (null == currentStr || "".equals(currentStr)) ? new Double(0) : Double.valueOf(currentStr);
		Double last = (null == lastStr || "".equals(lastStr)) ? new Double(0) : Double.valueOf(lastStr);
		
		if (current != 0 && last != 0) {
			double num = (current - last) / last;
			DecimalFormat df = new DecimalFormat("0.0000"); // 格式化小数
			return df.format(num);
		}
		return null;
	}
	
	public static Double convertPercent(String num) {
		Double ret = Double.valueOf(num);
		return ret * 100;
	}
	
	public static Double convertDouble(float num) {
		Double ret = Double.parseDouble(String.valueOf(num));
		return ret;
	}

	public static String getLastYearMonthly(String monthly) {
		String[] splits = StringUtils.split(monthly, "-");
		Integer year = Integer.parseInt(splits[0]);
		String month = splits[1];

		String ret = String.valueOf(year - 1) + "-" + month;
		return ret;
	}

	public static String getLastMonthMonthly(String monthly) {
		String[] splits = StringUtils.split(monthly, "-");
		Integer year = Integer.parseInt(splits[0]);
		Integer month = Integer.parseInt(splits[1]);

		String ret = null;
		if (month == 1) {
			ret = String.valueOf(year - 1) + "-12";
		} else {
			String lastMonth = String.valueOf(month - 1);
			ret = year.toString() + "-" + (lastMonth.length() == 1 ? 0 + lastMonth : lastMonth);
		}
		return ret;
	}
	
	public static List<String> getEndMonthList(String monthly) {
		List<String> ret = new LinkedList<>();
		
		String[] startSplits = StringUtils.split(monthly, "-");
		String year = startSplits[0];
		int month = Integer.parseInt(startSplits[1]);
		
		for (int i = 1; i <= month; i++) {
			String str = String.valueOf(i);
			ret.add(year + "-" + (str.length() == 1 ? 0 + str : str));
		}
		
		return ret;
	}
	
	public static List<String> getMonthlyList(String start, String end) {
		List<String> ret = new LinkedList<>();
		
		String[] startSplits = StringUtils.split(start, "-");
		int start_year = Integer.parseInt(startSplits[0]);
		int start_month = Integer.parseInt(startSplits[1]);
		
		String[] endSplits = StringUtils.split(end, "-");
		int end_year = Integer.parseInt(endSplits[0]);
		int end_month = Integer.parseInt(endSplits[1]);
		
		if (start_year == end_year) {
			for (int i = start_month; i <= end_month; i++) {
				String str = String.valueOf(i);
				ret.add(String.valueOf(start_year) + "-" + (str.length() == 1 ? 0 + str : str));
			}
		} else {
			for (int i = start_month; i <= 12; i++) {
				String str = String.valueOf(i);
				ret.add(String.valueOf(start_year) + "-" + (str.length() == 1 ? 0 + str : str));
			}
			
			for (int y = start_year + 1; y < end_year; y++) {
				for (int m = 1; m <= 12; m++) {
					String str = String.valueOf(m);
					ret.add(String.valueOf(y) + "-" + (str.length() == 1 ? 0 + str : str));
				}
			}
			
			for (int k = 1; k <= end_month; k++) {
				String str = String.valueOf(k);
				ret.add(String.valueOf(end_year) + "-" + (str.length() == 1 ? 0 + str : str));
			}
		}
		
		return ret;
	}
	
}
