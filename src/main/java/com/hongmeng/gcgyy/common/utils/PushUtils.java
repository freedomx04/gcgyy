package com.hongmeng.gcgyy.common.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.baidu.yun.core.log.YunLogEvent;
import com.baidu.yun.core.log.YunLogHandler;
import com.baidu.yun.push.auth.PushKeyPair;
import com.baidu.yun.push.client.BaiduPushClient;
import com.baidu.yun.push.constants.BaiduPushConstants;
import com.baidu.yun.push.exception.PushClientException;
import com.baidu.yun.push.exception.PushServerException;
import com.baidu.yun.push.model.PushMsgToSingleDeviceRequest;
import com.baidu.yun.push.model.PushMsgToSingleDeviceResponse;
import com.hongmeng.gcgyy.service.common.PushVO;

public class PushUtils {
	
	static Logger log = LoggerFactory.getLogger(PushUtils.class);
	
	public static PushUtils INSTANCE = null;
	private static BaiduPushClient pushClient;
	
	private PushUtils() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * 获取实例
	 * @return
	 */
	public static PushUtils getInstance() {
		if (INSTANCE == null) {
			synchronized (PushUtils.class) {
				if (INSTANCE == null) {
					INSTANCE = new PushUtils();
				}
			}
		}
		return INSTANCE;
	}
	
	/**
	 * 推送到个人
	 */
	public void pushMsgToSingleDevice(PushVO pushVO) {
		try {
			// 设置请求参数，创建请求实例
			PushMsgToSingleDeviceRequest request = new PushMsgToSingleDeviceRequest().
					addChannelId(pushVO.getChannelId()).
	                addMsgExpires(pushVO.getMsgExpires()).   // 设置消息的有效时间,单位秒,默认3600*5.
	                addMessageType(pushVO.getMsgType()).     // 设置消息类型,0表示透传消息, 1表示通知, 默认为0
	                addMessage(pushVO.getMessage()).		
	                addDeviceType(pushVO.getDeviceType());   // 设置设备类型，1 for web, 2 for pc, 3 for android, 4 for ios, 5 for wp.
			
            PushMsgToSingleDeviceResponse response = getPushClient().pushMsgToSingleDevice(request);
            log.info("msgId: " + response.getMsgId() + ",sendTime: " + response.getSendTime());
		} catch (PushClientException | PushServerException e) {
			log.error(e.getMessage(), e);
		}
	}
	
	public void pushMsgToAll() {
		
	}
	
	/**
	 * 获取 pushClient
	 * @return
	 */
	public BaiduPushClient getPushClient() {
		if (pushClient == null) {
			// 1. 创建PushKeyPair 用于app的合法身份认证 
			String apiKey = ConfigUtils.get("customize.baiduyun.apiKey");
			String secretKey = ConfigUtils.get("customize.baiduyun.secretKey");
	        PushKeyPair pair = new PushKeyPair(apiKey, secretKey);
			
	        // 2. 创建BaiduPushClient，访问SDK接口
	        pushClient = new BaiduPushClient(pair, BaiduPushConstants.CHANNEL_REST_URL);
	        
	        // 3. 注册YunLogHandler，获取本次请求的交互信息
	        pushClient.setChannelLogHandler (new YunLogHandler() {
	            @Override
	            public void onHandle (YunLogEvent event) {
	            	log.info(event.getMessage());
	            }
	        });
		}
		return pushClient;
	}
}