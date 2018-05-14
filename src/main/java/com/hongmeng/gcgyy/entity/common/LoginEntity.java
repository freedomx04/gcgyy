package com.hongmeng.gcgyy.entity.common;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hongmeng.gcgyy.entity.BaseEntity;
import com.hongmeng.gcgyy.entity.authority.BaseUserEntity;

@Entity
@Table(name = "system_login", indexes = {
	@Index(name = "INDEX_LOGIN_USERID_DEVICETYPE", columnList = "user_id, loginType")
})
public class LoginEntity extends BaseEntity {
	
	/**
	 * 登录类型 0: undefined 1: Web 2: Mobile
	 */
	public class LoginType {
		public static final int UNDEFINED = 0;
		public static final int WEB = 1;
		public static final int MOBILE = 2;
	}

	/**
	 * 设备类型  0:undefined 1：Web 2：Android 3：Ios
	 */
	public class DeviceType {
		public static final int UNDEFINED = 0;
		public static final int WEB = 1;
		public static final int ANDROID = 2;
		public static final int IOS = 3;
	}
	
	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "user_id")
	private BaseUserEntity user; // 登录用户
	
	private Integer loginType = LoginType.UNDEFINED; // 登录类型

	private Integer deviceType = DeviceType.UNDEFINED; // 设备类型

	private String channelId; // 移动端渠道id

	private String loginIp; // web端登录ip
	
	private String deviceToken;	// 设备标识

	public LoginEntity() {
		// TODO Auto-generated constructor stub
	}

	public LoginEntity(BaseUserEntity user, Integer loginType, Date createTime) {
		this.user = user;
		this.loginType = loginType;
		this.createTime = createTime;
	}

	public BaseUserEntity getUser() {
		return user;
	}

	public void setUser(BaseUserEntity user) {
		this.user = user;
	}

	public Integer getLoginType() {
		return loginType;
	}

	public void setLoginType(Integer loginType) {
		this.loginType = loginType;
	}

	public Integer getDeviceType() {
		return deviceType;
	}

	public void setDeviceType(Integer deviceType) {
		this.deviceType = deviceType;
	}

	public String getChannelId() {
		return channelId;
	}

	public void setChannelId(String channelId) {
		this.channelId = channelId;
	}

	public String getLoginIp() {
		return loginIp;
	}

	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}

	public String getDeviceToken() {
		return deviceToken;
	}

	public void setDeviceToken(String deviceToken) {
		this.deviceToken = deviceToken;
	}
	
}