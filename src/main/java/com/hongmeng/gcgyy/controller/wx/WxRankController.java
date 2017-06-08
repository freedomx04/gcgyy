package com.hongmeng.gcgyy.controller.wx;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hongmeng.gcgyy.entity.baseData.CountyEntity;
import com.hongmeng.gcgyy.entity.ranking.ElectricityEntity;
import com.hongmeng.gcgyy.entity.ranking.IndustryAdditionEntity;
import com.hongmeng.gcgyy.entity.ranking.IndustryOutputEntity;
import com.hongmeng.gcgyy.entity.ranking.MainBusinessEntity;
import com.hongmeng.gcgyy.entity.ranking.ProfitEntity;
import com.hongmeng.gcgyy.entity.ranking.ProfitTaxEntity;
import com.hongmeng.gcgyy.entity.ranking.VatEntity;
import com.hongmeng.gcgyy.service.baseData.CountyService;
import com.hongmeng.gcgyy.service.ranking.ElectricityService;
import com.hongmeng.gcgyy.service.ranking.IndustryAdditionService;
import com.hongmeng.gcgyy.service.ranking.IndustryOutputService;
import com.hongmeng.gcgyy.service.ranking.MainBusinessService;
import com.hongmeng.gcgyy.service.ranking.ProfitService;
import com.hongmeng.gcgyy.service.ranking.ProfitTaxService;
import com.hongmeng.gcgyy.service.ranking.VatService;

@Controller
public class WxRankController {
	
	static Logger log = LoggerFactory.getLogger(WxRankController.class);
	
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
	
	@RequestMapping("/wx/rank")
	String rank() {
		return "wx/rank/menu";
	}
	
	@RequestMapping(value = "/wx/rank/addition")
	String addition(ModelMap modelMap, String month) {
		Date d = new Date();  
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy MM");  
        String dateNowStr = sdf.format(d); 
        String monthly = month == null ? dateNowStr : month;
        List<IndustryAdditionEntity> list = new LinkedList<>();

		List<CountyEntity> countyList = countyService.list();
		for (CountyEntity county : countyList) {
			IndustryAdditionEntity addition = additionService.findOne(monthly, county.getId());
			if (addition == null) {
				addition = new IndustryAdditionEntity(monthly, county);
				addition.setCreateTime(new Date());
				additionService.save(addition);
			}
			list.add(addition);
		}
		
		modelMap.addAttribute("monthly", monthly);
		modelMap.addAttribute("additionList", list);
		return "wx/rank/industry_addition";
	}
	
	@RequestMapping(value = "/wx/rank/business")
	String business(ModelMap modelMap, String month) {
		Date d = new Date();  
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy MM");  
        String dateNowStr = sdf.format(d); 
        String monthly = month == null ? dateNowStr : month;
        List<MainBusinessEntity> list = new LinkedList<>();

		List<CountyEntity> countyList = countyService.list();
		for (CountyEntity county : countyList) {
			MainBusinessEntity business = businessService.findOne(monthly, county.getId());
			if (business == null) {
				business = new MainBusinessEntity(monthly, county);
				business.setCreateTime(new Date());
				businessService.save(business);
			}
			list.add(business);
		}
		
		modelMap.addAttribute("monthly", monthly);
		modelMap.addAttribute("businessList", list);
		return "wx/rank/main_business";
	}
	
	@RequestMapping(value = "/wx/rank/tax")
	String tax(ModelMap modelMap, String month) {
		Date d = new Date();  
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy MM");  
        String dateNowStr = sdf.format(d); 
        String monthly = month == null ? dateNowStr : month;
        List<ProfitTaxEntity> list = new LinkedList<>();

		List<CountyEntity> countyList = countyService.list();
		for (CountyEntity county : countyList) {
			ProfitTaxEntity tax = taxService.findOne(monthly, county.getId());
			if (tax == null) {
				tax = new ProfitTaxEntity(monthly, county);
				tax.setCreateTime(new Date());
				taxService.save(tax);
			}
			list.add(tax);
		}
		
		modelMap.addAttribute("monthly", monthly);
		modelMap.addAttribute("taxList", list);
		return "wx/rank/profit_tax";
	}
	
	@RequestMapping(value = "/wx/rank/electricity")
	String electricity(ModelMap modelMap, String month) {
		Date d = new Date();  
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy MM");  
        String dateNowStr = sdf.format(d); 
        String monthly = month == null ? dateNowStr : month;
        
        List<ElectricityEntity> list = new LinkedList<>();

		List<CountyEntity> countyList = countyService.list();
		for (CountyEntity county : countyList) {
			ElectricityEntity electricity = electricityService.findOne(monthly, county.getId());
			if (electricity == null) {
				electricity = new ElectricityEntity(monthly, county);
				electricity.setCreateTime(new Date());
				electricityService.save(electricity);
			}
			list.add(electricity);
		}
		
		modelMap.addAttribute("monthly", monthly);
		modelMap.addAttribute("electricityList", list);
		return "wx/rank/electricity";
	}
	
	@RequestMapping(value = "/wx/rank/output")
	String output(ModelMap modelMap, String month) {
		Date d = new Date();  
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy MM");  
        String dateNowStr = sdf.format(d); 
        String monthly = month == null ? dateNowStr : month;
        List<IndustryOutputEntity> list = new LinkedList<>();

		List<CountyEntity> countyList = countyService.list();
		for (CountyEntity county : countyList) {
			IndustryOutputEntity output = outputService.findOne(monthly, county.getId());
			if (output == null) {
				output = new IndustryOutputEntity(monthly, county);
				output.setCreateTime(new Date());
				outputService.save(output);
			}
			list.add(output);
		}
		
		modelMap.addAttribute("monthly", monthly);
		modelMap.addAttribute("outputList", list);
		return "wx/rank/industry_output";
	}
	
	@RequestMapping(value = "/wx/rank/vat")
	String vat(ModelMap modelMap, String month) {
		Date d = new Date();  
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy MM");  
        String dateNowStr = sdf.format(d); 
        String monthly = month == null ? dateNowStr : month;
        List<VatEntity> list = new LinkedList<>();

		List<CountyEntity> countyList = countyService.list();
		for (CountyEntity county : countyList) {
			VatEntity vat = vatService.findOne(monthly, county.getId());
			if (vat == null) {
				vat = new VatEntity(monthly, county);
				vat.setCreateTime(new Date());
				vatService.save(vat);
			}
			list.add(vat);
		}
		
		modelMap.addAttribute("monthly", monthly);
		modelMap.addAttribute("vatList", list);
		return "wx/rank/vat";
	}
	
	@RequestMapping(value = "/wx/rank/profit")
	String profit(ModelMap modelMap, String month) {
		Date d = new Date();  
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy MM");  
        String dateNowStr = sdf.format(d); 
        String monthly = month == null ? dateNowStr : month;
        List<ProfitEntity> list = new LinkedList<>();

		List<CountyEntity> countyList = countyService.list();
		for (CountyEntity county : countyList) {
			ProfitEntity profit = profitService.findOne(monthly, county.getId());
			if (profit == null) {
				profit = new ProfitEntity(monthly, county);
				profit.setCreateTime(new Date());
				profitService.save(profit);
			}
			list.add(profit);
		}
		
		modelMap.addAttribute("monthly", monthly);
		modelMap.addAttribute("profitList", list);
		return "wx/rank/profit";
	}
}
