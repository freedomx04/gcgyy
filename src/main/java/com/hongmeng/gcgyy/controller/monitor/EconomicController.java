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
import com.hongmeng.gcgyy.entity.monitor.EconomicEntity;
import com.hongmeng.gcgyy.entity.monitor.EconomicTargetEntity;
import com.hongmeng.gcgyy.entity.monitor.ScoreEntity;
import com.hongmeng.gcgyy.service.authority.EnterpriseService;
import com.hongmeng.gcgyy.service.baseData.AreaService;
import com.hongmeng.gcgyy.service.baseData.ProductTypeService;
import com.hongmeng.gcgyy.service.baseData.ReportService;
import com.hongmeng.gcgyy.service.monitor.EconomicService;
import com.hongmeng.gcgyy.service.monitor.EconomicVO;
import com.hongmeng.gcgyy.service.monitor.ScoreService;

@RestController
@RequestMapping("economic")
public class EconomicController {

	static Logger log = LoggerFactory.getLogger(EconomicController.class);

	@Autowired
	EconomicService economicService;

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
	public Output add(@RequestParam String monthly, @RequestParam Long enterpriseId, @RequestParam float mainBusiness,
			@RequestParam float profit, @RequestParam float tax) {
		try {
			EconomicEntity economic = economicService.findOne(monthly, enterpriseId);
			if (economic != null) {
				return new Output(null, ReturnStatus.EXISTED.status(), ReturnStatus.EXISTED.msg());
			}

			BaseEnterpriseEntity enterprise = enterpriseService.findOneBase(enterpriseId);
			economic = new EconomicEntity(monthly, enterprise, mainBusiness, profit, tax);
			economic.setCreateTime(new Date());
			economicService.save(economic);

			// ranking
			ReportEntity report = reportService.findOne(ReportType.ECONOMIC);
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
	public Output edit(@RequestParam Long economicId, @RequestParam String monthly, @RequestParam Long enterpriseId,
			@RequestParam float mainBusiness, @RequestParam float profit, @RequestParam float tax) {
		try {
			BaseEnterpriseEntity enterprise = enterpriseService.findOneBase(enterpriseId);
			EconomicEntity economic = economicService.findOne(economicId);
			economicService.update(economic, monthly, enterprise, mainBusiness, profit, tax);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public Output delete(@RequestParam String economicIds) {
		try {
			List<Long> list = new LinkedList<>();
			for (String idStr : StringUtils.split(economicIds, ",")) {
				list.add(Long.parseLong(idStr));
			}
			economicService.delete(list);
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
	public Output detail(@RequestParam Long economicId) {
		try {
			EconomicEntity economic = economicService.findOne(economicId);
			return new Output(economic, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByMonthly", method = RequestMethod.POST)
	public OutputList listByMonthly(@RequestParam String monthly) {
		try {
			List<EconomicVO> list = new LinkedList<>();

			List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listBase();
			for (BaseEnterpriseEntity enterprise : enterpriseList) {
				list.add(economicService.detail(monthly, enterprise));
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
			List<EconomicVO> list = new LinkedList<>();

			List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listBase(page, size);
			for (BaseEnterpriseEntity enterprise : enterpriseList) {
				list.add(economicService.detail(monthly, enterprise));
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
			List<EconomicVO> list = new LinkedList<>();

			List<EconomicEntity> economics = economicService.list(enterpriseId);
			for (EconomicEntity economic : economics) {
				list.add(economicService.detail(economic));
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
			List<EconomicVO> list = new LinkedList<>();

			List<EconomicEntity> economics = economicService.list(enterpriseId, page, size);
			for (EconomicEntity economic : economics) {
				list.add(economicService.detail(economic));
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
			List<EconomicVO> retList = new LinkedList<>();

			List<ProductTypeEntity> productTypeList = productTypeService.list();
			for (ProductTypeEntity productType : productTypeList) {
				List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listByProductTypeId(productType.getId());
				EconomicVO ret = economicService.sumEnterpriseEconomic(monthly, enterpriseList);
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
			List<EconomicVO> retList = new LinkedList<>();

			List<AreaEntity> areaList = areaService.list();
			for (AreaEntity area : areaList) {
				List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listByAreaId(area.getId());
				EconomicVO ret = economicService.sumEnterpriseEconomic(monthly, enterpriseList);
				ret.setArea(area);
				retList.add(ret);
			}

			return new OutputList(retList, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByMonthlyRange", method = RequestMethod.POST)
	public OutputList listByMonthlyRange(@RequestParam Long enterpriseId, @RequestParam String monthlyStart,
			@RequestParam String monthlyEnd) {
		try {
			List<EconomicVO> list = new LinkedList<>();

			List<String> monthlyList = FormulaUtils.getMonthlyList(monthlyStart, monthlyEnd);
			List<EconomicEntity> economics = economicService.listByMonthlyInAndEnterpriseId(monthlyList, enterpriseId);
			for (EconomicEntity economic : economics) {
				list.add(economicService.detail(economic));
			}

			return new OutputList(list, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/targetAdd", method = RequestMethod.POST)
	public Output targetAdd(@RequestParam Long enterpriseId, @RequestParam String year, @RequestParam float value) {
		try {
			BaseEnterpriseEntity enterprise = enterpriseService.findOneBase(enterpriseId);
			EconomicTargetEntity target = new EconomicTargetEntity(enterprise, year, value);
			target.setCreateTime(new Date());
			economicService.saveTarget(target);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/targetEdit", method = RequestMethod.POST)
	public Output targetEdit(@RequestParam Long economicTargetId, @RequestParam String year,
			@RequestParam float value) {
		try {
			EconomicTargetEntity target = economicService.findOneTarget(economicTargetId);
			economicService.update(target, year, value);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listRange", method = RequestMethod.POST)
	public OutputList listRange(@RequestParam String monthlyStart, @RequestParam String monthlyEnd) {
		try {
			List<EconomicVO> list = new LinkedList<>();

			List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listBase();
			List<String> monthlyList = FormulaUtils.getMonthlyList(monthlyStart, monthlyEnd);
			for (String monthly : monthlyList) {
				EconomicVO ret = economicService.sumEnterpriseEconomic2(monthly, enterpriseList);
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
			List<EconomicVO> list = new LinkedList<>();

			BaseEnterpriseEntity enterprise = enterpriseService.findOneBase(enterpriseId);
			List<BaseEnterpriseEntity> enterpriseList = new LinkedList<>();
			enterpriseList.add(enterprise);

			List<String> monthlyList = FormulaUtils.getMonthlyList(monthlyStart, monthlyEnd);
			for (String monthly : monthlyList) {
				EconomicVO ret = economicService.detail(monthly, enterprise);
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
			List<EconomicVO> list = new LinkedList<>();

			ProductTypeEntity productType = productTypeService.findOne(productTypeId);
			List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listByProductTypeId(productTypeId);
			List<String> monthlyList = FormulaUtils.getMonthlyList(monthlyStart, monthlyEnd);
			for (String monthly : monthlyList) {
				EconomicVO ret = economicService.sumEnterpriseEconomic2(monthly, enterpriseList);
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
			List<EconomicVO> list = new LinkedList<>();

			AreaEntity area = areaService.findOne(areaId);
			List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listByAreaId(area.getId());
			List<String> monthlyList = FormulaUtils.getMonthlyList(monthlyStart, monthlyEnd);
			for (String monthly : monthlyList) {
				EconomicVO ret = economicService.sumEnterpriseEconomic2(monthly, enterpriseList);
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
			List<EconomicVO> list = new LinkedList<>();

			List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listPoint();
			List<String> monthlyList = FormulaUtils.getMonthlyList(monthlyStart, monthlyEnd);
			for (String monthly : monthlyList) {
				EconomicVO ret = economicService.sumEnterpriseEconomic2(monthly, enterpriseList);
				list.add(ret);
			}

			return new OutputList(list, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	/*
	 * @RequestMapping(value = "/report", method = RequestMethod.POST) public
	 * Output report(@RequestParam Long economicId) { try { EconomicEntity
	 * economic = economicService.findOne(economicId);
	 * economic.setStatus(ApproveStatus.REPORT); economicService.save(economic);
	 * return new Output(null, ReturnStatus.SUCCESS.status(),
	 * ReturnStatus.SUCCESS.msg()); } catch (Exception e) {
	 * log.error(e.getMessage(), e); return new Output(null,
	 * ReturnStatus.FAILED.status(), e.getMessage()); } }
	 * 
	 * @RequestMapping(value = "/pass", method = RequestMethod.POST) public
	 * Output pass(@RequestParam Long economicId) { try { EconomicEntity
	 * economic = economicService.findOne(economicId);
	 * economic.setStatus(ApproveStatus.PASS); economicService.save(economic);
	 * return new Output(null, ReturnStatus.SUCCESS.status(),
	 * ReturnStatus.SUCCESS.msg()); } catch (Exception e) {
	 * log.error(e.getMessage(), e); return new Output(null,
	 * ReturnStatus.FAILED.status(), e.getMessage()); } }
	 * 
	 * @RequestMapping(value = "/reject", method = RequestMethod.POST) public
	 * Output reject(@RequestParam Long economicId) { try { EconomicEntity
	 * economic = economicService.findOne(economicId);
	 * economic.setStatus(ApproveStatus.REJECT); economicService.save(economic);
	 * return new Output(null, ReturnStatus.SUCCESS.status(),
	 * ReturnStatus.SUCCESS.msg()); } catch (Exception e) {
	 * log.error(e.getMessage(), e); return new Output(null,
	 * ReturnStatus.FAILED.status(), e.getMessage()); } }
	 */

}