package com.hongmeng.gcgyy.service.monitor;

import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.common.utils.FormulaUtils;
import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;
import com.hongmeng.gcgyy.entity.baseData.AreaEntity;
import com.hongmeng.gcgyy.entity.baseData.ProductTypeEntity;
import com.hongmeng.gcgyy.entity.monitor.BenefitEntity;
import com.hongmeng.gcgyy.entity.monitor.EconomicEntity;
import com.hongmeng.gcgyy.entity.monitor.EnergyEntity;
import com.hongmeng.gcgyy.entity.monitor.LocalTaxEntity;
import com.hongmeng.gcgyy.entity.monitor.NationalTaxEntity;
import com.hongmeng.gcgyy.service.authority.EnterpriseService;
import com.hongmeng.gcgyy.service.baseData.AreaService;
import com.hongmeng.gcgyy.service.baseData.ProductTypeService;

@Service
public class ReportFormServiceImpl implements ReportFormService {
	
	static Logger log = LoggerFactory.getLogger(ReportFormServiceImpl.class);
	
	@Autowired
	EnterpriseService enterpriseService;
	
	@Autowired
	ProductTypeService productTypeService;
	
	@Autowired
	AreaService areaService;
	
	@Autowired
	EnergyService energyService;
	
	@Autowired
	BenefitService benefitService;
	
	@Autowired
	EconomicService economicService;
	
	@Autowired
	TaxService taxService;
	
	@Autowired
	NationalTaxService nationalTaxService;
	
	@Autowired
	LocalTaxService localTaxService;
	
	public class ReportFormType {
		public static final int ENERGY = 1;
		public static final int BENEFIT = 2;
		public static final int ECONOMIC = 3;
		public static final int NATIONALTAX = 4;
		public static final int LOCALTAX = 5;
	}
	
	public class ExportType {
		public static final int ENERGY_ENTERPRISE = 1;
		public static final int ENERGY_PRODUCTTYPE = 2; 
		public static final int ENERGY_AREA = 3;
		public static final int BENEFIT_ENTERPRISE = 4;
		public static final int BENEFIT_PRODUCTTYPE = 5; 
		public static final int BENEFIT_AREA = 6;
		public static final int ECONOMIC_ENTERPRISE = 7;
		public static final int ECONOMIC_PRODUCTTYPE = 8; 
		public static final int ECONOMIC_AREA = 9;
		public static final int NATIONALTAX_ENTERPRISE = 10;
		public static final int NATIONALTAX_PRODUCTTYPE = 11;
		public static final int NATIONALTAX_AREA = 12;
		public static final int LOCALTAX_ENTERPRISE = 13;
		public static final int LOCALTAX_PRODUCTTYPE = 14;
		public static final int LOCALTAX_AREA = 15;
		
		public static final int ENERGY_ENTERPRISE_MONTHLY = 16;
		public static final int BENEFIT_ENTERPRISE_MONTHLY = 17;
		public static final int ECONOMIC_ENTERPRISE_MONTHLY = 18;
		public static final int NATIONALTAX_ENTERPRISE_MONTHLY = 19;
		public static final int LOCALTAX_ENTERPRISE_MONTHLY = 20;
	}
	
	@SuppressWarnings("serial")
	public static HashMap<Integer, String> templateTitle = new HashMap<Integer, String>() {{
		put(ReportFormType.ENERGY, "能源消耗");
		put(ReportFormType.BENEFIT, "效益指标");
		put(ReportFormType.ECONOMIC, "主要指标");
		put(ReportFormType.NATIONALTAX, "国税");
		put(ReportFormType.LOCALTAX, "地税");
	}};
	
	@SuppressWarnings("serial")
	public static HashMap<Integer, String> reportColumn = new HashMap<Integer, String>() {{
		put(ReportFormType.ENERGY, "monthly, enterprise, energy_electricity, energy_gas");
		put(ReportFormType.BENEFIT, "monthly, enterprise, benefit_receivable, benefit_inventory, benefit_assets, benefit_debt");
		put(ReportFormType.ECONOMIC, "monthly, enterprise, economic_industryAddition, economic_mainBusiness, economic_profit, economic_tax");
		put(ReportFormType.NATIONALTAX, "monthly, enterprise, nationalTax_sale, nationalTax_taxes");
		put(ReportFormType.LOCALTAX, "monthly, enterprise, localTax_taxes");
	}};
	
	@SuppressWarnings("serial")
	public static HashMap<Integer, String> exportTitle = new HashMap<Integer, String>() {{
		put(ExportType.ENERGY_ENTERPRISE, "企业能源消耗明细");
		put(ExportType.ENERGY_PRODUCTTYPE, "产业能源消耗明细");
		put(ExportType.ENERGY_AREA, "园区能源消耗明细");
		put(ExportType.BENEFIT_ENTERPRISE, "企业效益指标明细");
		put(ExportType.BENEFIT_PRODUCTTYPE, "产业效益指标明细");
		put(ExportType.BENEFIT_AREA, "园区效益指标明细");
		put(ExportType.ECONOMIC_ENTERPRISE, "企业增长明细");
		put(ExportType.ECONOMIC_PRODUCTTYPE, "产业增长明细");
		put(ExportType.ECONOMIC_AREA, "园区增长明细");
		put(ExportType.NATIONALTAX_ENTERPRISE, "企业国税明细");
		put(ExportType.NATIONALTAX_PRODUCTTYPE, "产业国税明细");
		put(ExportType.NATIONALTAX_AREA, "园区国税明细");
		put(ExportType.LOCALTAX_ENTERPRISE, "企业地税明细");
		put(ExportType.LOCALTAX_PRODUCTTYPE, "产业地税明细");
		put(ExportType.LOCALTAX_AREA, "园区地税明细");
		
		put(ExportType.ENERGY_ENTERPRISE_MONTHLY, "能源消耗明细");
		put(ExportType.BENEFIT_ENTERPRISE_MONTHLY, "效益指标明细");
		put(ExportType.ECONOMIC_ENTERPRISE_MONTHLY, "主要指标");
		put(ExportType.NATIONALTAX_ENTERPRISE_MONTHLY, "国税");
		put(ExportType.LOCALTAX_ENTERPRISE_MONTHLY, "地税");
	}};
	
