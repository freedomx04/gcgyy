package com.hongmeng.gcgyy.entity.common;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.Table;

import com.hongmeng.gcgyy.entity.BaseEntity;

@Entity
@Table(name = "system_version", indexes = {
	@Index(name = "INDEX_VERSION_CODE", columnList = "code")
})
public class VersionEntity extends BaseEntity {

	@Column(unique = true)
	private Integer code; // 版本编码

	private String name; // 版本号
	
	private String description; // 更新说明

	private String url; // 文件路径

	public VersionEntity() {
		// TODO Auto-generated constructor stub
	}

	public VersionEntity(Integer code, String name, String description, String url) {
		this.code = code;
		this.name = name;
		this.description = description;
		this.url = url;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

}