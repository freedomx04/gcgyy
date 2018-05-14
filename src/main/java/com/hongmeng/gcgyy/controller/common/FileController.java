package com.hongmeng.gcgyy.controller.common;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import org.springframework.web.multipart.MultipartFile;

import com.baidu.ueditor.PathFormat;
import com.baidu.ueditor.define.FileType;
import com.hongmeng.gcgyy.common.ReturnStatus;
import com.hongmeng.gcgyy.common.utils.ConfigUtils;
import com.hongmeng.gcgyy.common.utils.FileUtils;
import com.hongmeng.gcgyy.entity.Output;
import com.hongmeng.gcgyy.entity.common.FileEntity;

@RestController
public class FileController {

	static Logger log = LoggerFactory.getLogger(FileController.class);
	
	@Value("${customize.path.upload}")
	private String uploadPath;
	
	@RequestMapping(value = "uploadImage", method = RequestMethod.POST)
	public Output uploadImage(@RequestParam("uploadImage") MultipartFile uploadImage) {
		try {
			String imageName = uploadImage.getOriginalFilename();
			String savePath = ConfigUtils.get("customize.path.upload.image");
			String suffix = FileType.getSuffixByFilename(imageName);
			
			savePath = savePath + suffix;
			savePath = PathFormat.parse(savePath, "");
			
			String projectPath = ConfigUtils.get("customize.path.upload");
			
			Path relPath = Paths.get(projectPath, savePath);
			File file = relPath.toFile();
			FileUtils.sureDirExists(file, true);
			
			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(file));
			stream.write(uploadImage.getBytes());
			stream.close();
			
			return new Output(savePath, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "uploadFile", method = RequestMethod.POST)
	public Output uploadFile(@RequestParam("uploadfile") MultipartFile uploadfile) {
		try {
			String filename = uploadfile.getOriginalFilename();
			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
			String filepath = "/" + Paths.get("file", getDatePath(), uuid + "@" + filename).toString().replace("\\", "/");

			Path relpath = Paths.get(uploadPath, filepath);
			File file = relpath.toFile();
			FileUtils.sureDirExists(file, true);

			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(file));
			stream.write(uploadfile.getBytes());
			stream.close();

			FileEntity fileEntity = new FileEntity(filename, file.length(), filepath);
			return new Output(fileEntity, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "downloadFile", method = RequestMethod.GET)
	public ResponseEntity<InputStreamResource> downloadFile(@RequestParam String filepath) {
		try {
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

	public String getDatePath() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		return sdf.format(new Date());
	}
}