	@SuppressWarnings("serial")
	public static HashMap<Integer, String> exportColumn = new HashMap<Integer, String>() {{
		put(ExportType.ENERGY_ENTERPRISE, "monthly, enterprise, "
				+ "energy_electricity_current, lastYear, lastYear_growth, lastMonth_growth, "
				+ "energy_gas_current, lastYear, lastYear_growth, lastMonth_growth");
		put(ExportType.ENERGY_PRODUCTTYPE, "monthly, productType, "
				+ "energy_electricity_current, lastYear, lastYear_growth, lastMonth_growth, "
				+ "energy_gas_current, lastMonth, lastYear_growth, lastMonth_growth");
		put(ExportType.ENERGY_AREA, "monthly, area, "
				+ "energy_electricity_current, lastYear, lastYear_growth, lastMonth_growth, "
				+ "energy_gas_current, lastMonth, lastYear_growth, lastMonth_growth");
		put(ExportType.BENEFIT_ENTERPRISE, "monthly, enterprise, "
				+ "benefit_flowAssets_current, benefit_flowAssets_lastYear, lastYear_growth, "
				+ "benefit_receivable_current, benefit_receivable_lastYear, lastYear_growth, "
				+ "benefit_inventory_current, benefit_inventory_lastYear, lastYear_growth, "
				+ "benefit_totleAssets_current, benefit_totleAssets_lastYear, lastYear_growth, "
				+ "benefit_assets_current, benefit_assets_lastYear, lastYear_growth, "
				+ "benefit_debt_current, benefit_debt_lastYear, lastYear_growth");
		put(ExportType.BENEFIT_PRODUCTTYPE, "monthly, productType, "
				+ "benefit_flowAssets_current, benefit_flowAssets_lastYear, lastYear_growth, "
				+ "benefit_receivable_current, benefit_receivable_lastYear, lastYear_growth, "
				+ "benefit_inventory_current, benefit_inventory_lastYear, lastYear_growth, "
				+ "benefit_totleAssets_current, benefit_totleAssets_lastYear, lastYear_growth, "
				+ "benefit_assets_current, benefit_assets_lastYear, lastYear_growth, "
				+ "benefit_debt_current, benefit_debt_lastYear, lastYear_growth");
		put(ExportType.BENEFIT_AREA, "monthly, area, "
				+ "benefit_flowAssets_current, benefit_flowAssets_lastYear, lastYear_growth, "
				+ "benefit_receivable_current, benefit_receivable_lastYear, lastYear_growth, "
				+ "benefit_inventory_current, benefit_inventory_lastYear, lastYear_growth, "
				+ "benefit_totleAssets_current, benefit_totleAssets_lastYear, lastYear_growth, "
				+ "benefit_assets_current, benefit_assets_lastYear, lastYear_growth, "
				+ "benefit_debt_current, benefit_debt_lastYear, lastYear_growth");
		put(ExportType.ECONOMIC_ENTERPRISE, "monthly, enterprise, "
				+ "economic_industryAddition_current, lastYear_growth, economic_mainBusiness_current, lastYear_growth, "
				+ "economic_profit_current, lastYear_growth, economic_tax_current, lastYear_growth");
				//+ "economic_industryAddition_endMonth_current, economic_industryAddition_endMonth_lastYear, lastYear_growth, "
				//+ "economic_industryAddition_target, economic_industryAddition_target_percent,"
				//+ "economic_mainBusiness_endMonth_current, economic_mainBusiness_endMonth_lastYear, lastYear_growth");
		put(ExportType.ECONOMIC_PRODUCTTYPE, "monthly, productType, "
				+ "economic_industryAddition_current, lastYear_growth, economic_mainBusiness_current, lastYear_growth, "
				+ "economic_profit_current, lastYear_growth, economic_tax_current, lastYear_growth");
				//+ "economic_industryAddition_endMonth_current, economic_industryAddition_endMonth_lastYear, lastYear_growth, "
				//+ "economic_industryAddition_target, economic_industryAddition_target_percent,"
				//+ "economic_mainBusiness_endMonth_current, economic_mainBusiness_endMonth_lastYear, lastYear_growth");
		put(ExportType.ECONOMIC_AREA, "monthly, area, "
				+ "economic_industryAddition_current, lastYear_growth, economic_mainBusiness_current, lastYear_growth, "
				+ "economic_profit_current, lastYear_growth, economic_tax_current, lastYear_growth");
				//+ "economic_industryAddition_endMonth_current, economic_industryAddition_endMonth_lastYear, lastYear_growth, "
				//+ "economic_industryAddition_target, economic_industryAddition_target_percent,"
				//+ "economic_mainBusiness_endMonth_current, economic_mainBusiness_endMonth_lastYear, lastYear_growth");
		put(ExportType.NATIONALTAX_ENTERPRISE, "monthly, enterprise, nationalTax_sale, lastYear, lastYear_growth, "
				+ "nationalTax_tax, lastYear, lastYear_growth");
		put(ExportType.NATIONALTAX_PRODUCTTYPE, "monthly, productType, nationalTax_sale, lastYear, lastYear_growth, "
				+ "nationalTax_tax, lastYear, lastYear_growth");
		put(ExportType.NATIONALTAX_AREA, "monthly, area, nationalTax_sale, lastYear, lastYear_growth, "
				+ "nationalTax_tax, lastYear, lastYear_growth");
		put(ExportType.LOCALTAX_ENTERPRISE, "monthly, enterprise, localTax_tax, lastYear, lastYear_growth");
		put(ExportType.LOCALTAX_PRODUCTTYPE, "monthly, productType, localTax_tax, lastYear, lastYear_growth");
		put(ExportType.LOCALTAX_AREA, "monthly, area, localTax_tax, lastYear, lastYear_growth");
		
		put(ExportType.ENERGY_ENTERPRISE_MONTHLY, "monthly, enterprise, "
				+ "energy_electricity_current, lastYear, lastYear_growth, lastMonth_growth, "
				+ "energy_gas_current, lastMonth, lastYear_growth, lastMonth_growth");
		put(ExportType.BENEFIT_ENTERPRISE_MONTHLY, "monthly, enterprise, "
				+ "benefit_flowAssets_current, benefit_flowAssets_lastYear, lastYear_growth, "
				+ "benefit_receivable_current, benefit_receivable_lastYear, lastYear_growth, "
				+ "benefit_inventory_current, benefit_inventory_lastYear, lastYear_growth, "
				+ "benefit_totleAssets_current, benefit_totleAssets_lastYear, lastYear_growth, "
				+ "benefit_assets_current, benefit_assets_lastYear, lastYear_growth, "
				+ "benefit_debt_current, benefit_debt_lastYear, lastYear_growth");
		put(ExportType.ECONOMIC_ENTERPRISE_MONTHLY, "monthly, enterprise, "
				+ "economic_industryAddition_current, lastYear_growth, economic_mainBusiness_current, lastYear_growth, "
				+ "economic_profit_current, lastYear_growth, economic_tax_current, lastYear_growth");
				//+ "economic_industryAddition_endMonth_current, economic_industryAddition_endMonth_lastYear, lastYear_growth, "
				//+ "economic_industryAddition_target, economic_industryAddition_target_percent,"
				//+ "economic_mainBusiness_endMonth_current, economic_mainBusiness_endMonth_lastYear, lastYear_growth");
		put(ExportType.NATIONALTAX_ENTERPRISE_MONTHLY, "monthly, enterprise, nationalTax_sale, lastYear, lastYear_growth, "
				+ "nationalTax_tax, lastYear, lastYear_growth");
		put(ExportType.LOCALTAX_ENTERPRISE_MONTHLY, "monthly, enterprise, localTax_tax, lastYear, lastYear_growth");
	}};
	
