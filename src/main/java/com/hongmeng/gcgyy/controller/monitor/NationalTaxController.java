package com.hongmeng.gcgyy.controller.monitor;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hongmeng.gcgyy.common.ReturnStatus;
import com.hongmeng.gcgyy.common.utils.FormulaUtils;
import com.hongmeng.gcgyy.entity.Output;
import com.hongmeng.gcgyy.entity.OutputList;
import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;
import com.hongmeng.gcgyy.entity.baseData.AreaEntity;
import com.hongmeng.gcgyy.entity.baseData.ProductTypeEntity;
import com.hongmeng.gcgyy.entity.monitor.NationalTaxEntity;
import com.hongmeng.gcgyy.service.authority.EnterpriseService;
import com.hongmeng.gcgyy.service.baseData.AreaService;
import com.hongmeng.gcgyy.service.baseData.ProductTypeService;
import com.hongmeng.gcgyy.service.monitor.NationalTaxService;
import com.hongmeng.gcgyy.service.monitor.NationalTaxVO;

@RestController
@RequestMapping("nationalTax")
public class NationalTaxController {

	static Logger log = LoggerFactory.getLogger(NationalTaxController.class);

	@Autowired
	EnterpriseService enterpriseService;

	@Autowired
	NationalTaxService nationalTaxService;

	@Autowired
	AreaService areaService;

	@Autowired
	ProductTypeService productTypeService;

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public Output add(@RequestParam Long enterpriseId, @RequestParam String monthly, @RequestParam String sale,
			@RequestParam String taxes) {
		try {
			NationalTaxEntity nationalTax = nationalTaxService.findOne(monthly, enterpriseId);
			if (nationalTax != null) {
				return new Output(null, ReturnStatus.EXISTED.status(), ReturnStatus.EXISTED.msg());
			}

			BaseEnterpriseEntity enterprise = enterpriseService.findOneBase(enterpriseId);
			nationalTax = new NationalTaxEntity(enterprise, monthly, sale, taxes);
			nationalTax.setCreateTime(new Date());
			// nationalTax.setStatus(ApproveStatus.REPORT);
			nationalTaxService.save(nationalTax);

			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public Output edit(@RequestParam Long nationalTaxId, @RequestParam Long enterpriseId, @RequestParam String monthly,
			@RequestParam String sale, @RequestParam String taxes) {
		try {
			NationalTaxEntity nationalTax = nationalTaxService.findOne(nationalTaxId);
			BaseEnterpriseEntity enterprise = enterpriseService.findOneBase(enterpriseId);
			nationalTaxService.update(nationalTax, enterprise, monthly, sale, taxes);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public Output detail(@RequestParam Long nationalTaxId) {
		try {
			NationalTaxEntity nationalTax = nationalTaxService.findOne(nationalTaxId);
			return new Output(nationalTax, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public Output delete(@RequestParam String nationalTaxIds) {
		try {
			List<Long> list = new LinkedList<>();
			for (String idStr : StringUtils.split(nationalTaxIds, ",")) {
				list.add(Long.parseLong(idStr));
			}
			nationalTaxService.delete(list);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/listRange", method = RequestMethod.POST)
	public OutputList listRange(@RequestParam String monthlyStart, @RequestParam String monthlyEnd) {
		try {
			List<NationalTaxVO> list = new LinkedList<>();

			List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listBase();
			List<String> monthlyList = FormulaUtils.getMonthlyList(monthlyStart, monthlyEnd);
			for (String monthly : monthlyList) {
				NationalTaxVO ret = nationalTaxService.sumEnterpriseTax(monthly, enterpriseList);
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
			List<NationalTaxVO> list = new LinkedList<>();
			BaseEnterpriseEntity enterprise = enterpriseService.findOneBase(enterpriseId);
			
			List<String> monthlyList = FormulaUtils.getMonthlyList(monthlyStart, monthlyEnd);
			for (String monthly: monthlyList) {
				NationalTaxVO ret = nationalTaxService.detail(monthly, enterprise);
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
			List<NationalTaxVO> list = new LinkedList<>();

			ProductTypeEntity productType = productTypeService.findOne(productTypeId);
			List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listByProductTypeId(productTypeId);
			List<String> monthlyList = FormulaUtils.getMonthlyList(monthlyStart, monthlyEnd);
			for (String monthly : monthlyList) {
				NationalTaxVO ret = nationalTaxService.sumEnterpriseTax(monthly, enterpriseList);
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
			List<NationalTaxVO> list = new LinkedList<>();

			AreaEntity area = areaService.findOne(areaId);
			List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listByAreaId(area.getId());
			List<String> monthlyList = FormulaUtils.getMonthlyList(monthlyStart, monthlyEnd);
			for (String monthly : monthlyList) {
				NationalTaxVO ret = nationalTaxService.sumEnterpriseTax(monthly, enterpriseList);
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
			List<NationalTaxVO> list = new LinkedList<>();

			List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listPoint();
			List<String> monthlyList = FormulaUtils.getMonthlyList(monthlyStart, monthlyEnd);
			for (String monthly : monthlyList) {
				NationalTaxVO ret = nationalTaxService.sumEnterpriseTax(monthly, enterpriseList);
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
			List<NationalTaxVO> list = new LinkedList<>();
			
			List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listBase();
			for (BaseEnterpriseEntity enterprise: enterpriseList) {
				list.add(nationalTaxService.detail(monthly, enterprise));
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
			List<NationalTaxVO> list = new LinkedList<>();
			
			List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listBase(page, size);
			for (BaseEnterpriseEntity enterprise: enterpriseList) {
				list.add(nationalTaxService.detail(monthly, enterprise));
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
			List<NationalTaxVO> retList = new LinkedList<>();

			List<ProductTypeEntity> productTypeList = productTypeService.list();
			for (ProductTypeEntity productType : productTypeList) {
				List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listByProductTypeId(productType.getId());
				NationalTaxVO ret = nationalTaxService.sumEnterpriseTax(monthly, enterpriseList);
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
			List<NationalTaxVO> retList = new LinkedList<>();

			List<AreaEntity> areaList = areaService.list();
			for (AreaEntity area : areaList) {
				List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listByAreaId(area.getId());
				NationalTaxVO ret = nationalTaxService.sumEnterpriseTax(monthly, enterpriseList);
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