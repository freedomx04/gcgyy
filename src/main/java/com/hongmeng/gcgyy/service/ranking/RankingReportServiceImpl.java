package com.hongmeng.gcgyy.service.ranking;

import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.entity.baseData.CountyEntity;
import com.hongmeng.gcgyy.entity.ranking.ElectricityEntity;
import com.hongmeng.gcgyy.entity.ranking.IndustryAdditionEntity;
import com.hongmeng.gcgyy.entity.ranking.IndustryOutputEntity;
import com.hongmeng.gcgyy.entity.ranking.MainBusinessEntity;
import com.hongmeng.gcgyy.entity.ranking.ProfitEntity;
import com.hongmeng.gcgyy.entity.ranking.ProfitTaxEntity;
import com.hongmeng.gcgyy.entity.ranking.VatEntity;
import com.hongmeng.gcgyy.service.baseData.CountyService;
import com.hongmeng.gcgyy.service.monitor.ExcelCell;

@Service
public class RankingReportServiceImpl implements RankingReportService {
	
	@Autowired
	CountyService countyService;
	
	@Autowired
	IndustryAdditionService additionService;
	
	@Autowired
	MainBusinessService businessService;
	
	@Autowired
	ProfitTaxService taxService;
	
	@Autowired
	ElectricityService electricityService;
	
	@Autowired
	IndustryOutputService outputService;
	
	@Autowired
	VatService vatService;
	
	@Autowired
	ProfitService profitService;
	
	public class RankingReportType {
		public static final int INDUSTRYADDITION = 1;
		public static final int MAINBUSINESS = 2;
		public static final int PROFITTAX = 3;
		public static final int ELECTRICITY = 4;
		public static final int INDUSTRYOUTPUT = 5;
		public static final int VAT = 6;
		public static final int PROFIT = 7;
	}
	
	@SuppressWarnings("serial")
	public static HashMap<Integer, String> templateTitle = new HashMap<Integer, String>() {{
		put(RankingReportType.INDUSTRYADDITION, "工业增加值");
		put(RankingReportType.MAINBUSINESS, "主营业务收入");
		put(RankingReportType.PROFITTAX, "主营业务成本");
		put(RankingReportType.ELECTRICITY, "工业用电");
		put(RankingReportType.INDUSTRYOUTPUT, "工业总产值");
		put(RankingReportType.VAT, "亏损企业亏损总额");
		put(RankingReportType.PROFIT, "利润总额");
	}};
	
	@SuppressWarnings("serial")
	public static HashMap<Integer, String> reportColumn = new HashMap<Integer, String>() {{
		put(RankingReportType.INDUSTRYADDITION, "monthly, county, month_growth, total_growth, sort");
		put(RankingReportType.MAINBUSINESS, "monthly, county, total, year_growth, sort");
		put(RankingReportType.PROFITTAX, "monthly, county, total, year_growth");
		put(RankingReportType.ELECTRICITY, "monthly, county, total_electricity, year_growth, sort");
		put(RankingReportType.INDUSTRYOUTPUT, "monthly, county, enterprise_num, total, year_growth");
		put(RankingReportType.VAT, "monthly, county, total, year_growth");
		put(RankingReportType.PROFIT, "monthly, county, total, year_growth, sort");
	}};
	
	@SuppressWarnings("serial")
	public static HashMap<String, ExcelCell> excelCell = new HashMap<String, ExcelCell>() {{
		put("monthly", new ExcelCell("monthly", 4000, "月报表时间"));
		put("county", new ExcelCell("county", 4000, "县区名称"));
		put("total", new ExcelCell("total", 6000, "本月止累计（万元）"));
		put("total_electricity", new ExcelCell("total", 6000, "本月止累计（万千瓦时）"));
		put("year_growth", new ExcelCell("year_growth", 4000, "同比±%"));
		put("sort", new ExcelCell("sort", 4000, "增幅排序"));
		put("absolute_sort", new ExcelCell("sort", 4000, "绝对额排序"));
		put("enterprise_num", new ExcelCell("enterprise_num", 4000, "企业户数"));
		put("month_growth", new ExcelCell("month_growth", 4000, "当月增幅"));
		put("total_growth", new ExcelCell("total_growth", 4000, "累计增幅"));
	}};

