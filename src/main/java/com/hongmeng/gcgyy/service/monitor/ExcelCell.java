package com.hongmeng.gcgyy.service.monitor;

public class ExcelCell {

	private String name;
	
	private Integer width;
	
	private String title;
	
	public ExcelCell() {
		// TODO Auto-generated constructor stub
	}

	public ExcelCell(String name, Integer width, String title) {
		this.name = name;
		this.width = width;
		this.title = title;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getWidth() {
		return width;
	}

	public void setWidth(Integer width) {
		this.width = width;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
}