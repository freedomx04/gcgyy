package com.hongmeng.gcgyy.controller.monitor;

import java.util.LinkedList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hongmeng.gcgyy.common.ReturnStatus;
import com.hongmeng.gcgyy.common.utils.FormulaUtils;
import com.hongmeng.gcgyy.entity.OutputList;
import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;
import com.hongmeng.gcgyy.entity.baseData.AreaEntity;
import com.hongmeng.gcgyy.entity.baseData.ProductTypeEntity;
import com.hongmeng.gcgyy.service.authority.EnterpriseService;
import com.hongmeng.gcgyy.service.baseData.AreaService;
import com.hongmeng.gcgyy.service.baseData.ProductTypeService;
import com.hongmeng.gcgyy.service.monitor.TaxService;
import com.hongmeng.gcgyy.service.monitor.TaxVO;

@RestController
@RequestMapping("tax")
public class TaxController {
	
	static Logger log = LoggerFactory.getLogger(TaxController.class);
	
	@Autowired
	EnterpriseService enterpriseService;

	@Autowired
	TaxService taxService;

	@Autowired
	AreaService areaService;

	@Autowired
	ProductTypeService productTypeService;
	
	@RequestMapping(value = "/listRange", method = RequestMethod.POST)
	public OutputList listRange(@RequestParam String monthlyStart, @RequestParam String monthlyEnd) {
		try {
			List<TaxVO> list = new LinkedList<>();

			List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listBase();
			List<String> monthlyList = FormulaUtils.getMonthlyList(monthlyStart, monthlyEnd);
			for (String monthly : monthlyList) {
				TaxVO ret = taxService.sumEnterpriseTax(monthly, enterpriseList);
				list.add(ret);
			}

			return new OutputList(list, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/listByEnterpriseIdRange", method = RequestMethod.POST)
	public OutputList listByEnterpriseIdRange(@RequestParam Long enterpriseId, @RequestParam String monthlyStart,
			@RequestParam String monthlyEnd) {
		try {
			List<TaxVO> list = new LinkedList<>();
			BaseEnterpriseEntity enterprise = enterpriseService.findOneBase(enterpriseId);
			
			List<String> monthlyList = FormulaUtils.getMonthlyList(monthlyStart, monthlyEnd);
			for (String monthly: monthlyList) {
				TaxVO ret = taxService.detail(monthly, enterprise);
				ret.setEnterprise(enterprise);
				list.add(ret);
			}

			return new OutputList(list, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/listByProductTypeIdRange", method = RequestMethod.POST)
	public OutputList listByProductTypeIdRange(@RequestParam Long productTypeId, @RequestParam String monthlyStart,
			@RequestParam String monthlyEnd) {
		try {
			List<TaxVO> list = new LinkedList<>();

			ProductTypeEntity productType = productTypeService.findOne(productTypeId);
			List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listByProductTypeId(productTypeId);
			List<String> monthlyList = FormulaUtils.getMonthlyList(monthlyStart, monthlyEnd);
			for (String monthly : monthlyList) {
				TaxVO ret = taxService.sumEnterpriseTax(monthly, enterpriseList);
				ret.setProductType(productType);
				list.add(ret);
			}

			return new OutputList(list, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByAreaIdRange", method = RequestMethod.POST)
	public OutputList listByAreaIdRange(@RequestParam Long areaId, @RequestParam String monthlyStart,
			@RequestParam String monthlyEnd) {
		try {
			List<TaxVO> list = new LinkedList<>();

			AreaEntity area = areaService.findOne(areaId);
			List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listByAreaId(area.getId());
			List<String> monthlyList = FormulaUtils.getMonthlyList(monthlyStart, monthlyEnd);
			for (String monthly : monthlyList) {
				TaxVO ret = taxService.sumEnterpriseTax(monthly, enterpriseList);
				ret.setArea(area);
				list.add(ret);
			}

			return new OutputList(list, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/listPointEnterpriseRange", method = RequestMethod.POST)
	public OutputList listPointEnterpriseRange(@RequestParam String monthlyStart, @RequestParam String monthlyEnd) {
		try {
			List<TaxVO> list = new LinkedList<>();

			List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listPoint();
			List<String> monthlyList = FormulaUtils.getMonthlyList(monthlyStart, monthlyEnd);
			for (String monthly : monthlyList) {
				TaxVO ret = taxService.sumEnterpriseTax(monthly, enterpriseList);
				list.add(ret);
			}

			return new OutputList(list, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	
	@RequestMapping(value = "/listByEnterprise", method = RequestMethod.POST)
	public OutputList listByMonthly(@RequestParam String monthly) {
		try {
			List<TaxVO> list = new LinkedList<>();
			
			List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listBase();
			for (BaseEnterpriseEntity enterprise: enterpriseList) {
				list.add(taxService.detail(monthly, enterprise));
			}

			return new OutputList(list, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/listByEnterprisePaging", method = RequestMethod.POST)
	public OutputList listByEnterprisePaging(@RequestParam String monthly, @RequestParam int page,
			@RequestParam int size) {
		try {
			List<TaxVO> list = new LinkedList<>();
			
			List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listBase(page, size);
			for (BaseEnterpriseEntity enterprise: enterpriseList) {
				list.add(taxService.detail(monthly, enterprise));
			}

			return new OutputList(list, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/listByProductType", method = RequestMethod.POST)
	public OutputList listByProductType(@RequestParam String monthly) {
		try {
			List<TaxVO> retList = new LinkedList<>();

			List<ProductTypeEntity> productTypeList = productTypeService.list();
			for (ProductTypeEntity productType : productTypeList) {
				List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listByProductTypeId(productType.getId());
				TaxVO ret = taxService.sumEnterpriseTax(monthly, enterpriseList);
				ret.setProductType(productType);
				retList.add(ret);
			}

			return new OutputList(retList, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByArea", method = RequestMethod.POST)
	public OutputList listByArea(@RequestParam String monthly) {
		try {
			List<TaxVO> retList = new LinkedList<>();

			List<AreaEntity> areaList = areaService.list();
			for (AreaEntity area : areaList) {
				List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listByAreaId(area.getId());
				TaxVO ret = taxService.sumEnterpriseTax(monthly, enterpriseList);
				ret.setArea(area);
				retList.add(ret);
			}

			return new OutputList(retList, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
}