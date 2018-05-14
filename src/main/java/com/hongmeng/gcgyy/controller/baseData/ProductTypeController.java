package com.hongmeng.gcgyy.controller.baseData;

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
import com.hongmeng.gcgyy.entity.Output;
import com.hongmeng.gcgyy.entity.OutputList;
import com.hongmeng.gcgyy.entity.baseData.ProductTypeEntity;
import com.hongmeng.gcgyy.service.baseData.ProductTypeService;

@RestController
@RequestMapping("productType")
public class ProductTypeController {
	
	static Logger log = LoggerFactory.getLogger(ProductTypeController.class);
	
	@Autowired
	ProductTypeService productTypeService;
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public Output add(@RequestParam String name) {
		try {
			ProductTypeEntity productType = productTypeService.findByName(name);
			if (productType != null) {
				return new Output(null, ReturnStatus.EXISTED.status(), ReturnStatus.EXISTED.msg());
			}
			
			productType = new ProductTypeEntity(name);
			productType.setCreateTime(new Date());
			productTypeService.save(productType);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public Output edit(@RequestParam Long productTypeId, @RequestParam String name) {
		try {
			ProductTypeEntity productType = productTypeService.findOne(productTypeId);
			productTypeService.update(productType, name);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public Output delete(@RequestParam String productTypeIds) {
		try {
			List<Long> list = new LinkedList<>();
			for (String idStr: StringUtils.split(productTypeIds, ",")) {
				list.add(Long.parseLong(idStr));
			}
			productTypeService.delete(list);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			if(e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Output(null, ReturnStatus.CONSTRAINT.status(), e.getMessage());
			}
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public OutputList list() {
		try {
			return new OutputList(productTypeService.list(), ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public Output detail(@RequestParam Long productTypeId) {
		try {
			ProductTypeEntity productType = productTypeService.findOne(productTypeId);
			return new Output(productType, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
}