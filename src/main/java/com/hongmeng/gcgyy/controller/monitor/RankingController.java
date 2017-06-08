package com.hongmeng.gcgyy.controller.monitor;

import java.util.Collections;
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
import com.hongmeng.gcgyy.entity.OutputList;
import com.hongmeng.gcgyy.entity.monitor.ScoreEntity;
import com.hongmeng.gcgyy.service.monitor.EconomicService;
import com.hongmeng.gcgyy.service.monitor.EconomicVO;
import com.hongmeng.gcgyy.service.monitor.ScoreService;

@RestController
@RequestMapping("ranking")
public class RankingController {
	
	static Logger log = LoggerFactory.getLogger(RankingController.class);
	
	@Autowired
	ScoreService scoreService;
	
	@Autowired
	EconomicService economicService;
	
	@RequestMapping(value = "/score", method = RequestMethod.POST)
	public OutputList score() {
		try {
			List<ScoreEntity> list = scoreService.ranking();
			return new OutputList(list, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/industryAsc", method = RequestMethod.POST)
	public OutputList industryAsc(@RequestParam String monthly) {
		try {
			List<EconomicVO> ret = new LinkedList<>();
			List<EconomicVO> list = economicService.listIndustryDesc(monthly);
			Collections.reverse(list);
//			if (list.size() >= 3) {
//				ret = list.subList(0, 3);
//			} else {
				ret = list;
//			}
			
			return new OutputList(ret, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/industryDesc", method = RequestMethod.POST)
	public OutputList industryDesc(@RequestParam String monthly) {
		try {
			List<EconomicVO> ret = new LinkedList<>();
			List<EconomicVO> list = economicService.listIndustryDesc(monthly);
//			if (list.size() >= 3) {
//				ret = list.subList(0, 3);
//			} else {
				ret = list;
//			}
			return new OutputList(ret, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

}