	@Override
	public HSSFWorkbook createTemplate(String monthly, Integer type) throws Exception {
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet("sheet1");
		
		// 创建单元格样式
		HSSFCellStyle style = wb.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		
		// 设置标题 
		HSSFRow titleRow = sheet.createRow(0);
		titleRow.setHeight((short) 300);// 设定行的高度
		String[] titles = StringUtils.split(reportColumn.get(type), ",");
		for (int i = 0; i < titles.length; i++) {
			String title = titles[i].trim();
			HSSFCell cell = titleRow.createCell(i);
			cell.setCellStyle(style);
			sheet.setColumnWidth(i, excelCell.get(title).getWidth());
			cell.setCellValue(excelCell.get(title).getTitle());
		}
		
		// 县区列表
		List<CountyEntity> countyList = countyService.list();
		int colnum = 1;
		for (CountyEntity county: countyList) {
			HSSFRow row = sheet.createRow(colnum);
			row.setHeight((short) 300);
			row.createCell(0).setCellValue(monthly);
			row.createCell(1).setCellValue(county.getName());
			colnum++;
		}
		
		return wb;
	}
	
	private HSSFWorkbook wb;

	@Override
	public void importReport(InputStream is, Integer type) throws Exception {
		wb = new HSSFWorkbook(is);
		HSSFSheet sheet = wb.getSheetAt(0);
		
		HSSFCell cell = null;
		switch (type) {
		case RankingReportType.INDUSTRYADDITION:
		case RankingReportType.MAINBUSINESS:
		case RankingReportType.PROFITTAX:
		case RankingReportType.ELECTRICITY:
		case RankingReportType.PROFIT:
			for (int i = 1; i <= sheet.getLastRowNum(); i++) {
				HSSFRow row = sheet.getRow(i);
				if (null == row) {
					continue;
				}
				
				String monthly = row.getCell(0).getStringCellValue();
				String countyName = row.getCell(1).getStringCellValue();
				Double total = null;
				Double yearGrowth = null;
				Integer sort = null;
				
				cell = row.getCell(2);
				if (cell != null) {
					if (cell.getCellType() != HSSFCell.CELL_TYPE_NUMERIC) {
						throw new IllegalArgumentException("argument error");
					}
					total = cell.getNumericCellValue();
				}
				
				cell = row.getCell(3);
				if (cell != null) {
					if (cell.getCellType() != HSSFCell.CELL_TYPE_NUMERIC) {
						throw new IllegalArgumentException("argument error");
					}
					yearGrowth = cell.getNumericCellValue();
				}
				
				cell = row.getCell(4);
				if (cell != null) {
					if (cell.getCellType() != HSSFCell.CELL_TYPE_NUMERIC) {
						throw new IllegalArgumentException("argument error");
					}
					sort = (int) cell.getNumericCellValue();
				}
				
				CountyEntity county = countyService.findByName(countyName);
				if (county == null) {
					continue;
				}
				
				switch (type) {
				case RankingReportType.INDUSTRYADDITION:
					IndustryAdditionEntity addition = additionService.findOne(monthly, county.getId());
					if (addition != null) {
						addition.setMonthGrowth(total);
						addition.setTotalGrowth(yearGrowth);
						addition.setSort(sort);
						additionService.save(addition);
					} else {
						addition = new IndustryAdditionEntity(monthly, county, total, yearGrowth, sort);
						addition.setCreateTime(new Date());
						additionService.save(addition);
					}					
					break;
					
				case RankingReportType.MAINBUSINESS:
					MainBusinessEntity business = businessService.findOne(monthly, county.getId());
					if (business != null) {
						business.setTotal(total);
						business.setYearGrowth(yearGrowth);
						business.setSort(sort);
						businessService.save(business);
					} else {
						business = new MainBusinessEntity(monthly, county, total, yearGrowth, sort);
						business.setCreateTime(new Date());
						businessService.save(business);
					}
					break;
					
				case RankingReportType.PROFITTAX:
					ProfitTaxEntity tax = taxService.findOne(monthly, county.getId());
					if (tax != null) {
						tax.setTotal(total);
						tax.setYearGrowth(yearGrowth);
						taxService.save(tax);
					} else {
						tax = new ProfitTaxEntity(monthly, county, total, yearGrowth);
						tax.setCreateTime(new Date());
						taxService.save(tax);
					}
					break;
					
				case RankingReportType.ELECTRICITY:
					ElectricityEntity electricity = electricityService.findOne(monthly, county.getId());
					if (electricity != null) {
						electricity.setTotal(total);
						electricity.setYearGrowth(yearGrowth);
						electricity.setSort(sort);
						electricityService.save(electricity);
					} else {
						electricity = new ElectricityEntity(monthly, county, total, yearGrowth, sort);
						electricity.setCreateTime(new Date());
						electricityService.save(electricity);
					}
					break;
					
				case RankingReportType.PROFIT:
					ProfitEntity profit = profitService.findOne(monthly, county.getId());
					if (profit != null) {
						profit.setTotal(total);
						profit.setYearGrowth(yearGrowth);
						profit.setSort(sort);
						profitService.save(profit);
					} else {
						profit = new ProfitEntity(monthly, county, total, yearGrowth, sort);
						profit.setCreateTime(new Date());
						profitService.save(profit);
					}
					break;
				}
			}
			
			break;
		
		case RankingReportType.INDUSTRYOUTPUT:
			for (int i = 1; i <= sheet.getLastRowNum(); i++) {
				HSSFRow row = sheet.getRow(i);
				if (null == row) {
					continue;
				}
				
				String monthly = row.getCell(0).getStringCellValue();
				String countyName = row.getCell(1).getStringCellValue();
				Integer enterpriseNum = null;
				Double total = null;
				Double yearGrowth = null;
				
				cell = row.getCell(2);
				if (cell != null) {
					if (cell.getCellType() != HSSFCell.CELL_TYPE_NUMERIC) {
						throw new IllegalArgumentException("argument error");
					}
					enterpriseNum = (int) cell.getNumericCellValue();
				}
				
				cell = row.getCell(3);
				if (cell != null) {
					if (cell.getCellType() != HSSFCell.CELL_TYPE_NUMERIC) {
						throw new IllegalArgumentException("argument error");
					}
					total = cell.getNumericCellValue();
				}
				
				cell = row.getCell(4);
				if (cell != null) {
					if (cell.getCellType() != HSSFCell.CELL_TYPE_NUMERIC) {
						throw new IllegalArgumentException("argument error");
					}
					yearGrowth = cell.getNumericCellValue();
				}
				
				CountyEntity county = countyService.findByName(countyName);
				if (county == null) {
					continue;
				}
				
				IndustryOutputEntity output = outputService.findOne(monthly, county.getId());
				if (output != null) {
					output.setEnterpriseNum(enterpriseNum);
					output.setTotal(total);
					output.setYearGrowth(yearGrowth);
					outputService.save(output);
				} else {
					output = new IndustryOutputEntity(monthly, county, enterpriseNum, total, yearGrowth);
					output.setCreateTime(new Date());
					outputService.save(output);
				}
			}
			break;
			
		case RankingReportType.VAT:
			for (int i = 1; i <= sheet.getLastRowNum(); i++) {
				HSSFRow row = sheet.getRow(i);
				if (null == row) {
					continue;
				}
				
				String monthly = row.getCell(0).getStringCellValue();
				String countyName = row.getCell(1).getStringCellValue();
				Double total = null;
				Double yearGrowth = null;
				
				cell = row.getCell(2);
				if (cell != null) {
					if (cell.getCellType() != HSSFCell.CELL_TYPE_NUMERIC) {
						throw new IllegalArgumentException("argument error");
					}
					total = cell.getNumericCellValue();
				}
				
				cell = row.getCell(3);
				if (cell != null) {
					if (cell.getCellType() != HSSFCell.CELL_TYPE_NUMERIC) {
						throw new IllegalArgumentException("argument error");
					}
					yearGrowth = cell.getNumericCellValue();
				}
				
				CountyEntity county = countyService.findByName(countyName);
				if (county == null) {
					continue;
				}
				
				VatEntity vat = vatService.findOne(monthly, county.getId());
				if (vat != null) {
					vat.setTotal(total);
					vat.setYearGrowth(yearGrowth);
					vatService.save(vat);
				} else {
					vat = new VatEntity(monthly, county, total, yearGrowth);
					vat.setCreateTime(new Date());
					vatService.save(vat);
				}
			}
			break;
		default:
			break;
		}
	}
	
