package com.hongmeng.gcgyy.controller.monitor;

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
import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;
import com.hongmeng.gcgyy.service.authority.EnterpriseService;
import com.hongmeng.gcgyy.service.monitor.ReportFormService;
import com.hongmeng.gcgyy.service.monitor.ReportFormServiceImpl;

@RestController
@RequestMapping("reportForm")
public class ReportFormController {

	static Logger log = LoggerFactory.getLogger(ReportFormController.class);

	@Autowired
	ReportFormService reportFormService;
	
	@Autowired
	EnterpriseService enterpriseService;

	@RequestMapping(value = "/template", method = RequestMethod.GET)
	public ResponseEntity<InputStreamResource> template(@RequestParam String monthly, @RequestParam Integer type) {
		try {
			HSSFWorkbook book = reportFormService.createTemplate(monthly, type);
			String fileName = monthly + ReportFormServiceImpl.templateTitle.get(type) + "模板.xls";

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
	
	@RequestMapping(value = "/importEnergy", method = RequestMethod.POST)
	public Output importEnergy(@RequestParam MultipartFile uploadfile) {
		try {
			reportFormService.importEnergy(uploadfile.getInputStream());
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/importEconomic", method = RequestMethod.POST)
	public Output importEconomic(@RequestParam MultipartFile uploadfile) {
		try {
			reportFormService.importEconomic(uploadfile.getInputStream());
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/importBenefit", method = RequestMethod.POST)
	public Output importBenefit(@RequestParam MultipartFile uploadfile) {
		try {
			reportFormService.importBenefit(uploadfile.getInputStream());
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/importNationalTax", method = RequestMethod.POST)
	public Output importNationalTax(@RequestParam MultipartFile uploadfile) {
		try {
			reportFormService.importNationalTax(uploadfile.getInputStream());
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/importLocalTax", method = RequestMethod.POST)
	public Output importLocalTax(@RequestParam MultipartFile uploadfile) {
		try {
			reportFormService.importLocalTax(uploadfile.getInputStream());
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/export", method = RequestMethod.GET)
	public ResponseEntity<InputStreamResource> export(@RequestParam String monthly, @RequestParam Integer type) {
		try {
			HSSFWorkbook book = reportFormService.export(monthly, type);
			String fileName = monthly + ReportFormServiceImpl.exportTitle.get(type) + ".xls";

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

	@RequestMapping(value = "/exportByEnterpriseId", method = RequestMethod.GET)
	public ResponseEntity<InputStreamResource> exportByEnterpriseId(@RequestParam Long enterpriseId,
			@RequestParam Integer type) {
		try {
			BaseEnterpriseEntity enterprise = enterpriseService.findOneBase(enterpriseId);
			HSSFWorkbook book = reportFormService.export(enterprise, type);
			String fileName = enterprise.getName() + ReportFormServiceImpl.exportTitle.get(type) + ".xls";

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