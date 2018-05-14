package com.hongmeng.gcgyy.service.common;

public class PushVO {
	
	private String channelId; // 唯一对应一台设备

	private Integer deviceType; // 设备类型

	private Integer msgType = 0; // 消息类型
	
	private Integer msgExpires = 3600 * 5; // 相对于当前时间的消息过期时间，单位为秒

	private String message; // 消息内容 json格式
	
	public PushVO() {
		// TODO Auto-generated constructor stub
	}
	
	public PushVO(String channelId, Integer deviceType, String message) {
		this.channelId = channelId;
		this.deviceType = deviceType;
		this.message = message;
	}

	public PushVO(String channelId, Integer deviceType, Integer msgType, Integer msgExpires, String message) {
		this.channelId = channelId;
		this.deviceType = deviceType;
		this.msgType = msgType;
		this.msgExpires = msgExpires;
		this.message = message;
	}

	public String getChannelId() {
		return channelId;
	}

	public void setChannelId(String channelId) {
		this.channelId = channelId;
	}

	public Integer getDeviceType() {
		return deviceType;
	}

	public void setDeviceType(Integer deviceType) {
		this.deviceType = deviceType;
	}

	public Integer getMsgType() {
		return msgType;
	}

	public void setMsgType(Integer msgType) {
		this.msgType = msgType;
	}

	public Integer getMsgExpires() {
		return msgExpires;
	}

	public void setMsgExpires(Integer msgExpires) {
		this.msgExpires = msgExpires;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}