	@Override
	public HSSFWorkbook export(String monthly, Integer type) throws Exception {
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet("sheet1");
		
		// 创建单元格样式
		HSSFCellStyle style = wb.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		
		HSSFRow titleRow = sheet.createRow(0);
		titleRow.setHeight((short) 300);// 设定行的高度
		String[] titles = StringUtils.split(reportColumn.get(type), ",");
		for (int i = 0; i < titles.length; i++) {
			String title = titles[i].trim();
			HSSFCell cell = titleRow.createCell(i);
			cell.setCellStyle(style);
			sheet.setColumnWidth(i, excelCell.get(title).getWidth());
			cell.setCellValue(excelCell.get(title).getTitle());
		}
		
		List<CountyEntity> countyList = countyService.list();
		int colnum = 1;
		
		switch (type) {
		case RankingReportType.INDUSTRYADDITION:
			for (CountyEntity county: countyList) {
				IndustryAdditionEntity addition = additionService.findOne(monthly, county.getId());
				
				HSSFRow row = sheet.createRow(colnum);
				row.setHeight((short) 300);
				row.createCell(0).setCellValue(monthly);
				row.createCell(1).setCellValue(county.getName());
				
				if (addition != null) {
					if (addition.getMonthGrowth() != null) {
						row.createCell(2).setCellValue(addition.getMonthGrowth());
					}
					if (addition.getTotalGrowth() != null) {
						row.createCell(3).setCellValue(addition.getTotalGrowth());
					}
					if (addition.getSort() != null) {
						row.createCell(4).setCellValue(addition.getSort());
					}
				}
				colnum++;
			}
			break;
		case RankingReportType.MAINBUSINESS:
			for (CountyEntity county: countyList) {
				MainBusinessEntity business = businessService.findOne(monthly, county.getId());
				
				HSSFRow row = sheet.createRow(colnum);
				row.setHeight((short) 300);
				row.createCell(0).setCellValue(monthly);
				row.createCell(1).setCellValue(county.getName());
				
				if (business != null) {
					if (business.getTotal() != null) {
						row.createCell(2).setCellValue(business.getTotal());
					}
					if (business.getYearGrowth() != null) {
						row.createCell(3).setCellValue(business.getYearGrowth());
					}
					if (business.getSort() != null) {
						row.createCell(4).setCellValue(business.getSort());
					}
				}
				colnum++;
			}
			break;
		case RankingReportType.PROFITTAX:
			for (CountyEntity county: countyList) {
				ProfitTaxEntity tax = taxService.findOne(monthly, county.getId());
				
				HSSFRow row = sheet.createRow(colnum);
				row.setHeight((short) 300);
				row.createCell(0).setCellValue(monthly);
				row.createCell(1).setCellValue(county.getName());
				
				if (tax != null) {
					if (tax.getTotal() != null) {
						row.createCell(2).setCellValue(tax.getTotal());
					}
					if (tax.getYearGrowth() != null) {
						row.createCell(3).setCellValue(tax.getYearGrowth());
					}
				}
				colnum++;
			}
			break;
		case RankingReportType.ELECTRICITY:
			for (CountyEntity county: countyList) {
				ElectricityEntity electricity = electricityService.findOne(monthly, county.getId());
				
				HSSFRow row = sheet.createRow(colnum);
				row.setHeight((short) 300);
				row.createCell(0).setCellValue(monthly);
				row.createCell(1).setCellValue(county.getName());
				
				if (electricity != null) {
					if (electricity.getTotal() != null) {
						row.createCell(2).setCellValue(electricity.getTotal());
					}
					if (electricity.getYearGrowth() != null) {
						row.createCell(3).setCellValue(electricity.getYearGrowth());
					}
					if (electricity.getSort() != null) {
						row.createCell(4).setCellValue(electricity.getSort());
					}				
				}
				colnum++;
			}
			break;
		case RankingReportType.INDUSTRYOUTPUT:
			for (CountyEntity county: countyList) {
				IndustryOutputEntity output = outputService.findOne(monthly, county.getId());
				
				HSSFRow row = sheet.createRow(colnum);
				row.setHeight((short) 300);
				row.createCell(0).setCellValue(monthly);
				row.createCell(1).setCellValue(county.getName());
				
				if (output != null) {
					if (output.getEnterpriseNum() != null) {
						row.createCell(2).setCellValue(output.getEnterpriseNum());
					}
					if (output.getTotal() != null) {
						row.createCell(3).setCellValue(output.getTotal());
					}
					if (output.getYearGrowth() != null) {
						row.createCell(4).setCellValue(output.getYearGrowth());
					}
				}
				colnum++;
			}
			break;
		case RankingReportType.VAT:
			for (CountyEntity county: countyList) {
				VatEntity vat = vatService.findOne(monthly, county.getId());
				
				HSSFRow row = sheet.createRow(colnum);
				row.setHeight((short) 300);
				row.createCell(0).setCellValue(monthly);
				row.createCell(1).setCellValue(county.getName());
				
				if (vat != null) {
					if (vat.getTotal() != null) {
						row.createCell(2).setCellValue(vat.getTotal());
					}
					if (vat.getYearGrowth() != null) {
						row.createCell(3).setCellValue(vat.getYearGrowth());
					}
				}
				colnum++;
			}
			break;
		case RankingReportType.PROFIT:
			for (CountyEntity county: countyList) {
				ProfitEntity profit = profitService.findOne(monthly, county.getId());
				
				HSSFRow row = sheet.createRow(colnum);
				row.setHeight((short) 300);
				row.createCell(0).setCellValue(monthly);
				row.createCell(1).setCellValue(county.getName());
				
				if (profit != null) {
					if (profit.getTotal() != null) {
						row.createCell(2).setCellValue(profit.getTotal());
					}
					if (profit.getYearGrowth() != null) {
						row.createCell(3).setCellValue(profit.getYearGrowth());
					}
					if (profit.getSort() != null) {
						row.createCell(4).setCellValue(profit.getSort());
					}					
				}
				colnum++;
			}
			break;
		default:
			break;
		}
		
		return wb;
	}

}
