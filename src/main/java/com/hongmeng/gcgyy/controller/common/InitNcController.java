package com.hongmeng.gcgyy.controller.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DecimalFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFPicture;
import org.apache.poi.hssf.usermodel.HSSFPictureData;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFShape;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.baidu.ueditor.PathFormat;
import com.hongmeng.gcgyy.common.ReturnStatus;
import com.hongmeng.gcgyy.common.utils.CiphersUtils;
import com.hongmeng.gcgyy.common.utils.FileUtils;
import com.hongmeng.gcgyy.entity.Output;
import com.hongmeng.gcgyy.entity.authority.BaseUserEntity;
import com.hongmeng.gcgyy.entity.authority.EnterpriseEntity;
import com.hongmeng.gcgyy.entity.authority.ProductEntity;
import com.hongmeng.gcgyy.entity.authority.RoleEntity;
import com.hongmeng.gcgyy.entity.authority.UserEntity;
import com.hongmeng.gcgyy.entity.baseData.AppealTypeEntity;
import com.hongmeng.gcgyy.entity.baseData.AreaEntity;
import com.hongmeng.gcgyy.entity.baseData.BusinessEntity;
import com.hongmeng.gcgyy.entity.baseData.ProductTypeEntity;
import com.hongmeng.gcgyy.service.authority.EnterpriseService;
import com.hongmeng.gcgyy.service.authority.RoleService;
import com.hongmeng.gcgyy.service.authority.UserService;
import com.hongmeng.gcgyy.service.baseData.AppealTypeService;
import com.hongmeng.gcgyy.service.baseData.AreaService;
import com.hongmeng.gcgyy.service.baseData.BusinessService;
import com.hongmeng.gcgyy.service.baseData.ProductTypeService;

@RestController
@RequestMapping("init_nc")
public class InitNcController {

	static Logger log = LoggerFactory.getLogger(InitNcController.class);

	private String adminUserName = "admin";
	private String adminPassword = "admin123456";

	private String defaultPassword = "nc123456";

	private String areaName = "南城工业园区";

	private Integer acceptDays = 5;
	private Integer handleDays = 10;

	@Value("${customize.path.upload}")
	private String uploadPath;

	@Value("${customize.path.upload.image}")
	private String savePath;

	@Autowired
	UserService userService;

	@Autowired
	AreaService areaService;

	@Autowired
	RoleService roleService;

	@Autowired
	ProductTypeService productTypeService;

	@Autowired
	BusinessService businessService;

	@Autowired
	EnterpriseService enterpriseService;

	@Autowired
	AppealTypeService appealTypeService;
	
	@Autowired
	HttpServletRequest request;

