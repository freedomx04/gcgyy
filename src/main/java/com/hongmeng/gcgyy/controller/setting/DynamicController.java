package com.hongmeng.gcgyy.controller.setting;

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
import com.hongmeng.gcgyy.entity.setting.DynamicEntity;
import com.hongmeng.gcgyy.service.common.UeditorService;
import com.hongmeng.gcgyy.service.setting.DynamicService;

@RestController
@RequestMapping("dynamic")
public class DynamicController {

	static Logger log = LoggerFactory.getLogger(DynamicController.class);

	@Autowired
	DynamicService dynamicService;

	@Autowired
	UeditorService ueditorService;

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public Output add(@RequestParam String title, @RequestParam Integer type, @RequestParam(required=false) String imagePath,
			@RequestParam String content) {
		try {
			String linkPath = ueditorService.save(content);
			DynamicEntity dynamic = new DynamicEntity(title, type, imagePath, linkPath);
			dynamic.setCreateTime(new Date());
			dynamicService.save(dynamic);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public Output edit(@RequestParam Long dynamicId, @RequestParam String title, @RequestParam Integer type,
			@RequestParam(required=false) String imagePath, @RequestParam String content) {
		try {
			DynamicEntity dynamic = dynamicService.findOne(dynamicId);
			String linkPath = ueditorService.save(content);
			dynamicService.update(dynamic, title, type, imagePath, linkPath);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public Output delete(@RequestParam String dynamicIds) {
		try {
			List<Long> list = new LinkedList<>();
			for (String idStr : StringUtils.split(dynamicIds, ",")) {
				list.add(Long.parseLong(idStr));
			}
			dynamicService.delete(list);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public OutputList list() {
		try {
			return new OutputList(dynamicService.list(), ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listPaging", method = RequestMethod.POST)
	public OutputList listPaging(int page, int size) {
		try {
			return new OutputList(dynamicService.listPaging(page, size), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByType", method = RequestMethod.POST)
	public OutputList listByType(Integer type) {
		try {
			return new OutputList(dynamicService.listByType(type), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByTypePaging", method = RequestMethod.POST)
	public OutputList listByTypePaging(Integer type, int page, int size) {
		try {
			return new OutputList(dynamicService.listByTypePaging(type, page, size), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public Output detail(@RequestParam Long dynamicId) {
		try {
			DynamicEntity dynamic = dynamicService.findOne(dynamicId);
			return new Output(dynamic, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
}