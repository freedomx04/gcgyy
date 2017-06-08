package com.hongmeng.gcgyy.entity.common;

public class FileEntity {
	
	public String fileName;
	
	public Long fileSize;
	
	public String filePath;
	
	public FileEntity() {
		// TODO Auto-generated constructor stub
	}
	
	public FileEntity(String fileName, Long fileSize, String filePath) {
		this.fileName = fileName;
		this.fileSize = fileSize;
		this.filePath = filePath;
	}
	
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Long getFileSize() {
		return fileSize;
	}

	public void setFileSize(Long fileSize) {
		this.fileSize = fileSize;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
}