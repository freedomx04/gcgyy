package com.hongmeng.gcgyy.controller.assist;

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
import com.hongmeng.gcgyy.entity.assist.OverviewEntity;
import com.hongmeng.gcgyy.entity.baseData.OverviewTypeEntity;
import com.hongmeng.gcgyy.service.assist.OverviewService;
import com.hongmeng.gcgyy.service.baseData.OverviewTypeService;
import com.hongmeng.gcgyy.service.common.UeditorService;

@RestController
@RequestMapping("overview")
public class OverviewController {

	static Logger log = LoggerFactory.getLogger(OverviewController.class);

	@Autowired
	OverviewService overviewService;

	@Autowired
	OverviewTypeService overviewTypeService;
	
	@Autowired
	UeditorService ueditorService;

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public Output add(@RequestParam String title, @RequestParam Long overviewTypeId, @RequestParam String allHtml) {
		try {
			OverviewTypeEntity overviewType = overviewTypeService.findOne(overviewTypeId);
			String linkPath = ueditorService.save(allHtml);
			OverviewEntity overview = new OverviewEntity(title, overviewType, linkPath);
			overview.setCreateTime(new Date());
			overviewService.save(overview);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public Output edit(@RequestParam Long overviewId, @RequestParam String title, @RequestParam Long overviewTypeId,
			@RequestParam String allHtml) {
		try {
			OverviewEntity overview = overviewService.findOne(overviewId);
			OverviewTypeEntity overviewType = overviewTypeService.findOne(overviewTypeId);
			String linkPath = ueditorService.save(allHtml);
			overviewService.update(overview, title, overviewType, linkPath);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public Output delete(@RequestParam String overviewIds) {
		try {
			List<Long> list = new LinkedList<>();
			for (String idStr : StringUtils.split(overviewIds, ",")) {
				list.add(Long.parseLong(idStr));
			}
			overviewService.delete(list);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public OutputList list() {
		try {
			return new OutputList(overviewService.list(), ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listPaging", method = RequestMethod.POST)
	public OutputList listPaging(int page, int size) {
		try {
			return new OutputList(overviewService.listPaging(page, size), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public Output detail(@RequestParam Long overviewId) {
		try {
			OverviewEntity overview = overviewService.findOne(overviewId);
			return new Output(overview, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

}