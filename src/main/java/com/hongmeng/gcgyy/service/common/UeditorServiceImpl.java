package com.hongmeng.gcgyy.service.common;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.baidu.ueditor.PathFormat;

@Service
public class UeditorServiceImpl implements UeditorService {
	
	static Logger log = LoggerFactory.getLogger(UeditorServiceImpl.class);
	
	@Value("${customize.path.upload.html}")
	private String htmlPath;
	
	@Value("${customize.path.upload}")
	private String filePath;
	
	@Override
	public String save(String allHtml) throws IOException {
		String linkPath = htmlPath + ".html";
		linkPath = PathFormat.parse(linkPath, "");
		
		String tarPath = filePath + File.separator + linkPath;
		File file = new File(tarPath);
		FileUtils.write(file, allHtml, "UTF-8");
		
		return linkPath;
	}

}
