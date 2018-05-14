package com.hongmeng.gcgyy.controller.wx;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.hongmeng.gcgyy.common.ReturnStatus;
import com.hongmeng.gcgyy.common.wx.WxUtil;
import com.hongmeng.gcgyy.entity.Output;

@RestController
public class WxMessageController {
	
	static Logger log = LoggerFactory.getLogger(WxMessageController.class);
	
	@RequestMapping(value = "/wx/message/send", method = RequestMethod.POST)
	public Output send(String toUser, String agentid, String content) {
		try {
			String ret = WxUtil.getInstace().send(toUser, agentid, content);
			return new Output(ret, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

}
