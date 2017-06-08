package com.hongmeng.gcgyy.controller.common;

import java.io.File;
import java.io.FileInputStream;
import java.math.BigDecimal;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.hongmeng.gcgyy.common.ReturnStatus;
import com.hongmeng.gcgyy.common.utils.CiphersUtils;
import com.hongmeng.gcgyy.entity.Output;
import com.hongmeng.gcgyy.entity.authority.DepartmentEntity;
import com.hongmeng.gcgyy.entity.authority.EnterpriseEntity;
import com.hongmeng.gcgyy.entity.authority.RoleEntity;
import com.hongmeng.gcgyy.entity.authority.UserEntity;
import com.hongmeng.gcgyy.entity.baseData.AppealTypeEntity;
import com.hongmeng.gcgyy.entity.baseData.AreaEntity;
import com.hongmeng.gcgyy.entity.baseData.BusinessEntity;
import com.hongmeng.gcgyy.entity.baseData.CountyEntity;
import com.hongmeng.gcgyy.entity.baseData.ProductTypeEntity;
import com.hongmeng.gcgyy.entity.baseData.ReportEntity;
import com.hongmeng.gcgyy.entity.baseData.ReportEntity.ReportType;
import com.hongmeng.gcgyy.entity.setting.DynamicEntity;
import com.hongmeng.gcgyy.repository.baseData.ProductTypeRepository;
import com.hongmeng.gcgyy.service.authority.DepartmentService;
import com.hongmeng.gcgyy.service.authority.EnterpriseService;
import com.hongmeng.gcgyy.service.authority.RoleService;
import com.hongmeng.gcgyy.service.authority.UserService;
import com.hongmeng.gcgyy.service.baseData.AppealTypeService;
import com.hongmeng.gcgyy.service.baseData.AreaService;
import com.hongmeng.gcgyy.service.baseData.BusinessService;
import com.hongmeng.gcgyy.service.baseData.CountyService;
import com.hongmeng.gcgyy.service.baseData.ProductTypeService;
import com.hongmeng.gcgyy.service.baseData.ReportService;
import com.hongmeng.gcgyy.service.setting.DynamicService;

@RestController
@RequestMapping("init")
public class InitController {

	static Logger log = LoggerFactory.getLogger(InitController.class);

	@Value("${customize.administrator.username}")
	private String adminUserName;

	@Value("${customize.administrator.password}")
	private String adminPassword;

	@Autowired
	UserService userService;

	@Autowired
	RoleService roleService;

	@Autowired
	AreaService areaService;

	@Autowired
	ProductTypeRepository productTypeRepository;

	@Autowired
	AppealTypeService appealTypeService;

	@Autowired
	EnterpriseService enterpriseService;

	@Autowired
	DepartmentService departmentService;

	@Autowired
	ProductTypeService productTypeService;
	
	@Autowired
	DynamicService dynamicService;
	
	@Autowired
	ReportService reportService;
	
