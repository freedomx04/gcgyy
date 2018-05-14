package com.hongmeng.gcgyy.controller.ranking;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.hongmeng.gcgyy.common.ReturnStatus;
import com.hongmeng.gcgyy.entity.Output;
import com.hongmeng.gcgyy.service.ranking.RankingReportService;
import com.hongmeng.gcgyy.service.ranking.RankingReportServiceImpl;

@RestController
@RequestMapping("rankingReport")
public class RankingReportController {

	static Logger log = LoggerFactory.getLogger(RankingReportController.class);
	
	@Autowired
	RankingReportService reportService;
	
	@RequestMapping(value = "/template", method = RequestMethod.GET)
	public ResponseEntity<InputStreamResource> template(String monthly, Integer type) {
		try {
			HSSFWorkbook book = reportService.createTemplate(monthly, type);
			String fileName = monthly + RankingReportServiceImpl.templateTitle.get(type) + "模板.xls";

			HttpHeaders headers = new HttpHeaders();
			headers.add("Cache-Control", "no-cache, no-store, must-revalidate");
			headers.add("Content-Disposition",
					String.format("attachment; filename=\"%s\"", new String(fileName.getBytes("UTF-8"), "ISO8859-1")));
			headers.add("Pragma", "no-cache");
			headers.add("Expires", "0");

			ByteArrayOutputStream bos = new ByteArrayOutputStream();
			book.write(bos);
			byte[] content = bos.toByteArray();

			return ResponseEntity.ok().headers(headers).contentLength(content.length)
					.contentType(MediaType.parseMediaType("application/octet-stream"))
					.body(new InputStreamResource(new ByteArrayInputStream(content)));
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return null;
		}
	}
	
	@RequestMapping(value = "/importReport", method = RequestMethod.POST)
	public Output importReport(@RequestParam MultipartFile uploadfile, Integer type) {
		try {
			reportService.importReport(uploadfile.getInputStream(), type);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/export", method = RequestMethod.GET)
	public ResponseEntity<InputStreamResource> export(String monthly, Integer type) {
		try {
			HSSFWorkbook book = reportService.export(monthly, type);
			String fileName = monthly + RankingReportServiceImpl.templateTitle.get(type) + ".xls";

			HttpHeaders headers = new HttpHeaders();
			headers.add("Cache-Control", "no-cache, no-store, must-revalidate");
			headers.add("Content-Disposition",
					String.format("attachment; filename=\"%s\"", new String(fileName.getBytes("UTF-8"), "ISO8859-1")));
			headers.add("Pragma", "no-cache");
			headers.add("Expires", "0");

			ByteArrayOutputStream bos = new ByteArrayOutputStream();
			book.write(bos);
			byte[] content = bos.toByteArray();

			return ResponseEntity.ok().headers(headers).contentLength(content.length)
					.contentType(MediaType.parseMediaType("application/octet-stream"))
					.body(new InputStreamResource(new ByteArrayInputStream(content)));
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return null;
		}
	}
	
}
