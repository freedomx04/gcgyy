package com.hongmeng.gcgyy.common.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.hongmeng.gcgyy.entity.common.PushEntity;

import push.AndroidNotification;
import push.PushClient;
import push.android.AndroidBroadcast;
import push.android.AndroidUnicast;

public class UPushUtils {

	static Logger log = LoggerFactory.getLogger(UPushUtils.class);
	
	public static UPushUtils INSTANCE = null;
	private PushClient client = new PushClient();

	private static String appkey = null;
	private static String appMasterSecret = null;

	public static UPushUtils getInstance() {
		if (INSTANCE == null) {
			synchronized (UPushUtils.class) {
				if (INSTANCE == null) {
					INSTANCE = new UPushUtils();
					appkey = ConfigUtils.get("customize.umeng.appKey");
					appMasterSecret = ConfigUtils.get("customize.umeng.appMasterSecret");
				}
			}
		}
		return INSTANCE;
	}


	/**
	 * 安卓单播
	 * 
	 * @throws Exception
	 */
	public void pushAndroidUnicast(String deviceToken, PushEntity push) {
		try {
			AndroidUnicast unicast = new AndroidUnicast(appkey, appMasterSecret);
			unicast.setBuilderId((int) push.getId());
			unicast.setDeviceToken(deviceToken);
			unicast.setTicker(push.getTicker());
			unicast.setTitle(push.getTitle());
			unicast.setText(push.getText());
			unicast.goCustomAfterOpen("custom");
			unicast.setDisplayType(AndroidNotification.DisplayType.NOTIFICATION);
			unicast.setProductionMode();
			unicast.setExtraField("content", push.getContent());
			client.send(unicast);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
	}

	/**
	 * 安卓广播
	 * 
	 * @throws Exception
	 */
	public void pushAndroidBroadcast(PushEntity push) {
		try {
			AndroidBroadcast broadcast = new AndroidBroadcast(appkey, appMasterSecret);
			broadcast.setBuilderId((int) push.getId());
			broadcast.setTicker(push.getTicker());
			broadcast.setTitle(push.getTitle());
			broadcast.setText(push.getText());
			broadcast.goCustomAfterOpen("custom");
			broadcast.setDisplayType(AndroidNotification.DisplayType.NOTIFICATION);
			broadcast.setProductionMode();
			broadcast.setExtraField("content", push.getContent());
			client.send(broadcast);
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
	}

}