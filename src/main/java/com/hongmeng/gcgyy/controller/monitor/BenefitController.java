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
import com.hongmeng.gcgyy.common.utils.ScoreUtils;
import com.hongmeng.gcgyy.entity.Output;
import com.hongmeng.gcgyy.entity.OutputList;
import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;
import com.hongmeng.gcgyy.entity.baseData.AreaEntity;
import com.hongmeng.gcgyy.entity.baseData.ProductTypeEntity;
import com.hongmeng.gcgyy.entity.baseData.ReportEntity;
import com.hongmeng.gcgyy.entity.baseData.ReportEntity.ReportType;
import com.hongmeng.gcgyy.entity.monitor.BenefitEntity;
import com.hongmeng.gcgyy.entity.monitor.ScoreEntity;
import com.hongmeng.gcgyy.service.authority.EnterpriseService;
import com.hongmeng.gcgyy.service.baseData.AreaService;
import com.hongmeng.gcgyy.service.baseData.ProductTypeService;
import com.hongmeng.gcgyy.service.baseData.ReportService;
import com.hongmeng.gcgyy.service.monitor.BenefitService;
import com.hongmeng.gcgyy.service.monitor.BenefitVO;
import com.hongmeng.gcgyy.service.monitor.ScoreService;

@RestController
@RequestMapping("benefit")
public class BenefitController {

	static Logger log = LoggerFactory.getLogger(BenefitController.class);

	@Autowired
	BenefitService benefitService;

	@Autowired
	EnterpriseService enterpriseService;

	@Autowired
	AreaService areaService;

	@Autowired
	ProductTypeService productTypeService;
	
	@Autowired
	ReportService reportService;
	
