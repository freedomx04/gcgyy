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
import com.hongmeng.gcgyy.entity.monitor.EnergyEntity;
import com.hongmeng.gcgyy.service.authority.EnterpriseService;
import com.hongmeng.gcgyy.service.baseData.AreaService;
import com.hongmeng.gcgyy.service.baseData.ProductTypeService;
import com.hongmeng.gcgyy.service.monitor.EnergyService;
import com.hongmeng.gcgyy.service.monitor.EnergyVO;

@RestController
@RequestMapping("energy")
public class EnergyController {

	static Logger log = LoggerFactory.getLogger(EnergyController.class);

	@Autowired
	EnergyService energyService;

	@Autowired
	EnterpriseService enterpriseService;

	@Autowired
	AreaService areaService;

	@Autowired
	ProductTypeService productTypeService;

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public Output add(@RequestParam String monthly, @RequestParam Long enterpriseId, @RequestParam float electricity) {
		try {
			EnergyEntity energy = energyService.findOne(monthly, enterpriseId);
			if (energy != null) {
				return new Output(null, ReturnStatus.EXISTED.status(), ReturnStatus.EXISTED.msg());
			}

			BaseEnterpriseEntity enterprise = enterpriseService.findOneBase(enterpriseId);
			energy = new EnergyEntity(monthly, enterprise, electricity);
			energy.setCreateTime(new Date());
			energyService.save(energy);

			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public Output add(@RequestParam Long energyId, @RequestParam String monthly, @RequestParam Long enterpriseId,
			@RequestParam float electricity) {
		try {
			BaseEnterpriseEntity enterprise = enterpriseService.findOneBase(enterpriseId);
			EnergyEntity energy = energyService.findOne(energyId);
			energyService.update(energy, monthly, enterprise, electricity);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public Output delete(@RequestParam String energyIds) {
		try {
			List<Long> list = new LinkedList<>();
			for (String idStr : StringUtils.split(energyIds, ",")) {
				list.add(Long.parseLong(idStr));
			}
			energyService.delete(list);
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
	public Output detail(@RequestParam Long energyId) {
		try {
			EnergyEntity energy = energyService.findOne(energyId);
			return new Output(energy, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByMonthly", method = RequestMethod.POST)
	public OutputList listByMonthly(@RequestParam String monthly) {
		try {
			List<EnergyVO> list = new LinkedList<>();

			List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listBase();
			for (BaseEnterpriseEntity enterprise : enterpriseList) {
				list.add(energyService.detail(monthly, enterprise));
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
			List<EnergyVO> list = new LinkedList<>();

			List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listBase(page, size);
			for (BaseEnterpriseEntity enterprise : enterpriseList) {
				list.add(energyService.detail(monthly, enterprise));
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
			List<EnergyVO> list = new LinkedList<>();

			List<EnergyEntity> energys = energyService.list(enterpriseId);
			for (EnergyEntity energy : energys) {
				list.add(energyService.detail(energy));
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
			List<EnergyVO> list = new LinkedList<>();

			List<EnergyEntity> energys = energyService.list(enterpriseId, page, size);
			for (EnergyEntity energy : energys) {
				list.add(energyService.detail(energy));
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
			List<EnergyVO> retList = new LinkedList<>();

			List<ProductTypeEntity> productTypeList = productTypeService.list();
			for (ProductTypeEntity productType : productTypeList) {
				List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listByProductTypeId(productType.getId());
				EnergyVO ret = energyService.sumEnterpriseEnergy(monthly, enterpriseList);
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
			List<EnergyVO> retList = new LinkedList<>();

			List<AreaEntity> areaList = areaService.list();
			for (AreaEntity area : areaList) {
				List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listByAreaId(area.getId());
				EnergyVO ret = energyService.sumEnterpriseEnergy(monthly, enterpriseList);
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
			List<EnergyVO> list = new LinkedList<>();

			List<String> monthlyList = FormulaUtils.getMonthlyList(monthlyStart, monthlyEnd);
			List<EnergyEntity> energys = energyService.listByMonthlyInAndEnterpriseId(monthlyList, enterpriseId);
			for (EnergyEntity energy : energys) {
				list.add(energyService.detail(energy));
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
			List<EnergyVO> list = new LinkedList<>();

			List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listBase();
			List<String> monthlyList = FormulaUtils.getMonthlyList(monthlyStart, monthlyEnd);
			for (String monthly : monthlyList) {
				EnergyVO ret = energyService.sumEnterpriseEnergy(monthly, enterpriseList);
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
			List<EnergyVO> list = new LinkedList<>();

			BaseEnterpriseEntity enterprise = enterpriseService.findOneBase(enterpriseId);
			List<BaseEnterpriseEntity> enterpriseList = new LinkedList<>();
			enterpriseList.add(enterprise);

			List<String> monthlyList = FormulaUtils.getMonthlyList(monthlyStart, monthlyEnd);
			for (String monthly : monthlyList) {
				EnergyVO ret = energyService.detail(monthly, enterprise);
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
			List<EnergyVO> list = new LinkedList<>();

			ProductTypeEntity productType = productTypeService.findOne(productTypeId);
			List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listByProductTypeId(productTypeId);
			List<String> monthlyList = FormulaUtils.getMonthlyList(monthlyStart, monthlyEnd);
			for (String monthly : monthlyList) {
				EnergyVO ret = energyService.sumEnterpriseEnergy(monthly, enterpriseList);
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
			List<EnergyVO> list = new LinkedList<>();

			AreaEntity area = areaService.findOne(areaId);
			List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listByAreaId(area.getId());
			List<String> monthlyList = FormulaUtils.getMonthlyList(monthlyStart, monthlyEnd);
			for (String monthly : monthlyList) {
				EnergyVO ret = energyService.sumEnterpriseEnergy(monthly, enterpriseList);
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
			List<EnergyVO> list = new LinkedList<>();

			List<BaseEnterpriseEntity> enterpriseList = enterpriseService.listPoint();
			List<String> monthlyList = FormulaUtils.getMonthlyList(monthlyStart, monthlyEnd);
			for (String monthly : monthlyList) {
				EnergyVO ret = energyService.sumEnterpriseEnergy(monthly, enterpriseList);
				list.add(ret);
			}

			return new OutputList(list, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

}