	@RequestMapping(value = "/role")
	public Output role() {
		try {
			RoleEntity enterpriseRole = roleService.findByName("企业用户");
			if (enterpriseRole == null) {
				enterpriseRole = new RoleEntity("企业用户", "01", "企业用户",
						"agency_enterprise,assist_dynamic,service_jobPlatform");
				enterpriseRole.setCreateTime(new Date());
				roleService.save(enterpriseRole);
			}

			RoleEntity departmentRole = roleService.findByName("政府部门用户");
			if (departmentRole == null) {
				departmentRole = new RoleEntity("政府部门用户", "02", "政府部门用户",
						"agency_department,assist_dynamic,service_jobPlatform");
				departmentRole.setCreateTime(new Date());
				roleService.save(departmentRole);
			}

			RoleEntity visitorRole = roleService.findByName("游客");
			if (visitorRole == null) {
				visitorRole = new RoleEntity("游客", "03", "游客", "service_jobPlatform");
				visitorRole.setCreateTime(new Date());
				roleService.save(visitorRole);
			}

			RoleEntity monitorRole = roleService.findByName("监督员");
			if (monitorRole == null) {
				monitorRole = new RoleEntity("监督员", "04", "监督员", "assist_appeal_monitor,assist_dynamic");
				monitorRole.setCreateTime(new Date());
				roleService.save(monitorRole);
			}

			RoleEntity dispatcherRole = roleService.findByName("派单员");
			if (dispatcherRole == null) {
				dispatcherRole = new RoleEntity("派单员", "05", "派单员", "assist_appeal_dispatcher,assist_dynamic");
				dispatcherRole.setCreateTime(new Date());
				roleService.save(dispatcherRole);
			}

			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/administrator")
	public Output administrator() {
		try {
			RoleEntity role = roleService.findByName("超级管理员");
			if (role == null) {
				String resource = "authority_role,authority_enterprise,authority_department,authority_user,base_area,base_productType,"
						+ "base_appealType,base_industryType,base_report,assist_dynamic,service_jobPlatform";
				role = new RoleEntity("超级管理员", "00", "超级管理员", resource);
				role.setCreateTime(new Date());
				roleService.save(role);
			}

			UserEntity user = userService.findByUsername(adminUserName);
			if (user == null) {
				user = new UserEntity(adminUserName, CiphersUtils.getInstance().string2MD5(adminPassword), "123456789");
				user.setName(adminUserName);
				user.setRole(role);
				user.setCreateTime(new Date());
				userService.save(user);
			}

			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/area")
	public Output area() {
		try {
			AreaEntity area = areaService.findByName(areaName);
			if (area == null) {
				area = new AreaEntity(areaName, areaName);
				area.setCreateTime(new Date());
				areaService.save(area);
			}
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/productType")
	public Output productType() {
		try {
			String[] list = new String[] { "食品加工", "纺织服装", "电子信息", "机械制造", "铜加工", "化工", "医药", "其它" };
			for (String name : list) {
				ProductTypeEntity type = productTypeService.findByName(name);
				if (type == null) {
					type = new ProductTypeEntity(name);
					type.setCreateTime(new Date());
					productTypeService.save(type);
				}
			}
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/businessType")
	public Output businessType() {
		try {
			String[] list = new String[] { "餐饮", "服务", "服装业", "IT/计算机", "制造业", "农业", "银行", "培训" };
			for (String name : list) {
				BusinessEntity business = businessService.findByName(name);
				if (business == null) {
					business = new BusinessEntity(name, name);
					business.setCreateTime(new Date());
					businessService.save(business);
				}
			}
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/appealType")
	public Output appealType() {
		try {
			String[] list = new String[] { "资金问题", "用工问题", "社会保险", "人才招聘难", "三乱问题", "用电问题", "用水问题", "用地问题", "物流成本高",
					"产业链配套问题", "政策优惠问题", "其他问题" };
			for (String name : list) {
				AppealTypeEntity type = appealTypeService.findByName(name);
				if (type == null) {
					type = new AppealTypeEntity(name, acceptDays, handleDays);
					type.setCreateTime(new Date());
					appealTypeService.save(type);
				}
			}
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	private DecimalFormat df = new DecimalFormat("0");

	private HSSFWorkbook workbook;

	@RequestMapping(value = "/enterprise")
	public Output enterprise() throws IOException {
		HashMap<String, HSSFPictureData> picMap = new HashMap<>();

		String root = request.getSession().getServletContext().getRealPath("/");
		File file = new File(root + "/resource/enterprise_info.xls");

		workbook = new HSSFWorkbook(new FileInputStream(file));
		for (int i = 11; i < workbook.getNumberOfSheets(); i++) {
			HSSFSheet sheet = workbook.getSheetAt(i);
//			HSSFSheet sheet = workbook.getSheet("公司名称 (20)");
			String sheetName = sheet.getSheetName();
			
			try {
				// 获取所有图片
				List<HSSFPictureData> pictures = workbook.getAllPictures();
				for (HSSFShape shape : sheet.getDrawingPatriarch().getChildren()) {
					HSSFClientAnchor anchor = (HSSFClientAnchor) shape.getAnchor();

					if (shape instanceof HSSFPicture) {
						HSSFPicture pic = (HSSFPicture) shape;
						String location = anchor.getRow1() + "-" + anchor.getCol1();

						int pictureIndex = pic.getPictureIndex() - 1;
						HSSFPictureData picData = pictures.get(pictureIndex);

						picMap.put(location, picData);
					}
				}

				HSSFCell cell = null;
				// 企业名称
				cell = sheet.getRow(1).getCell(1);
				String name = cell.getStringCellValue().trim();

				if (name.isEmpty()) {
					throw new Exception("enterprise name is empty");
				}

				EnterpriseEntity enterprise = enterpriseService.findByName(name);
				if (enterprise == null) {
					enterprise = new EnterpriseEntity();
					enterprise.setName(name);
					enterprise.setCreateTime(new Date());
				}

				// 企业地址
				cell = sheet.getRow(2).getCell(1);
				if (cell != null) {
					String address = cell.getStringCellValue().trim();
					enterprise.setAddress(address);
				}

				// 所属区域
				cell = sheet.getRow(3).getCell(1);
				if (cell != null) {
					String areaName = cell.getStringCellValue().trim();
					AreaEntity area = areaService.findByName(areaName);
					if (area == null) {
						area = new AreaEntity(areaName, areaName);
						area.setCreateTime(new Date());
						areaService.save(area);
					}
					
					enterprise.setArea(area);
				}

				// 主要产品
				cell = sheet.getRow(4).getCell(1);
				if (cell != null) {
					String mainProduct = cell.getStringCellValue().trim();
					enterprise.setMainProduct(mainProduct);
				}

				// 产业类别
				cell = sheet.getRow(5).getCell(1);
				if (cell != null) {
					String type = cell.getStringCellValue().trim();
					ProductTypeEntity productType = productTypeService.findByName(type);
					if (productType == null) {
						productType = new ProductTypeEntity(type);
						productType.setCreateTime(new Date());
						productTypeService.save(productType);
					}

					enterprise.setProductType(productType);
				}

				// 投产时间
				cell = sheet.getRow(6).getCell(1);
				if (cell != null) {
					Date productionTime = cell.getDateCellValue();
					enterprise.setProductionTime(productionTime);
				}

				// 企业负责人
				cell = sheet.getRow(7).getCell(1);
				if (cell != null) {
					String principal = cell.getStringCellValue().trim();
					enterprise.setPrincipal(principal);
				}

				RoleEntity role = roleService.findByName("企业用户");
				// 企业联系人
				cell = sheet.getRow(8).getCell(1);
				if (cell != null) {
					String username = cell.getStringCellValue().trim();
					UserEntity user = userService.findByUsername(username);
					if (user == null) {
						user = new UserEntity(username, CiphersUtils.getInstance().string2MD5(defaultPassword),
								"123456789");
						user.setName(username);
						user.setRole(role);
						user.setCreateTime(new Date());
						userService.save(user);
					}
					enterprise.getUsers().clear();

					BaseUserEntity baseUser = userService.findOneBase(user.getId());
					enterprise.getUsers().add(baseUser);
				}

				// 联系电话
				cell = sheet.getRow(9).getCell(1);
				if (cell != null) {
					String telephone = null;
					if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
						telephone = df.format(cell.getNumericCellValue());
					} else {
						telephone = cell.getStringCellValue().trim();
					}
					enterprise.setTelephone(telephone);
				}

				// 企业法人
				cell = sheet.getRow(10).getCell(1);
				if (cell != null) {
					String representative = cell.getStringCellValue().trim();
					enterprise.setRepresentative(representative);
				}

				// 主要股东
				cell = sheet.getRow(11).getCell(1);
				if (cell != null) {
					String shareholder = cell.getStringCellValue().trim();
					enterprise.setShareholder(shareholder);
				}

				// 注册资金
				cell = sheet.getRow(12).getCell(1);
				if (cell != null) {
					String temp = cell.getStringCellValue().trim();
					if (!temp.isEmpty()) {
						temp = temp.replaceAll("万元", "").replaceAll("万", "");
						Double registeredCapital = Double.valueOf(temp);
						enterprise.setRegisteredCapital(registeredCapital);
					}
				}

				// 主要变更记录
				cell = sheet.getRow(13).getCell(1);
				if (cell != null) {
					String alterRecording = cell.getStringCellValue().trim();
					enterprise.setAlterRecording(alterRecording);
				}

				// 挂点人
				cell = sheet.getRow(14).getCell(1);
				if (cell != null) {
					String pointUserName = cell.getStringCellValue().trim();
					UserEntity pointUser = userService.findByUsername(pointUserName);
					if (pointUser == null) {
						pointUser = new UserEntity(pointUserName,
								CiphersUtils.getInstance().string2MD5(defaultPassword), "123456789");
						pointUser.setName(pointUserName);
						pointUser.setRole(role);
						pointUser.setCreateTime(new Date());
						userService.save(pointUser);
					}

					BaseUserEntity baseUser = userService.findOneBase(pointUser.getId());
					enterprise.setPointUser(baseUser);
				}

				// 国税识别码
				cell = sheet.getRow(15).getCell(1);
				if (cell != null) {
					String nationalTaxNumber = cell.getStringCellValue().trim();
					enterprise.setNationalTaxNumber(nationalTaxNumber);
				}

				// 国税纳税人名称
				cell = sheet.getRow(16).getCell(1);
				if (cell != null) {
					String nationalTaxUser = cell.getStringCellValue().trim();
					enterprise.setNationalTaxUser(nationalTaxUser);
				}

				// 地税识别码
				cell = sheet.getRow(17).getCell(1);
				if (cell != null) {
					String localTaxNumber = cell.getStringCellValue().trim();
					enterprise.setLocalTaxNumber(localTaxNumber);
				}

				// 地税纳税人名称
				cell = sheet.getRow(18).getCell(1);
				if (cell != null) {
					String localTaxUser = cell.getStringCellValue().trim();
					enterprise.setLocalTaxUser(localTaxUser);
				}

				enterprise.getProducts().clear();
				// 企业产品
				HSSFRow row = sheet.getRow(21);
				for (int k = 1; k < row.getLastCellNum(); k++) {
					ProductEntity product = new ProductEntity();

					// 产品名称
					cell = sheet.getRow(21).getCell(k);
					if (cell != null) {
						String productName = cell.getStringCellValue().trim();
						product.setName(productName);
					}

					// 产品图片
					String location = "22-" + k;
					HSSFPictureData pic = picMap.get(location);

					if (pic != null) {
						String ext = pic.suggestFileExtension();
						byte[] data = pic.getData();

						String suffix = ".png";
						switch (ext) {
						case "jpeg":
							suffix = ".jpg";
							break;
						case "png":
							suffix = ".png";
							break;
						default:
							break;
						}

						String imagePath = savePath + suffix;
						imagePath = PathFormat.parse(imagePath, "");

						Path relPath = Paths.get(uploadPath, imagePath);
						File imagefile = relPath.toFile();
						FileUtils.sureDirExists(imagefile, true);

						FileOutputStream out = new FileOutputStream(imagefile);
						out.write(data);
						out.close();

						product.setImagePath(imagePath);
					}

					// 联系电话
					cell = sheet.getRow(23).getCell(k);
					if (cell != null) {
						String productTelephone = null;
						if (cell.getCellType() == HSSFCell.CELL_TYPE_NUMERIC) {
							productTelephone = df.format(cell.getNumericCellValue());
						} else {
							productTelephone = cell.getStringCellValue().trim();
						}
						product.setTelephone(productTelephone);
					}

					// 规格参数
					cell = sheet.getRow(24).getCell(k);
					if (cell != null) {
						String specification = cell.getStringCellValue();
						product.setSpecification(specification);
					}

					// 产品介绍
					cell = sheet.getRow(25).getCell(k);
					if (cell != null) {
						String introduction = cell.getStringCellValue().trim();
						product.setIntroduction(introduction);
					}

					product.setCreateTime(new Date());
					enterpriseService.saveProduct(product);

					enterprise.getProducts().add(product);
				}

				enterpriseService.save(enterprise);

			} catch (Exception e) {
				log.error(sheetName, e);
				//FileUtils.writeInfo(errorFile, sheetName + "-->" + e.getMessage(), true);
			}
		}
		return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
	}

}
