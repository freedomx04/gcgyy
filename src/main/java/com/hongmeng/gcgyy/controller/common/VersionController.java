package com.hongmeng.gcgyy.controller.common;

import java.io.File;
import java.nio.file.Paths;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hongmeng.gcgyy.common.ReturnStatus;
import com.hongmeng.gcgyy.entity.Output;
import com.hongmeng.gcgyy.entity.OutputList;
import com.hongmeng.gcgyy.entity.common.VersionEntity;
import com.hongmeng.gcgyy.service.common.VersionService;

@RestController
@RequestMapping("version")
public class VersionController {

	static Logger log = LoggerFactory.getLogger(VersionController.class);

	@Autowired
	VersionService versionService;
	
	@Value("${customize.path.upload}")
	private String uploadPath;

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public Output add(@RequestParam Integer code, @RequestParam String name, @RequestParam String description,
			@RequestParam String url) {
		try {
			VersionEntity version = versionService.findOne(code);
			if (version != null) {
				return new Output(null, ReturnStatus.EXISTED.status(), ReturnStatus.EXISTED.msg());
			}

			version = new VersionEntity(code, name, description, url);
			version.setCreateTime(new Date());
			versionService.save(version);
			return new Output(version, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/lastest", method = RequestMethod.POST)
	public Output lastest() {
		try {
			VersionEntity version = versionService.findLastest();
			return new Output(version, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public OutputList list() {
		try {
			return new OutputList(versionService.list(), ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public Output delete(@RequestParam String versionIds) {
		try {
			List<Long> list = new LinkedList<>();
			for (String idStr: StringUtils.split(versionIds, ",")) {
				list.add(Long.parseLong(idStr));
			}
			versionService.delete(list);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			if(e.getCause().toString().indexOf("ConstraintViolationException") != -1) {
				return new Output(null, ReturnStatus.CONSTRAINT.status(), e.getMessage());
			}
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public ResponseEntity<InputStreamResource> download() {
		try {
			VersionEntity version = versionService.findLastest();
			String filepath = version.getUrl();
			
			File file = Paths.get(uploadPath, filepath).toFile();
			if (!file.exists()) {
				return null;
			}
			String filename = file.getName();
			filename = filename.substring(filename.lastIndexOf("@") + 1);
			FileSystemResource fsr = new FileSystemResource(file);
			
			HttpHeaders headers = new HttpHeaders();
			headers.add("Cache-Control", "no-cache, no-store, must-revalidate");
			headers.add("Content-Disposition", String.format("attachment; filename=\"%s\"", new String(filename.getBytes("UTF-8"), "ISO8859-1")));
			headers.add("Pragma", "no-cache");
			headers.add("Expires", "0");

			return ResponseEntity.ok().headers(headers).contentLength(fsr.contentLength())
					.contentType(MediaType.parseMediaType("application/octet-stream"))
					.body(new InputStreamResource(fsr.getInputStream()));
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return null;
		}
	} 

}