	@Autowired
	BusinessService businessService;
	
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping(value = "/role", method = RequestMethod.POST)
	public Output role() {
		try {
			RoleEntity enterpriseRole = roleService.findByName("企业用户");
			if (enterpriseRole == null) {
				enterpriseRole = new RoleEntity("企业用户", "01", "企业用户", "agency_enterprise,assist_dynamic,service_jobPlatform");
				enterpriseRole.setCreateTime(new Date());
				roleService.save(enterpriseRole);
			}
			
			RoleEntity departmentRole = roleService.findByName("政府部门用户");
			if (departmentRole == null) {
				departmentRole = new RoleEntity("政府部门用户", "02", "政府部门用户", "agency_department,assist_dynamic,service_jobPlatform");
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
	
	@RequestMapping(value = "/administrator", method = RequestMethod.POST)
	public Output administrator() {
		try {
			RoleEntity role = roleService.findByName("超级管理员");
			if (role == null) {
				String resource = "authority_role,authority_enterprise,authority_department,authority_user,base_area,base_productType,base_appealType,base_industryType,base_report,assist_dynamic,service_jobPlatform";
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

	@RequestMapping(value = "/area", method = RequestMethod.POST)
	public Output area() {
		try {
			AreaEntity area = areaService.findByName("广昌工业园区");
			if (area == null) {
				area = new AreaEntity("广昌工业园区", "广昌工业园区");
				area.setCreateTime(new Date());
				areaService.save(area);
			}
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/productType", method = RequestMethod.POST)
	public Output productType() {
		try {
			String[] list = new String[] { "食品加工", "纺织服装", "电子信息", "机械制造", "铜加工", "化工", "医药", "其它" };
			for (String name : list) {
				ProductTypeEntity type = productTypeRepository.findByName(name);
				if (type == null) {
					type = new ProductTypeEntity(name);
					type.setCreateTime(new Date());
					productTypeRepository.save(type);
				}
			}
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/businessType", method = RequestMethod.POST)
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

	@RequestMapping(value = "/appealType", method = RequestMethod.POST)
	public Output appealType() {
		try {
			String[] list = new String[] { "资金问题", "用工问题", "社会保险", "人才招聘难", "三乱问题", "用电问题", "用水问题", "用地问题", "物流成本高",
					"产业链配套问题", "政策优惠问题", "其他问题" };
			for (String name : list) {
				AppealTypeEntity type = appealTypeService.findByName(name);
				if (type == null) {
					type = new AppealTypeEntity(name, 5, 10);
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
	
	@RequestMapping(value = "/report", method = RequestMethod.POST)
	public Output report() {
		try {
			ReportEntity economicReport = reportService.findOne(ReportType.ECONOMIC);
			if (economicReport == null) {
				economicReport = new ReportEntity(ReportType.ECONOMIC, 8);
				economicReport.setCreateTime(new Date());
				reportService.save(economicReport);
			}
			
			ReportEntity benefitReport = reportService.findOne(ReportType.BENEFIT);
			if (benefitReport == null) {
				benefitReport = new ReportEntity(ReportType.BENEFIT, 8);
				benefitReport.setCreateTime(new Date());
				reportService.save(benefitReport);
			}
			
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@Autowired
	CountyService countyService;
	
	@RequestMapping(value = "/county", method = RequestMethod.POST)
	public Output county() {
		try {
			String[] list = new String[] {"全市总计", "高新区", "临川区", "南城县", "黎川县", "南丰县", "崇仁县", "乐安县", "宜黄县", "金溪县", "资溪县", "东乡县", "广昌县"};
			for (String name: list) {
				CountyEntity county = countyService.findByName(name);
				if (county == null) {
					county = new CountyEntity(name, "");
					county.setCreateTime(new Date());
					countyService.save(county);
				}
			}
			
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	

	private HSSFWorkbook hssfWorkbook;
	private int firstRowNum = 1; // 默认1
	private int firstCellNum = 2; // 默认2

	@RequestMapping(value = "/enterprise", method = RequestMethod.POST)
	public Output enterprise() {
		try {
			String root = request.getSession().getServletContext().getRealPath("/");
			File file = new File(root + "/resource/enterprise_info.xls");
			
			hssfWorkbook = new HSSFWorkbook(new FileInputStream(file));
			HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(0);

			AreaEntity area = areaService.findByName("广昌工业园区");
			for (int i = firstRowNum; i <= hssfSheet.getLastRowNum(); i++) {
				HSSFRow row = hssfSheet.getRow(i);
				if (null == row) {
					continue;
				}

				String name = "", principal = "", telephone = "", mainProduct = "", address = "";
				Date productionTime = null;
				ProductTypeEntity productType = null;

				for (int k = firstCellNum; k <= row.getLastCellNum(); k++) {
					HSSFCell cell = row.getCell(k);
					switch (k) {
					case 2: // 企业名称
						name = (cell == null) ? "" : cell.getStringCellValue();
						break;
					case 3: // 企业负责人
						principal = (cell == null) ? "" : cell.getStringCellValue();
						break;
					case 4: // 联系电话
						Double numCell = (cell == null) ? null : cell.getNumericCellValue();
						if (null == numCell) {
							telephone = null;
						} else {
							BigDecimal bd = new BigDecimal(numCell);
							telephone = bd.toPlainString();
						}
						break;
					case 5: // 投产时间
						productionTime = (cell == null) ? null : cell.getDateCellValue();
						break;
					case 6: // 主要产品名称
						mainProduct = (cell == null) ? null : cell.getStringCellValue();
						break;
					case 7: // 产品类别
						String typeName = (cell == null) ? null : cell.getStringCellValue();
						productType = productTypeService.findByName(typeName);
						break;
					case 8: // 企业地址
						address = (cell == null) ? null : cell.getStringCellValue();
						break;
					case 9: // 2015年主营业务收入
						break;
					case 10: // 2015年税金
						break;
					case 11: // 2015年企业用电量
						break;
					case 12: // 2016年主营业务收入
						break;
					case 13: // 2016年税金
						break;
					case 14: // 2016年企业用电量
						break;
					}
				}

				EnterpriseEntity enterprise = enterpriseService.findByName(name);
				if (enterprise == null) {
					//enterprise = new EnterpriseEntity();
					//enterprise.setName(name);
					continue;
				}

				enterprise.setArea(area);
				enterprise.setPrincipal(principal);
				enterprise.setTelephone(telephone);
				enterprise.setProductionTime(productionTime);
				enterprise.setMainProduct(mainProduct);
				enterprise.setProductType(productType);
				enterprise.setAddress(address);
				enterpriseService.save(enterprise);
			}

			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/department", method = RequestMethod.POST)
	public Output department() {
		try {
			String[] list = new String[] { "环保局", "商务局", "县物流产业发展局", "县安监局", "园区", "交通局", "审计局" };
			AreaEntity area = areaService.findByName("广昌工业园区");
			for (String name : list) {
				DepartmentEntity department = departmentService.findByName(name);
				if (department == null) {
					department = new DepartmentEntity(name, name, name, area);
					department.setCreateTime(new Date());
					departmentService.save(department);
				}
			}
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
	
	@RequestMapping(value = "/dynamic", method = RequestMethod.POST)
	public Output dynamic() {
		try {
			dynamicService.save(new DynamicEntity("2016年全省中等学校招生文化考试广昌考区一中考点培训会召开", 0, "", "html/20160714/1468462858630084942.html"));
			dynamicService.save(new DynamicEntity("广昌着力打造一条红色旅游线路 引来八方宾客   ", 0, "", "html/20160713/1468410746047030441.html"));
			dynamicService.save(new DynamicEntity("市工商联领导深入杨溪乡开展“百企帮百村”村企对接帮扶活动 ", 0, "", "html/20160714/1468462843551025225.html"));
			dynamicService.save(new DynamicEntity("李建林深入我县调研指导“两学一做”和扶贫工作 ", 0, "", "html/20160714/1468462831526092564.html"));
			dynamicService.save(new DynamicEntity("2016年中国广昌国际莲花节系列活动将于7月5日至11日举办 ", 0, "", "html/20160714/1468462820523051509.html"));
			dynamicService.save(new DynamicEntity("2015泰豪杯“同心共建·生态广昌”摄影展在县莲花广场举办 ", 0, "", "html/20160714/1468462798705009831.html"));
			dynamicService.save(new DynamicEntity("我县开展“国际禁毒日”宣传活动 ", 0, "", "html/20160714/1468462758734097016.html"));
			
			dynamicService.save(new DynamicEntity("人社部劳动关系司有关负责同志就贯彻实施新修订的劳动合同法严格规范劳务派遣", 1, "", "html/20160713/1468410518150064351.html"));
			dynamicService.save(new DynamicEntity("坚持高端引领选拔培养领军人才", 1, "", "html/20160713/1468410545036038229.html"));
			dynamicService.save(new DynamicEntity("国资委主要负责同志就《关于深化国有企业改革的指导意见》答记者问", 1, "", "html/20160713/1468410572248056578.html"));
			dynamicService.save(new DynamicEntity("企业信息公示暂行条例", 1, "", "html/20160713/1468410593651001622.html"));
			dynamicService.save(new DynamicEntity("企业职工带薪年休假实施办法", 1, "", "html/20160713/1468410617968076281.html"));
			dynamicService.save(new DynamicEntity("中华人民共和国银行业监督管理法 ", 1, "", "html/20160713/1468410636531080582.html"));
			dynamicService.save(new DynamicEntity("中华人民共和国反垄断法", 1, "", "html/20160713/1468410666081070014.html"));
			
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

}
