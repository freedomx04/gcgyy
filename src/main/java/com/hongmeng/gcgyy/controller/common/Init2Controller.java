package com.hongmeng.gcgyy.controller.common;

import java.io.File;
import java.io.FileInputStream;
import java.text.DecimalFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.hongmeng.gcgyy.common.ReturnStatus;
import com.hongmeng.gcgyy.common.utils.FileUtils;
import com.hongmeng.gcgyy.common.utils.FormulaUtils;
import com.hongmeng.gcgyy.entity.Output;
import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;
import com.hongmeng.gcgyy.entity.authority.EnterpriseEntity;
import com.hongmeng.gcgyy.entity.monitor.EnergyEntity;
import com.hongmeng.gcgyy.entity.monitor.LocalTaxEntity;
import com.hongmeng.gcgyy.entity.monitor.NationalTaxEntity;
import com.hongmeng.gcgyy.service.authority.EnterpriseService;
import com.hongmeng.gcgyy.service.monitor.EnergyService;
import com.hongmeng.gcgyy.service.monitor.LocalTaxService;
import com.hongmeng.gcgyy.service.monitor.NationalTaxService;

@RestController
@RequestMapping("init2")
public class Init2Controller {
	
	static Logger log = LoggerFactory.getLogger(Init2Controller.class);
	
	@Autowired
	EnterpriseService enterpriseService;
	
	@Autowired
	NationalTaxService nationalTaxService;
	
	@Autowired
	LocalTaxService localTaxService;
	
	@Autowired
	EnergyService energyService;
	
	@Autowired
	HttpServletRequest request;
	
	private HSSFWorkbook hssfWorkbook;
	
	private File errorFile = new File("./error.txt");
	
