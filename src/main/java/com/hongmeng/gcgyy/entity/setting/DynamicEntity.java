package com.hongmeng.gcgyy.entity.setting;

import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.Table;

import com.hongmeng.gcgyy.entity.BaseEntity;

@Entity
@Table(name = "setting_news", indexes = {
	@Index(name = "INDEX_DYNAMIC_CREATETIME", columnList = "createTime"),
	@Index(name = "INDEX_DYNAMIC_TYPE", columnList = "type, createTime")
})
public class DynamicEntity extends BaseEntity {
	
	public class DynamicType {
		public static final int ANNOUNCE = 0;
		public static final int POLICY = 1;
		public static final int OVERVIEW = 2;
		public static final int NEWS = 3;
		public static final int POINT_NEWS = 4;
	}
	
	
	private String title;
	
	private Integer type;
	
	private String imagePath;
	
	private String linkPath;
	
	private String content;
	
	public DynamicEntity() {
		// TODO Auto-generated constructor stub
	}

	public DynamicEntity(String title, Integer type, String imagePath, String linkPath) {
		this.title = title;
		this.type = type;
		this.imagePath = imagePath;
		this.linkPath = linkPath;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getLinkPath() {
		return linkPath;
	}

	public void setLinkPath(String linkPath) {
		this.linkPath = linkPath;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}