	@SuppressWarnings("serial")
	public static HashMap<String, ExcelCell> excelCell = new HashMap<String, ExcelCell>() {{
		put("monthly", new ExcelCell("monthly", 4500, "月报表时间"));
		put("id", new ExcelCell("id", 2000, "企业ID"));
		put("enterprise", new ExcelCell("enterprise", 8000, "企业名称"));
		put("productType", new ExcelCell("productType", 4500, "产业类别"));
		put("area", new ExcelCell("area", 4500, "区域名称"));
		put("energy_electricity", new ExcelCell("energy_electricity", 4500, "本月用电量(度)"));
		put("energy_gas", new ExcelCell("energy_gas", 4500, "本月用气量(立方米)"));
		put("benefit_receivable", new ExcelCell("benefit_receivable", 4500, "应收账款"));
		put("benefit_inventory", new ExcelCell("benefit_inventory", 4500, "产存品存货"));
		put("benefit_assets", new ExcelCell("benefit_assets", 4500, "资产总计"));
		put("benefit_debt", new ExcelCell("benefit_debt", 4500, "负债总计"));
		put("economic_industryAddition", new ExcelCell("economic_industryAddition", 4500, "本月止工业总产值"));
		put("economic_mainBusiness", new ExcelCell("economic_mainBusiness", 4500, "本月止主营业务收入"));
		put("economic_profit", new ExcelCell("economic_profit", 4500, "本月止利润总额"));
		put("economic_tax", new ExcelCell("economic_tax", 4500 ,"本月止税金总额"));
		put("nationalTax_sale", new ExcelCell("nationalTax_sale", 4500 ,"本月止销售收入(元)"));
		put("nationalTax_taxes", new ExcelCell("nationalTax_taxes", 4500 ,"本月止国税(元)"));
		put("localTax_taxes", new ExcelCell("localTax_taxes", 4500 ,"本月止地税(元)"));
		
		// common
		put("lastYear", new ExcelCell("lastYear", 4500, "去年同期"));
		put("lastMonth", new ExcelCell("lastMonth", 4500, "上月同期"));
		
		// growth
		put("lastYear_growth", new ExcelCell("lastYear_growth", 3000, "同比增幅%"));
		put("lastMonth_growth", new ExcelCell("lastMonth_growth", 3000, "环比增幅%"));
		
		// energy export
		put("energy_electricity_current", new ExcelCell("energy_electricity_current", 4500, "本月用电量(度)"));
		put("energy_gas_current", new ExcelCell("energy_gas_current", 4500, "本月用气量(立方米)"));
		
		// benefit export
		put("benefit_flowAssets_current", new ExcelCell("benefit_flowAssets_current", 4500, "本月流动资产合计"));
		put("benefit_flowAssets_lastYear", new ExcelCell("benefit_flowAssets_lastYear", 4500, "去年同期流动资产合计"));
		put("benefit_receivable_current", new ExcelCell("benefit_receivable_current", 4500, "本月应收账款"));
		put("benefit_receivable_lastYear", new ExcelCell("benefit_receivable_lastYear", 4500, "去年应收账款"));
		put("benefit_inventory_current", new ExcelCell("benefit_inventory_current", 4500, "本月产存品存货"));
		put("benefit_inventory_lastYear", new ExcelCell("benefit_inventory_lastYear", 4500, "去年同期产存品存货"));
		put("benefit_totleAssets_current", new ExcelCell("benefit_totleAssets_current", 4500, "本月两项资产合计"));
		put("benefit_totleAssets_lastYear", new ExcelCell("benefit_totleAssets_lastYear", 4500, "去年同期两项资产合计"));
		put("benefit_assets_current", new ExcelCell("benefit_assets_current", 4500, "本月资产合计"));
		put("benefit_assets_lastYear", new ExcelCell("benefit_assets_lastYear", 4500, "去年同期资产合计"));
		put("benefit_debt_current", new ExcelCell("benefit_debt_current", 4500, "本月负债合计"));
		put("benefit_debt_lastYear", new ExcelCell("benefit_debt_lastYear", 4500, "去年同期负债合计"));
		
		// economic export
		put("economic_industryAddition_current", new ExcelCell("economic_industryAddition_current", 4500, "本月止工业总产值"));
		put("economic_mainBusiness_current", new ExcelCell("economic_mainBusiness_current", 4500, "本月止主营业务收入"));
		put("economic_profit_current", new ExcelCell("economic_profit_current", 4500, "本月止利润总额"));
		put("economic_tax_current", new ExcelCell("economic_tax_current", 4500, "本月止税金总额"));
		put("economic_industryAddition_endMonth_current", new ExcelCell("economic_industryAddition_endMonth_current", 4500, "本月止工业总产值"));
		put("economic_industryAddition_endMonth_lastYear", new ExcelCell("economic_industryAddition_endMonth_lastYear", 4500, "去年同期止工业总产值"));
		put("economic_industryAddition_target", new ExcelCell("economic_industryAddition_target", 4500, "工业总产值年度目标数"));
		put("economic_industryAddition_target_percent", new ExcelCell("economic_industryAddition_target_percent", 4500, "完成比例%"));
		put("economic_mainBusiness_endMonth_current", new ExcelCell("economic_mainBusiness_endMonth_current", 4500, "本月止主营业务收入"));
		put("economic_mainBusiness_endMonth_lastYear", new ExcelCell("economic_mainBusiness_endMonth_lastYear", 4500, "去年同期止主营业务收入"));
	
		// tax
		put("nationalTax_sale", new ExcelCell("nationalTax_sale", 4500, "本月止销售收入(元)"));
		put("nationalTax_tax", new ExcelCell("nationalTax_tax", 4500, "本月止国税(元)"));
		put("localTax_tax", new ExcelCell("localTax_tax", 4500, "本月止地税(元)"));
		
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
		
		// 企业列表
		List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listBase();
		int colnum = 1;
		for (BaseEnterpriseEntity enterprise: enterpriseList) {
			HSSFRow row = sheet.createRow(colnum);
			row.setHeight((short) 300);
			row.createCell(0).setCellValue(monthly);
			row.createCell(1).setCellValue(enterprise.getName());
			//row.createCell(1).setCellValue(enterprise.getId());
			//row.createCell(2).setCellValue(enterprise.getName());
			colnum++;
		}
		
		return wb;
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
		String[] titles = StringUtils.split(exportColumn.get(type), ",");
		for (int i = 0; i < titles.length; i++) {
			String title = titles[i].trim();
			HSSFCell cell = titleRow.createCell(i);
			cell.setCellStyle(style);
			sheet.setColumnWidth(i, excelCell.get(title).getWidth());
			cell.setCellValue(excelCell.get(title).getTitle());
		}
		
		List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listBase();
		List<ProductTypeEntity> productTypeList = productTypeService.list();
		List<AreaEntity> areaList = areaService.list();
		int colnum = 1;
		
		switch (type) {
		case ExportType.ENERGY_ENTERPRISE:
			for (BaseEnterpriseEntity enterprise : enterpriseList) {
				EnergyVO energy = energyService.detail(monthly, enterprise);
				
				HSSFRow row = sheet.createRow(colnum);
				row.setHeight((short) 300);
				row.createCell(0).setCellValue(monthly);
				row.createCell(1).setCellValue(enterprise.getName());
				
				writeEnergy(row, energy);
				colnum++;
			}
			break;
		case ExportType.ENERGY_PRODUCTTYPE:
			for (ProductTypeEntity productType : productTypeList) {
				List<BaseEnterpriseEntity> enterprises = enterpriseService.listByProductTypeId(productType.getId());
				EnergyVO energy = energyService.sumEnterpriseEnergy(monthly, enterprises);
				
				HSSFRow row = sheet.createRow(colnum);
				row.setHeight((short) 300);
				row.createCell(0).setCellValue(monthly);
				row.createCell(1).setCellValue(productType.getName());
				
				writeEnergy(row, energy);
				colnum++;
			}
			break;
		case ExportType.ENERGY_AREA:
			for (AreaEntity area : areaList) {
				List<BaseEnterpriseEntity> enterprises = enterpriseService.listByAreaId(area.getId());
				EnergyVO energy = energyService.sumEnterpriseEnergy(monthly, enterprises);
				
				HSSFRow row = sheet.createRow(colnum);
				row.setHeight((short) 300);
				row.createCell(0).setCellValue(monthly);
				row.createCell(1).setCellValue(area.getName());
				
				writeEnergy(row, energy);
				colnum++;
			}
			break;
		case ExportType.BENEFIT_ENTERPRISE:
			for (BaseEnterpriseEntity enterprise: enterpriseList) {
				BenefitVO benefit = benefitService.detail(monthly, enterprise);
				
				HSSFRow row = sheet.createRow(colnum);
				row.setHeight((short) 300);
				row.createCell(0).setCellValue(monthly);
				row.createCell(1).setCellValue(enterprise.getName());
				
				writeBenefit(row, benefit);
				colnum++;
			}
			break;
		case ExportType.BENEFIT_PRODUCTTYPE:
			for (ProductTypeEntity productType : productTypeList) {
				List<BaseEnterpriseEntity> enterprises = enterpriseService.listByProductTypeId(productType.getId());
				BenefitVO benefit = benefitService.sumEnterpriseBenefit(monthly, enterprises);
				
				HSSFRow row = sheet.createRow(colnum);
				row.setHeight((short) 300);
				row.createCell(0).setCellValue(monthly);
				row.createCell(1).setCellValue(productType.getName());
				
				writeBenefit(row, benefit);
				colnum++;
			}
			break;
		case ExportType.BENEFIT_AREA:
			for (AreaEntity area : areaList) {
				List<BaseEnterpriseEntity> enterprises = enterpriseService.listByAreaId(area.getId());
				BenefitVO benefit = benefitService.sumEnterpriseBenefit(monthly, enterprises);
				
				HSSFRow row = sheet.createRow(colnum);
				row.setHeight((short) 300);
				row.createCell(0).setCellValue(monthly);
				row.createCell(1).setCellValue(area.getName());
				
				writeBenefit(row, benefit);
				colnum++;
			}
			break;
		case ExportType.ECONOMIC_ENTERPRISE:
			for (BaseEnterpriseEntity enterprise: enterpriseList) {
				EconomicVO economic = economicService.detail(monthly, enterprise);
				
				HSSFRow row = sheet.createRow(colnum);
				row.setHeight((short) 300);
				row.createCell(0).setCellValue(monthly);
				row.createCell(1).setCellValue(enterprise.getName());
				
				writeEconomic(row, economic);
				colnum++;
			}
			break;
		case ExportType.ECONOMIC_PRODUCTTYPE:
			for (ProductTypeEntity productType : productTypeList) {
				List<BaseEnterpriseEntity> enterprises = enterpriseService.listByProductTypeId(productType.getId());
				EconomicVO economic = economicService.sumEnterpriseEconomic(monthly, enterprises);
				
				HSSFRow row = sheet.createRow(colnum);
				row.setHeight((short) 300);
				row.createCell(0).setCellValue(monthly);
				row.createCell(1).setCellValue(productType.getName());
				
				writeEconomic(row, economic);
				colnum++;
			}
			break;
		case ExportType.ECONOMIC_AREA:
			for (AreaEntity area : areaList) {
				List<BaseEnterpriseEntity> enterprises = enterpriseService.listByAreaId(area.getId());
				EconomicVO economic = economicService.sumEnterpriseEconomic(monthly, enterprises);
				
				HSSFRow row = sheet.createRow(colnum);
				row.setHeight((short) 300);
				row.createCell(0).setCellValue(monthly);
				row.createCell(1).setCellValue(area.getName());
				
				writeEconomic(row, economic);
				colnum++;
			}
			break;
		case ExportType.NATIONALTAX_ENTERPRISE:
			for (BaseEnterpriseEntity enterprise: enterpriseList) {
				TaxVO tax = taxService.detail(monthly, enterprise);
				
				HSSFRow row = sheet.createRow(colnum);
				row.setHeight((short) 300);
				row.createCell(0).setCellValue(monthly);
				row.createCell(1).setCellValue(enterprise.getName());
				
				writeNationalTax(row, tax);
				colnum++;
			}
			break;
		case ExportType.NATIONALTAX_PRODUCTTYPE:
			for (ProductTypeEntity productType : productTypeList) {
				List<BaseEnterpriseEntity> enterprises = enterpriseService.listByProductTypeId(productType.getId());
				TaxVO tax = taxService.sumEnterpriseTax(monthly, enterprises);
				
				HSSFRow row = sheet.createRow(colnum);
				row.setHeight((short) 300);
				row.createCell(0).setCellValue(monthly);
				row.createCell(1).setCellValue(productType.getName());
				
				writeNationalTax(row, tax);
				colnum++;
			}
			break;
		case ExportType.NATIONALTAX_AREA:
			for (AreaEntity area : areaList) {
				List<BaseEnterpriseEntity> enterprises = enterpriseService.listByAreaId(area.getId());
				TaxVO tax = taxService.sumEnterpriseTax(monthly, enterprises);
				
				HSSFRow row = sheet.createRow(colnum);
				row.setHeight((short) 300);
				row.createCell(0).setCellValue(monthly);
				row.createCell(1).setCellValue(area.getName());
				
				writeNationalTax(row, tax);
				colnum++;
			}
			break;
		case ExportType.LOCALTAX_ENTERPRISE:
			for (BaseEnterpriseEntity enterprise: enterpriseList) {
				TaxVO tax = taxService.detail(monthly, enterprise);
				
				HSSFRow row = sheet.createRow(colnum);
				row.setHeight((short) 300);
				row.createCell(0).setCellValue(monthly);
				row.createCell(1).setCellValue(enterprise.getName());
				
				writeLocalTax(row, tax);
				colnum++;
			}
			break;
		case ExportType.LOCALTAX_PRODUCTTYPE:
			for (ProductTypeEntity productType : productTypeList) {
				List<BaseEnterpriseEntity> enterprises = enterpriseService.listByProductTypeId(productType.getId());
				TaxVO tax = taxService.sumEnterpriseTax(monthly, enterprises);
				
				HSSFRow row = sheet.createRow(colnum);
				row.setHeight((short) 300);
				row.createCell(0).setCellValue(monthly);
				row.createCell(1).setCellValue(productType.getName());
				
				writeLocalTax(row, tax);
				colnum++;
			}
			break;
		case ExportType.LOCALTAX_AREA:
			for (AreaEntity area : areaList) {
				List<BaseEnterpriseEntity> enterprises = enterpriseService.listByAreaId(area.getId());
				TaxVO tax = taxService.sumEnterpriseTax(monthly, enterprises);
				
				HSSFRow row = sheet.createRow(colnum);
				row.setHeight((short) 300);
				row.createCell(0).setCellValue(monthly);
				row.createCell(1).setCellValue(area.getName());
				
				writeLocalTax(row, tax);
				colnum++;
			}
			break;
		default:
			break;
		}
		
		return wb;
	}
	
	public void writeEnergy(HSSFRow row, EnergyVO energy) {
		EnergyEntity energy_current = energy.getEnergy_current();
		if (energy_current != null) {
			row.createCell(2).setCellValue(FormulaUtils.convertDouble(energy_current.getElectricity()));
			row.createCell(6).setCellValue(FormulaUtils.convertDouble(energy_current.getGas()));
		} else {
			row.createCell(2).setCellValue("-");
			row.createCell(6).setCellValue("-");
		}
		
		EnergyEntity energy_lastYear = energy.getEnergy_lastYear();
		if (energy_lastYear != null) {
			row.createCell(3).setCellValue(FormulaUtils.convertDouble(energy_lastYear.getElectricity()));
			row.createCell(7).setCellValue(FormulaUtils.convertDouble(energy_lastYear.getGas()));
		} else {
			row.createCell(3).setCellValue("-");
			row.createCell(7).setCellValue("-");
		}
		
		String electricity_yearGrowth = energy.getElectricity_yearGrowth();
		if (electricity_yearGrowth != null) {
			row.createCell(4).setCellValue(FormulaUtils.convertPercent(electricity_yearGrowth));
		} else {
			row.createCell(4).setCellValue("-");
		}
		
		String electricity_monthGrowth = energy.getElectricity_monthGrowth();
		if (electricity_monthGrowth != null) {
			row.createCell(5).setCellValue(FormulaUtils.convertPercent(electricity_monthGrowth));
		} else {
			row.createCell(5).setCellValue("-");
		}
		
		String gas_yearGrowth = energy.getGas_yearGrowth();
		if (gas_yearGrowth != null) {
			row.createCell(8).setCellValue(FormulaUtils.convertPercent(gas_yearGrowth));
		} else {
			row.createCell(8).setCellValue("-");
		}
		
		String gas_monthGrowth = energy.getGas_monthGrowth();
		if (gas_monthGrowth != null) {
			row.createCell(9).setCellValue(FormulaUtils.convertPercent(gas_monthGrowth));
		} else {
			row.createCell(9).setCellValue("-");
		}
	}
	
	public void writeBenefit(HSSFRow row, BenefitVO benefit) {
		BenefitEntity benefit_current = benefit.getBenefit_current();
		if (benefit_current != null) {
			row.createCell(2).setCellValue(FormulaUtils.convertDouble(benefit_current.getFlowAssets()));
			row.createCell(5).setCellValue(FormulaUtils.convertDouble(benefit_current.getReceivable()));
			row.createCell(8).setCellValue(FormulaUtils.convertDouble(benefit_current.getInventory()));
			row.createCell(11).setCellValue(FormulaUtils.convertDouble(benefit_current.getTotleAssets()));
			row.createCell(14).setCellValue(FormulaUtils.convertDouble(benefit_current.getAssets()));
			row.createCell(17).setCellValue(FormulaUtils.convertDouble(benefit_current.getDebt()));
		} else {
			row.createCell(2).setCellValue("-");
			row.createCell(5).setCellValue("-");
			row.createCell(8).setCellValue("-");
			row.createCell(11).setCellValue("-");
			row.createCell(14).setCellValue("-");
			row.createCell(17).setCellValue("-");
		}
		
		BenefitEntity benefit_lastYear = benefit.getBenefit_lastYear();
		if (benefit_lastYear != null) {
			row.createCell(3).setCellValue(FormulaUtils.convertDouble(benefit_lastYear.getFlowAssets()));
			row.createCell(6).setCellValue(FormulaUtils.convertDouble(benefit_lastYear.getReceivable()));
			row.createCell(9).setCellValue(FormulaUtils.convertDouble(benefit_lastYear.getInventory()));
			row.createCell(12).setCellValue(FormulaUtils.convertDouble(benefit_lastYear.getTotleAssets()));
			row.createCell(15).setCellValue(FormulaUtils.convertDouble(benefit_lastYear.getAssets()));
			row.createCell(18).setCellValue(FormulaUtils.convertDouble(benefit_lastYear.getDebt()));
		} else {
			row.createCell(3).setCellValue("-");
			row.createCell(6).setCellValue("-");
			row.createCell(9).setCellValue("-");
			row.createCell(12).setCellValue("-");
			row.createCell(15).setCellValue("-");
			row.createCell(18).setCellValue("-");
		}
		
		String flowAssets_yearGrowth = benefit.getFlowAssets_yearGrowth();
		if (flowAssets_yearGrowth != null) {
			row.createCell(4).setCellValue(FormulaUtils.convertPercent(flowAssets_yearGrowth));
		} else {
			row.createCell(4).setCellValue("-");
		}
		
		String receivable_yearGrowth = benefit.getReceivable_yearGrowth();
		if (receivable_yearGrowth != null) {
			row.createCell(7).setCellValue(FormulaUtils.convertPercent(receivable_yearGrowth));
		} else {
			row.createCell(7).setCellValue("-");
		}
		
		String inventory_yearGrowth = benefit.getInventory_yearGrowth();
		if (inventory_yearGrowth != null) {
			row.createCell(10).setCellValue(FormulaUtils.convertPercent(inventory_yearGrowth));
		} else {
			row.createCell(10).setCellValue("-");
		}
		
		String totleAssets_yearGrowth = benefit.getTotleAssets_yearGrowth();
		if (totleAssets_yearGrowth != null) {
			row.createCell(13).setCellValue(FormulaUtils.convertPercent(totleAssets_yearGrowth));
		} else {
			row.createCell(13).setCellValue("-");
		}
		
		String assets_yearGrowth = benefit.getAssets_yearGrowth();
		if (assets_yearGrowth != null) {
			row.createCell(16).setCellValue(FormulaUtils.convertPercent(assets_yearGrowth));
		} else {
			row.createCell(16).setCellValue("-");
		}
		
		String debt_yearGrowth = benefit.getDebt_yearGrowth();
		if (debt_yearGrowth != null) {
			row.createCell(19).setCellValue(FormulaUtils.convertPercent(debt_yearGrowth));
		} else {
			row.createCell(19).setCellValue("-");
		}
	}
	
	public void writeEconomic(HSSFRow row, EconomicVO economic) {
		EconomicEntity economic_current = economic.getEconomic_current();
		if (economic_current != null) {
			row.createCell(2).setCellValue(FormulaUtils.convertDouble(economic_current.getIndustryAddition()));
			row.createCell(4).setCellValue(FormulaUtils.convertDouble(economic_current.getMainBusiness()));
			row.createCell(6).setCellValue(FormulaUtils.convertDouble(economic_current.getProfit()));
			row.createCell(8).setCellValue(FormulaUtils.convertDouble(economic_current.getTax()));
		} else {
			row.createCell(2).setCellValue("-");
			row.createCell(4).setCellValue("-");
			row.createCell(6).setCellValue("-");
			row.createCell(8).setCellValue("-");
		}
		
		String industryAddition_yearGrowth = economic.getIndustryAddition_yearGrowth();
		if (industryAddition_yearGrowth != null) {
			row.createCell(3).setCellValue(FormulaUtils.convertPercent(industryAddition_yearGrowth));
		} else {
			row.createCell(3).setCellValue("-");
		}
		
		String mainBusiness_yearGrowth = economic.getMainBusiness_yearGrowth();
		if (mainBusiness_yearGrowth != null) {
			row.createCell(5).setCellValue(FormulaUtils.convertPercent(mainBusiness_yearGrowth));
		} else {
			row.createCell(5).setCellValue("-");
		}
		
		String profit_yearGrowth = economic.getProfit_yearGrowth();
		if (profit_yearGrowth != null) {
			row.createCell(7).setCellValue(FormulaUtils.convertPercent(profit_yearGrowth));
		} else {
			row.createCell(7).setCellValue("-");
		}
		
		String tax_yearGrowth = economic.getTax_yearGrowth();
		if (tax_yearGrowth != null) {
			row.createCell(9).setCellValue(FormulaUtils.convertPercent(tax_yearGrowth));
		} else {
			row.createCell(9).setCellValue("-");
		}
		
//		row.createCell(10).setCellValue(economic_current != null ? FormulaUtils.convertDouble(economic.getIndustryAddition_current_endMonth()) : 0);
//		row.createCell(11).setCellValue(economic_current != null ? FormulaUtils.convertDouble(economic.getIndustryAddition_lastYear_endMonth()) : 0);
//		String industryAddition_endMonth_yearGrowth = economic.getIndustryAddition_endMonth_yearGrowth();
//		if (industryAddition_endMonth_yearGrowth != null) {
//			row.createCell(12).setCellValue(FormulaUtils.convertPercent(industryAddition_endMonth_yearGrowth));
//		} else {
//			row.createCell(12).setCellValue("-");
//		}
		
//		EconomicTargetEntity target = economic.getIndustryAddition_Target();
//		row.createCell(13).setCellValue(target != null ? FormulaUtils.convertDouble(target.getValue()) : 0);
//		String industryAddition_complete = economic.getIndustryAddition_complete();
//		if (industryAddition_complete != null) {
//			row.createCell(14).setCellValue(FormulaUtils.convertPercent(industryAddition_complete));
//		} else {
//			row.createCell(14).setCellValue("-");
//		}
		
//		row.createCell(15).setCellValue(economic_current != null ? FormulaUtils.convertDouble(economic.getMainBusiness_current_endMonth()) : 0);
//		row.createCell(16).setCellValue(economic_current != null ? FormulaUtils.convertDouble(economic.getMainBusiness_lastYear_endMonth()) : 0);
//		String mainBusiness_endMonth_yearGrowth = economic.getMainBusiness_endMonth_yearGrowth();
//		if (mainBusiness_endMonth_yearGrowth != null) {
//			row.createCell(17).setCellValue(FormulaUtils.convertPercent(mainBusiness_endMonth_yearGrowth));
//		} else {
//			row.createCell(17).setCellValue("-");
//		}
	}
	
	public void writeNationalTax(HSSFRow row, NationalTaxVO nationalTax) {
		TaxVO tax = new TaxVO(nationalTax.getNationalTax_current(), nationalTax.getNationalTax_lastYear(), 
				null, null);
		tax.setSale_yearGrowth(nationalTax.getSale_yearGrowth());
		tax.setNationalTax_yearGrowth(nationalTax.getNationalTax_yearGrowth());
		writeNationalTax(row, tax);
	}
	
	public void writeNationalTax(HSSFRow row, TaxVO tax) {
		NationalTaxEntity tax_current = tax.getNationalTax_current();
		if (tax_current != null) {
			row.createCell(2).setCellValue(Double.valueOf(tax_current.getSale()));
			row.createCell(5).setCellValue(Double.valueOf(tax_current.getTaxes()));
		} else {
			row.createCell(2).setCellValue("-");
			row.createCell(5).setCellValue("-");
		}
		
		NationalTaxEntity tax_lastYear = tax.getNationalTax_lastYear();
		if (tax_lastYear != null) {
			row.createCell(3).setCellValue(Double.valueOf(tax_lastYear.getSale()));
			row.createCell(6).setCellValue(Double.valueOf(tax_lastYear.getTaxes()));
		} else {
			row.createCell(3).setCellValue("-");
			row.createCell(6).setCellValue("-");
		}
	
		String sale_yearGrowth = tax.getSale_yearGrowth();
		if (sale_yearGrowth != null) {
			row.createCell(4).setCellValue(FormulaUtils.convertPercent(sale_yearGrowth));
		} else {
			row.createCell(4).setCellValue("-");
		}
		
		String nationalTax_yearGrowth = tax.getNationalTax_yearGrowth();
		if (nationalTax_yearGrowth != null) {
			row.createCell(7).setCellValue(FormulaUtils.convertPercent(nationalTax_yearGrowth));
		} else {
			row.createCell(7).setCellValue("-");
		}
	}
	
	public void writeLocalTax(HSSFRow row, LocalTaxVO localTax) {
		TaxVO tax = new TaxVO(null, null, localTax.getLocalTax_current(), localTax.getLocalTax_lastYear());
		tax.setLocalTax_yearGrowth(localTax.getLocalTax_yearGrowth());
		writeLocalTax(row, tax);
	}
	
	public void writeLocalTax(HSSFRow row, TaxVO tax) {
		LocalTaxEntity tax_current = tax.getLocalTax_current();
		if (tax_current != null) {
			row.createCell(2).setCellValue(Double.valueOf(tax_current.getTaxes()));
		} else {
			row.createCell(2).setCellValue("-");
		}
		
		LocalTaxEntity tax_lastYear = tax.getLocalTax_lastYear();
		if (tax_lastYear != null) {
			row.createCell(3).setCellValue(Double.valueOf(tax_lastYear.getTaxes()));
		} else {
			row.createCell(3).setCellValue("-");
		}
	
		String localTax_yearGrowth = tax.getLocalTax_yearGrowth();
		if (localTax_yearGrowth != null) {
			row.createCell(4).setCellValue(FormulaUtils.convertPercent(localTax_yearGrowth));
		} else {
			row.createCell(4).setCellValue("-");
		}
	}
	
	@Override
	public HSSFWorkbook export(BaseEnterpriseEntity enterprise, Integer type) throws Exception {
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet("sheet1");
		
		// 创建单元格样式
		HSSFCellStyle style = wb.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		
		HSSFRow titleRow = sheet.createRow(0);
		titleRow.setHeight((short) 300);// 设定行的高度
		String[] titles = StringUtils.split(exportColumn.get(type), ",");
		for (int i = 0; i < titles.length; i++) {
			String title = titles[i].trim();
			HSSFCell cell = titleRow.createCell(i);
			cell.setCellStyle(style);
			sheet.setColumnWidth(i, excelCell.get(title).getWidth());
			cell.setCellValue(excelCell.get(title).getTitle());
		}
		
		Long enterpriseId = enterprise.getId();
		int colnum = 1;
		
		switch (type) {
		case ExportType.ENERGY_ENTERPRISE_MONTHLY:
			List<EnergyEntity> energyList = energyService.list(enterpriseId);
			for (EnergyEntity entity: energyList) {
				EnergyVO energy = energyService.detail(entity);
				
				HSSFRow row = sheet.createRow(colnum);
				row.setHeight((short) 300);
				row.createCell(0).setCellValue(entity.getMonthly());
				row.createCell(1).setCellValue(enterprise.getName());
				
				writeEnergy(row, energy);
				colnum++;
			}
			break;
		case ExportType.BENEFIT_ENTERPRISE_MONTHLY:
			List<BenefitEntity> benefitList = benefitService.list(enterpriseId);
			for (BenefitEntity entity: benefitList) {
				BenefitVO benefit = benefitService.detail(entity);
				
				HSSFRow row = sheet.createRow(colnum);
				row.setHeight((short) 300);
				row.createCell(0).setCellValue(entity.getMonthly());
				row.createCell(1).setCellValue(enterprise.getName());
				
				writeBenefit(row, benefit);
				colnum++;
			}
			break;
		case ExportType.ECONOMIC_ENTERPRISE_MONTHLY:
			List<EconomicEntity> economicList = economicService.list(enterpriseId);
			for (EconomicEntity entity: economicList) {
				EconomicVO economic = economicService.detail(entity);
				
				HSSFRow row = sheet.createRow(colnum);
				row.setHeight((short) 300);
				row.createCell(0).setCellValue(entity.getMonthly());
				row.createCell(1).setCellValue(enterprise.getName());
				
				writeEconomic(row, economic);
				colnum++;
			}
			break;
		case ExportType.NATIONALTAX_ENTERPRISE_MONTHLY:
			List<NationalTaxEntity> nationalTaxList = nationalTaxService.listByEnterprise(enterpriseId);
			for (NationalTaxEntity entity: nationalTaxList) {
				NationalTaxVO nationalTax = nationalTaxService.detail(entity);
				
				HSSFRow row = sheet.createRow(colnum);
				row.setHeight((short) 300);
				row.createCell(0).setCellValue(entity.getMonthly());
				row.createCell(1).setCellValue(enterprise.getName());
				
				writeNationalTax(row, nationalTax);
				colnum++;
			}
			break;
		case ExportType.LOCALTAX_ENTERPRISE_MONTHLY:
			List<LocalTaxEntity> localTaxList = localTaxService.listByEnterpriseId(enterpriseId);
			for (LocalTaxEntity entity: localTaxList) {
				LocalTaxVO localTax = localTaxService.detail(entity);
				
				HSSFRow row = sheet.createRow(colnum);
				row.setHeight((short) 300);
				row.createCell(0).setCellValue(entity.getMonthly());
				row.createCell(1).setCellValue(enterprise.getName());
				
				writeLocalTax(row, localTax);
				colnum++;
			}
			break;
		default:
			break;
		}
		
		return wb;
	}
	
	private HSSFWorkbook wb;
	
	@Override
	public void importEnergy(InputStream is) throws Exception {
		wb = new HSSFWorkbook(is);
		HSSFSheet sheet = wb.getSheetAt(0);
		
		HSSFCell cell = null;
		for (int i = 1; i <= sheet.getLastRowNum(); i++) {
			HSSFRow row = sheet.getRow(i);
			if (null == row) {
				continue;
			}
			
			String monthly = row.getCell(0).getStringCellValue();
			String enterpriseName = row.getCell(1).getStringCellValue();
			float electricity = 0;
			float gas = 0;
			
			cell = row.getCell(2);
			if (cell != null) {
				if (cell.getCellType() != HSSFCell.CELL_TYPE_NUMERIC) {
					throw new IllegalArgumentException("argument error");
				}
				electricity = (float) cell.getNumericCellValue();
			}
			cell = row.getCell(3);
			if (cell != null) {
				if (cell.getCellType() != HSSFCell.CELL_TYPE_NUMERIC) {
					throw new IllegalArgumentException("argument error");
				}
				gas = (float) cell.getNumericCellValue();
			}
			
			BaseEnterpriseEntity enterprise = enterpriseService.findByNameBase(enterpriseName);
			if (enterprise == null) {
				continue;
			}
			
			EnergyEntity energy = energyService.findOne(monthly, enterprise.getId());
			if (energy != null) {
				energyService.update(energy, monthly, enterprise, electricity, gas);
			} else if (electricity != 0 || gas != 0) {
				energy = new EnergyEntity(monthly, enterprise, electricity, gas);
				energy.setCreateTime(new Date());
				energyService.save(energy);
			}
		}
	}
	
	@Override
	public void importEconomic(InputStream is) throws Exception {
		wb = new HSSFWorkbook(is);
		HSSFSheet sheet = wb.getSheetAt(0);
		
		HSSFCell cell = null;
		for (int i = 1; i <= sheet.getLastRowNum(); i++) {
			HSSFRow row = sheet.getRow(i);
			if (null == row) {
				continue;
			}
			
			String monthly = row.getCell(0).getStringCellValue();
			String enterpriseName = row.getCell(1).getStringCellValue();
			float industryAddition = 0;
			float mainBusiness = 0;
			float profit = 0;
			float tax = 0;
			
			cell = row.getCell(2);
			if (cell != null) {
				if (cell.getCellType() != HSSFCell.CELL_TYPE_NUMERIC) {
					throw new IllegalArgumentException("argument error");
				}
				industryAddition = (float) cell.getNumericCellValue();
			}
			cell = row.getCell(3);
			if (cell != null) {
				if (cell.getCellType() != HSSFCell.CELL_TYPE_NUMERIC) {
					throw new IllegalArgumentException("argument error");
				}
				mainBusiness = (float) cell.getNumericCellValue();
			}
			cell = row.getCell(4);
			if (cell != null) {
				if (cell.getCellType() != HSSFCell.CELL_TYPE_NUMERIC) {
					throw new IllegalArgumentException("argument error");
				}
				profit = (float) cell.getNumericCellValue();
			}
			cell = row.getCell(5);
			if (cell != null) {
				if (cell.getCellType() != HSSFCell.CELL_TYPE_NUMERIC) {
					throw new IllegalArgumentException("argument error");
				}
				tax = (float) cell.getNumericCellValue();
			}
			
			BaseEnterpriseEntity enterprise = enterpriseService.findByNameBase(enterpriseName);
			if (enterprise == null) {
				continue;
			}
			
			EconomicEntity economic = economicService.findOne(monthly, enterprise.getId());
			if (economic != null) {
				economicService.update(economic, monthly, enterprise, industryAddition, mainBusiness, profit, tax);
			} else if (industryAddition != 0 || mainBusiness != 0 || profit != 0 || tax != 0) {
				economic = new EconomicEntity(monthly, enterprise, industryAddition, mainBusiness, profit, tax);
				economic.setCreateTime(new Date());
				economicService.save(economic);
			}
		}
	}
	
	@Override
	public void importBenefit(InputStream is) throws Exception {
		wb = new HSSFWorkbook(is);
		HSSFSheet sheet = wb.getSheetAt(0);
		
		HSSFCell cell = null;
		for (int i = 1; i <= sheet.getLastRowNum(); i++) {
			HSSFRow row = sheet.getRow(i);
			if (null == row) {
				continue;
			}
			
			String monthly = row.getCell(0).getStringCellValue();
			String enterpriseName = row.getCell(1).getStringCellValue();
			float receivable = 0;
			float inventory = 0;
			float assets = 0;
			float debt = 0;
			
			cell = row.getCell(2);
			if (cell != null) {
				if (cell.getCellType() != HSSFCell.CELL_TYPE_NUMERIC) {
					throw new IllegalArgumentException("argument error");
				}
				receivable = (float) cell.getNumericCellValue();
			}
			cell = row.getCell(3);
			if (cell != null) {
				if (cell.getCellType() != HSSFCell.CELL_TYPE_NUMERIC) {
					throw new IllegalArgumentException("argument error");
				}
				inventory = (float) cell.getNumericCellValue();
			}
			cell = row.getCell(4);
			if (cell != null) {
				if (cell.getCellType() != HSSFCell.CELL_TYPE_NUMERIC) {
					throw new IllegalArgumentException("argument error");
				}
				assets = (float) cell.getNumericCellValue();
			}
			cell = row.getCell(5);
			if (cell != null) {
				if (cell.getCellType() != HSSFCell.CELL_TYPE_NUMERIC) {
					throw new IllegalArgumentException("argument error");
				}
				debt = (float) cell.getNumericCellValue();
			}
			
			BaseEnterpriseEntity enterprise = enterpriseService.findByNameBase(enterpriseName);
			if (enterprise == null) {
				continue;
			}
			
			BenefitEntity benefit = benefitService.findOne(monthly, enterprise.getId());
			if (benefit != null) {
				benefitService.update(benefit, monthly, enterprise, receivable, inventory, assets, debt);
			} else if (receivable != 0 || inventory != 0 || assets != 0 || debt != 0) {
				benefit = new BenefitEntity(monthly, enterprise, receivable, inventory, assets, debt);
				benefit.setCreateTime(new Date());
				benefitService.save(benefit);
			}
		}
	}

	@Override
	public void importNationalTax(InputStream is) throws Exception {
		wb = new HSSFWorkbook(is);
		HSSFSheet sheet = wb.getSheetAt(0);
		
		HSSFCell cell = null;
		for (int i = 1; i <= sheet.getLastRowNum(); i++) {
			HSSFRow row = sheet.getRow(i);
			if (null == row) {
				continue;
			}
			
			String monthly = row.getCell(0).getStringCellValue();
			String enterpriseName = row.getCell(1).getStringCellValue();
			
			String sale = "0";
			String taxes = "0";
			
			cell = row.getCell(2);
			if (cell != null) {
				if (cell.getCellType() != HSSFCell.CELL_TYPE_NUMERIC) {
					throw new IllegalArgumentException("argument error");
				}
				sale = getCellString(cell);
			}
			cell = row.getCell(3);
			if (cell != null) {
				if (cell.getCellType() != HSSFCell.CELL_TYPE_NUMERIC) {
					throw new IllegalArgumentException("argument error");
				}
				taxes = getCellString(cell);
			}
			
			BaseEnterpriseEntity enterprise = enterpriseService.findByNameBase(enterpriseName);
			if (enterprise == null) {
				continue;
			}
			
			NationalTaxEntity nationalTax = nationalTaxService.findOne(monthly, enterprise.getId());
			if (nationalTax != null) {
				nationalTaxService.update(nationalTax, enterprise, monthly, sale, taxes);
			} else {
				nationalTax = new NationalTaxEntity(enterprise, monthly, sale, taxes);
				nationalTax.setCreateTime(new Date());
				nationalTaxService.save(nationalTax);
			}
		}
	}
	
	public String getCellString(HSSFCell cell) {
        DecimalFormat decimalFormat = new DecimalFormat("###0.00");  
        double num = cell.getNumericCellValue();
        return decimalFormat.format(num);  
	}

	@Override
	public void importLocalTax(InputStream is) throws Exception {
		wb = new HSSFWorkbook(is);
		HSSFSheet sheet = wb.getSheetAt(0);
		
		HSSFCell cell = null;
		for (int i = 1; i <= sheet.getLastRowNum(); i++) {
			HSSFRow row = sheet.getRow(i);
			if (null == row) {
				continue;
			}
			
			String monthly = row.getCell(0).getStringCellValue();
			String enterpriseName = row.getCell(1).getStringCellValue();
			String taxes = "0";
			
			cell = row.getCell(2);
			if (cell != null) {
				if (cell.getCellType() != HSSFCell.CELL_TYPE_NUMERIC) {
					throw new IllegalArgumentException("argument error");
				}
				taxes = getCellString(cell);
			}
			
			BaseEnterpriseEntity enterprise = enterpriseService.findByNameBase(enterpriseName);
			if (enterprise == null) {
				continue;
			}
			
			LocalTaxEntity localTax = localTaxService.findOne(monthly, enterprise.getId());
			if (localTax != null) {
				localTaxService.update(localTax, enterprise, monthly, taxes);
			} else {
				localTax = new LocalTaxEntity(enterprise, monthly, taxes);
				localTax.setCreateTime(new Date());
				localTaxService.save(localTax);
			}
		}
	}
	
}