	@Autowired
	ScoreService scoreService;


	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public Output add(@RequestParam String monthly, @RequestParam Long enterpriseId, @RequestParam float receivable,
			@RequestParam float inventory, @RequestParam float assets, @RequestParam float debt) {
		try {
			BenefitEntity benefit = benefitService.findOne(monthly, enterpriseId);
			if (benefit != null) {
				return new Output(null, ReturnStatus.EXISTED.status(), ReturnStatus.EXISTED.msg());
			}

			BaseEnterpriseEntity enterprise = enterpriseService.findOneBase(enterpriseId);
			benefit = new BenefitEntity(monthly, enterprise, receivable, inventory, assets, debt);
			benefit.setCreateTime(new Date());
			benefitService.save(benefit);
			
			// ranking 
			ReportEntity report = reportService.findOne(ReportType.BENEFIT);
			if (ScoreUtils.checkReportTime(monthly, report.getDays())) {
				ScoreEntity score = scoreService.findByEnterpriseId(enterpriseId);
				if (score == null) {
					score = new ScoreEntity(enterprise, 0);
					score.setCreateTime(new Date());
				}
				
				Integer newScore = score.getScore() + 1;
				score.setScore(newScore);
				scoreService.save(score);
			}
			
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public Output add(@RequestParam Long benefitId, @RequestParam String monthly, @RequestParam Long enterpriseId,
			@RequestParam float receivable, @RequestParam float inventory, @RequestParam float assets,
			@RequestParam float debt) {
		try {
			BaseEnterpriseEntity enterprise = enterpriseService.findOneBase(enterpriseId);
			BenefitEntity benefit = benefitService.findOne(benefitId);
			benefitService.update(benefit, monthly, enterprise, receivable, inventory, assets, debt);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public Output delete(@RequestParam String benefitIds) {
		try {
			List<Long> list = new LinkedList<>();
			for (String idStr : StringUtils.split(benefitIds, ",")) {
				list.add(Long.parseLong(idStr));
			}
			benefitService.delete(list);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			if (e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Output(null, ReturnStatus.CONSTRAINT.status(), e.getMessage());
			}
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public Output detail(@RequestParam Long benefitId) {
		try {
			BenefitEntity benefit = benefitService.findOne(benefitId);
			return new Output(benefit, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByMonthly", method = RequestMethod.POST)
	public OutputList listByMonthly(@RequestParam String monthly) {
		try {
			List<BenefitVO> list = new LinkedList<>();

			List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listBase();
			for (BaseEnterpriseEntity enterprise : enterpriseList) {
				list.add(benefitService.detail(monthly, enterprise));
			}

			return new OutputList(list, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByMonthlyPaging", method = RequestMethod.POST)
	public OutputList listByMonthlyPaging(@RequestParam String monthly, @RequestParam int page,
			@RequestParam int size) {
		try {
			List<BenefitVO> list = new LinkedList<>();

			List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listBase(page, size);
			for (BaseEnterpriseEntity enterprise : enterpriseList) {
				list.add(benefitService.detail(monthly, enterprise));
			}

			return new OutputList(list, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/listRange", method = RequestMethod.POST)
	public OutputList listRange(@RequestParam String monthlyStart, @RequestParam String monthlyEnd) {
		try {
			List<BenefitVO> list = new LinkedList<>();

			List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listBase();
			List<String> monthlyList = FormulaUtils.getMonthlyList(monthlyStart, monthlyEnd);
			for (String monthly : monthlyList) {
				BenefitVO ret = benefitService.sumEnterpriseBenefit(monthly, enterpriseList);
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
			List<BenefitVO> list = new LinkedList<>();

			BaseEnterpriseEntity enterprise = enterpriseService.findOneBase(enterpriseId);
			List<BaseEnterpriseEntity> enterpriseList = new LinkedList<>();
			enterpriseList.add(enterprise);

			List<String> monthlyList = FormulaUtils.getMonthlyList(monthlyStart, monthlyEnd);
			for (String monthly : monthlyList) {
				BenefitVO ret = benefitService.detail(monthly, enterprise);
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
			List<BenefitVO> list = new LinkedList<>();

			ProductTypeEntity productType = productTypeService.findOne(productTypeId);
			List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listByProductTypeId(productTypeId);
			List<String> monthlyList = FormulaUtils.getMonthlyList(monthlyStart, monthlyEnd);
			for (String monthly : monthlyList) {
				BenefitVO ret = benefitService.sumEnterpriseBenefit(monthly, enterpriseList);
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
			List<BenefitVO> list = new LinkedList<>();

			AreaEntity area = areaService.findOne(areaId);
			List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listByAreaId(areaId);
			List<String> monthlyList = FormulaUtils.getMonthlyList(monthlyStart, monthlyEnd);
			for (String monthly : monthlyList) {
				BenefitVO ret = benefitService.sumEnterpriseBenefit(monthly, enterpriseList);
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
			List<BenefitVO> list = new LinkedList<>();

			List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listPoint();
			List<String> monthlyList = FormulaUtils.getMonthlyList(monthlyStart, monthlyEnd);
			for (String monthly : monthlyList) {
				BenefitVO ret = benefitService.sumEnterpriseBenefit(monthly, enterpriseList);
				list.add(ret);
			}

			return new OutputList(list, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/listByEnterpriseId", method = RequestMethod.POST)
	public OutputList listByEnterpriseId(@RequestParam Long enterpriseId) {
		try {
			List<BenefitVO> list = new LinkedList<>();

			List<BenefitEntity> benefits = benefitService.list(enterpriseId);
			for (BenefitEntity benefit : benefits) {
				list.add(benefitService.detail(benefit));
			}

			return new OutputList(list, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByEnterpriseIdPaging", method = RequestMethod.POST)
	public OutputList listByEnterpriseIdPaging(@RequestParam Long enterpriseId, @RequestParam int page,
			@RequestParam int size) {
		try {
			List<BenefitVO> list = new LinkedList<>();

			List<BenefitEntity> benefits = benefitService.list(enterpriseId, page, size);
			for (BenefitEntity benefit : benefits) {
				list.add(benefitService.detail(benefit));
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
			List<BenefitVO> retList = new LinkedList<>();

			List<ProductTypeEntity> productTypeList = productTypeService.list();
			for (ProductTypeEntity productType : productTypeList) {
				List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listByProductTypeId(productType.getId());
				BenefitVO ret = benefitService.sumEnterpriseBenefit(monthly, enterpriseList);
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
			List<BenefitVO> retList = new LinkedList<>();

			List<AreaEntity> areaList = areaService.list();
			for (AreaEntity area : areaList) {
				List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listByAreaId(area.getId());
				BenefitVO ret = benefitService.sumEnterpriseBenefit(monthly, enterpriseList);
				ret.setArea(area);
				retList.add(ret);
			}

			return new OutputList(retList, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	/*@RequestMapping(value = "/report", method = RequestMethod.POST)
	public Output report(@RequestParam Long benefitId) {
		try {
			BenefitEntity benefit = benefitService.findOne(benefitId);
			benefit.setStatus(ApproveStatus.REPORT);
			benefitService.save(benefit);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/pass", method = RequestMethod.POST)
	public Output pass(@RequestParam Long benefitId) {
		try {
			BenefitEntity benefit = benefitService.findOne(benefitId);
			benefit.setStatus(ApproveStatus.PASS);
			benefitService.save(benefit);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/reject", method = RequestMethod.POST)
	public Output reject(@RequestParam Long benefitId) {
		try {
			BenefitEntity benefit = benefitService.findOne(benefitId);
			benefit.setStatus(ApproveStatus.REJECT);
			benefitService.save(benefit);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}*/

}
