package com.hongmeng.gcgyy.entity;

public class Output {
	
	public Object data;	// 数据对象
	
	public int status;	// 状态
	
	public String msg;	// 状态信息
	
	public Output() {
		// TODO Auto-generated constructor stub
	}

	public Output(Object data, int status, String msg) {
		this.data = data;
		this.status = status;
		this.msg = msg;
	}
}