	@RequestMapping(value = "/enterpriseName", method = RequestMethod.POST)
	public Output enterpriseName() {
		try {
			String root = request.getSession().getServletContext().getRealPath("/");
			File file = new File(root + "/resource/enterpriseName.xls");
			
			hssfWorkbook = new HSSFWorkbook(new FileInputStream(file));
			HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(0);
			
			for (int i = 1; i <= hssfSheet.getLastRowNum(); i++) {
				HSSFRow row = hssfSheet.getRow(i);
				if (null == row) {
					continue;
				}
				
				for (int k = 0; k < row.getLastCellNum(); k++) {
					HSSFCell cell = row.getCell(k);
					String name = (cell == null) ? "" : cell.getStringCellValue();
					
					EnterpriseEntity enterprise = enterpriseService.findByName(name);
					if (enterprise == null) {
						enterprise = new EnterpriseEntity();
						enterprise.setName(name);
					}
					
					enterpriseService.save(enterprise);
				}
			}
			
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/nationalTax", method = RequestMethod.POST)
	public Output nationalTax() {
		try {
			String root = request.getSession().getServletContext().getRealPath("/");
			File file = new File(root + "/resource/nationalTax.xls");
			hssfWorkbook = new HSSFWorkbook(new FileInputStream(file));
			
			for (int m = 0; m < 10; m++) {
				HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(m);
				String monthly = "2016-" + formatMonth(m + 1);
				String monthly_lastYear = FormulaUtils.getLastYearMonthly(monthly);
				
				for (int i = 1; i < hssfSheet.getLastRowNum(); i++) {
					HSSFRow row = hssfSheet.getRow(i);
					if (null == row) {
						continue;
					}
					
					String name = row.getCell(0).getStringCellValue().trim();
					BaseEnterpriseEntity enterprise = enterpriseService.findByNameBase(name);
					if (enterprise == null) {
						FileUtils.writeInfo(errorFile, name, true);
						continue;
					}
					
					// current
					String sale_current = "0";
					String taxes_current = "0";
					
					HSSFCell saleCell_current = row.getCell(5);
					HSSFCell taxCell_current = row.getCell(7);
					if (saleCell_current != null) {
						sale_current = getCellString(saleCell_current);
					}
					if (taxCell_current != null) {
						taxes_current = getCellString(taxCell_current);
					}
					
					NationalTaxEntity nationalTax_current = nationalTaxService.findOne(monthly, enterprise.getId());
					if (nationalTax_current == null) {
						nationalTax_current = new NationalTaxEntity(enterprise, monthly);
						nationalTax_current.setCreateTime(new Date());
					}
					nationalTax_current.setSale(sale_current);
					nationalTax_current.setTaxes(taxes_current);
					nationalTaxService.save(nationalTax_current);
					
					// last year
					String sale_lastYear = "0";
					String taxes_lastYear = "0";
					
					HSSFCell saleCell_lastYear = row.getCell(6);
					HSSFCell taxCell_lastYear = row.getCell(8);
					if (saleCell_lastYear != null) {
						sale_lastYear = getCellString(saleCell_lastYear);
					}
					if (taxCell_lastYear != null) {
						taxes_lastYear = getCellString(taxCell_lastYear);
					}
					
					NationalTaxEntity nationalTax_lastYear = nationalTaxService.findOne(monthly_lastYear, enterprise.getId());
					if (nationalTax_lastYear == null) {
						nationalTax_lastYear = new NationalTaxEntity(enterprise, monthly_lastYear);
						nationalTax_lastYear.setCreateTime(new Date());
					}
					nationalTax_lastYear.setSale(sale_lastYear);
					nationalTax_lastYear.setTaxes(taxes_lastYear);
					nationalTaxService.save(nationalTax_lastYear);
					
				}
			}
			
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/localTax", method = RequestMethod.POST)
	public Output localTax() {
		try {
			String root = request.getSession().getServletContext().getRealPath("/");
			File file = new File(root + "/resource/localTax.xls");
			hssfWorkbook = new HSSFWorkbook(new FileInputStream(file));
			
			for (int m = 0; m < 12; m++) {
				HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(m);
				String monthly = "2016-" + formatMonth(m + 1);
				String monthly_lastYear = FormulaUtils.getLastYearMonthly(monthly);
				
				for (int i = 1; i < hssfSheet.getLastRowNum(); i++) {
					HSSFRow row = hssfSheet.getRow(i);
					if (null == row) {
						continue;
					}
					
					String name = row.getCell(0).getStringCellValue().trim();
					BaseEnterpriseEntity enterprise = enterpriseService.findByNameBase(name);
					if (enterprise == null) {
						FileUtils.writeInfo(errorFile, name, true);
						continue;
					}
					
					// current
					String taxes_current = "0";
					
					HSSFCell taxCell_current = row.getCell(3);
					if (taxCell_current != null) {
						taxes_current = getCellString(taxCell_current);
					}
					LocalTaxEntity localTax_current = localTaxService.findOne(monthly, enterprise.getId());
					if (localTax_current == null) {
						localTax_current = new LocalTaxEntity(enterprise, monthly);
						localTax_current.setCreateTime(new Date());
					}
					localTax_current.setTaxes(taxes_current);
					localTaxService.save(localTax_current);
					
					// last year
					String taxes_lastYear = "0";
					
					HSSFCell taxCell_lastYear = row.getCell(4);
					if (taxCell_lastYear != null) {
						taxes_lastYear = getCellString(taxCell_lastYear);
					}
					LocalTaxEntity localTax_lastYear = localTaxService.findOne(monthly_lastYear, enterprise.getId());
					if (localTax_lastYear == null) {
						localTax_lastYear = new LocalTaxEntity(enterprise, monthly_lastYear);
						localTax_lastYear.setCreateTime(new Date());
					}
					localTax_lastYear.setTaxes(taxes_lastYear);
					localTaxService.save(localTax_lastYear);
				}
			}
			
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/energy", method = RequestMethod.POST)
	public Output energy() {
		try {
			String root = request.getSession().getServletContext().getRealPath("/");
			File file = new File(root + "/resource/energy.xls");
			hssfWorkbook = new HSSFWorkbook(new FileInputStream(file));
			
			
			for (int y = 0; y < 2; y++) {
				HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(y);
				String year = (y == 0 ? "2015" : "2016");
				
				for (int i = 1; i < hssfSheet.getLastRowNum(); i++) {
					HSSFRow row = hssfSheet.getRow(i);
					if (null == row) {
						continue;
					}
					
					String name = row.getCell(0).getStringCellValue().trim();
					BaseEnterpriseEntity enterprise = enterpriseService.findByNameBase(name);
					if (enterprise == null) {
						FileUtils.writeInfo(errorFile, name, true);
						continue;
					}
					
					for (int m = 1; m <= 12; m++) {
						String monthly = year + "-" + formatMonth(m);
						
						Float electricity = new Float(0);
						HSSFCell cell = row.getCell(m);
						if (cell != null) {
							electricity = (float) cell.getNumericCellValue();
						}
						EnergyEntity energy = energyService.findOne(monthly, enterprise.getId());
						if (energy == null) {
							energy = new EnergyEntity(monthly, enterprise);
							energy.setCreateTime(new Date());
						}
						energy.setElectricity(electricity);
						energyService.save(energy);
					}
				}
			}
			
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	public String formatMonth(int m) {
		String month = String.valueOf(m);
		return month.length() == 1 ? "0" + month : month;
	}
	
	public String getCellString(HSSFCell cell) {
        DecimalFormat decimalFormat = new DecimalFormat("###0.00");  
        double num = cell.getNumericCellValue();
        return decimalFormat.format(num);  
	}
	
}
