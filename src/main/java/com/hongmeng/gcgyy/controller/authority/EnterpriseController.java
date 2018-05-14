package com.hongmeng.gcgyy.controller.authority;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hongmeng.gcgyy.common.ReturnStatus;
import com.hongmeng.gcgyy.entity.Output;
import com.hongmeng.gcgyy.entity.OutputList;
import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;
import com.hongmeng.gcgyy.entity.authority.BaseUserEntity;
import com.hongmeng.gcgyy.entity.authority.EnterpriseEntity;
import com.hongmeng.gcgyy.entity.authority.NewsEntity;
import com.hongmeng.gcgyy.entity.authority.ProductEntity;
import com.hongmeng.gcgyy.entity.authority.UserEntity;
import com.hongmeng.gcgyy.entity.baseData.AreaEntity;
import com.hongmeng.gcgyy.entity.baseData.ProductTypeEntity;
import com.hongmeng.gcgyy.service.authority.EnterpriseService;
import com.hongmeng.gcgyy.service.authority.UserService;
import com.hongmeng.gcgyy.service.baseData.AreaService;
import com.hongmeng.gcgyy.service.baseData.ProductTypeService;
import com.hongmeng.gcgyy.service.common.UeditorService;

@RestController
@RequestMapping("enterprise")
public class EnterpriseController {

	static Logger log = LoggerFactory.getLogger(EnterpriseController.class);

	@Autowired
	EnterpriseService enterpriseService;

	@Autowired
	UserService userService;

	@Autowired
	AreaService areaService;

	@Autowired
	ProductTypeService productTypeService;

	@Autowired
	UeditorService ueditorService;

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public Output add(@RequestParam(required = false) String imagePath, @RequestParam String name,
			@RequestParam String introduction, @RequestParam Long areaId, @RequestParam Long productTypeId,
			@RequestParam String mainProduct, @RequestParam(required = false) Date productionTime,
			@RequestParam String principal, @RequestParam String telephone, @RequestParam String address,
			@RequestParam(required = false) String representative, @RequestParam(required = false) String shareholder,
			@RequestParam(required = false) Double registeredCapital,
			@RequestParam(required = false) String alterRecording, @RequestParam(required = false) Long pointUserId,
			@RequestParam(required = false) String pointUserTel, @RequestParam(required = false) Integer pointStatus,
			@RequestParam(required = false) String nationalTaxNumber,
			@RequestParam(required = false) String nationalTaxUser,
			@RequestParam(required = false) String localTaxNumber,
			@RequestParam(required = false) String localTaxUser) {
		try {
			BaseUserEntity pointUser = pointUserId == null ? null : userService.findOneBase(pointUserId);
			AreaEntity area = areaService.findOne(areaId);
			ProductTypeEntity productType = productTypeService.findOne(productTypeId);

			EnterpriseEntity enterprise = new EnterpriseEntity(imagePath, name, introduction, area, productType,
					mainProduct, productionTime, principal, telephone, address, representative, shareholder,
					registeredCapital, alterRecording, pointUser, pointUserTel, pointStatus, nationalTaxNumber,
					nationalTaxUser, localTaxNumber, localTaxUser);

			enterprise.setCreateTime(new Date());
			enterpriseService.save(enterprise);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public Output edit(@RequestParam Long enterpriseId, @RequestParam(required = false) String imagePath,
			@RequestParam String name, @RequestParam String introduction, @RequestParam Long areaId,
			@RequestParam Long productTypeId, @RequestParam String mainProduct,
			@RequestParam(required = false) Date productionTime, @RequestParam String principal,
			@RequestParam String telephone, @RequestParam String address,
			@RequestParam(required = false) String representative, @RequestParam(required = false) String shareholder,
			@RequestParam(required = false) Double registeredCapital,
			@RequestParam(required = false) String alterRecording, @RequestParam(required = false) Long pointUserId,
			@RequestParam(required = false) String pointUserTel, @RequestParam(required = false) Integer pointStatus,
			@RequestParam(required = false) String nationalTaxNumber,
			@RequestParam(required = false) String nationalTaxUser,
			@RequestParam(required = false) String localTaxNumber,
			@RequestParam(required = false) String localTaxUser) {
		try {
			EnterpriseEntity enterprise = enterpriseService.findOne(enterpriseId);
			BaseUserEntity pointUser = pointUserId != null ? userService.findOneBase(pointUserId) : null;
			AreaEntity area = areaService.findOne(areaId);
			ProductTypeEntity productType = productTypeService.findOne(productTypeId);

			enterpriseService.update(enterprise, imagePath, name, introduction, area, productType, mainProduct,
					productionTime, principal, telephone, address, representative, shareholder, registeredCapital,
					alterRecording, pointUser, pointUserTel, pointStatus, nationalTaxNumber, nationalTaxUser,
					localTaxNumber, localTaxUser);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public Output delete(@RequestParam Long enterpriseId) {
		try {
			enterpriseService.delete(enterpriseId);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listBase", method = RequestMethod.POST)
	public OutputList listBase() {
		try {
			return new OutputList(enterpriseService.listBase(), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public OutputList list() {
		try {
			return new OutputList(enterpriseService.list(), ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listPaging", method = RequestMethod.POST)
	public OutputList listPaging(@RequestParam int page, @RequestParam int size) {
		try {
			return new OutputList(enterpriseService.listPaging(page, size), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public Output detail(@RequestParam Long enterpriseId) {
		try {
			EnterpriseEntity enterprise = enterpriseService.findOne(enterpriseId);
			return new Output(enterprise, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/getEnterpriseByUserId", method = RequestMethod.POST)
	public Output getEnterpriseByUserId(@RequestParam Long userId) {
		try {
			UserEntity user = userService.findOne(userId);
			EnterpriseEntity enterprise = user.getEnterprise();
			return new Output(enterprise, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByPointUserId", method = RequestMethod.POST)
	public OutputList listByPointUserId(@RequestParam Long pointUserId) {
		try {
			return new OutputList(enterpriseService.listByPointUserId(pointUserId), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listByPointUserIdPaging", method = RequestMethod.POST)
	public OutputList listByPointUserIdPaging(@RequestParam Long pointUserId, @RequestParam int page,
			@RequestParam int size) {
		try {
			return new OutputList(enterpriseService.listByPointUserId(pointUserId, page, size),
					ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/listPointEnterprise", method = RequestMethod.POST)
	public OutputList listPointEnterprise() {
		try {
			return new OutputList(enterpriseService.listPoint(), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public OutputList search(String input) {
		try {
			List<BaseEnterpriseEntity> list = enterpriseService.search(input);
			return new OutputList(list, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	/**
	 * Product
	 */
	@RequestMapping(value = "/product/add", method = RequestMethod.POST)
	public Output productAdd(@RequestParam Long enterpriseId, @RequestParam(required = false) String imagePath,
			@RequestParam String name, @RequestParam String introduction, @RequestParam String specification,
			@RequestParam String telephone) {
		try {
			BaseEnterpriseEntity enterprise = enterpriseService.findOneBase(enterpriseId);
			ProductEntity product = new ProductEntity(enterprise, imagePath, name, introduction, specification,
					telephone);
			product.setCreateTime(new Date());
			enterpriseService.saveProduct(product);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/product/edit", method = RequestMethod.POST)
	public Output productEdit(@RequestParam Long productId, @RequestParam String imagePath, @RequestParam String name,
			@RequestParam String introduction, @RequestParam String specification, @RequestParam String telephone) {
		try {
			ProductEntity product = enterpriseService.findOneProduct(productId);
			enterpriseService.updateProduct(product, imagePath, name, introduction, specification, telephone);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/product/delete", method = RequestMethod.POST)
	public Output productDelete(@RequestParam String productIds) {
		try {
			List<Long> list = new LinkedList<>();
			for (String idStr : StringUtils.split(productIds, ",")) {
				list.add(Long.parseLong(idStr));
			}
			enterpriseService.deleteProduct(list);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/product/listByPointUserId", method = RequestMethod.POST)
	public OutputList productListByPointUserId(@RequestParam Long pointUserId) {
		try {
			BaseUserEntity pointUser = userService.findOneBase(pointUserId);
			return new OutputList(enterpriseService.listProductByPointUser(pointUser), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/product/list", method = RequestMethod.POST)
	public OutputList productList(@RequestParam Long enterpriseId) {
		try {
			return new OutputList(enterpriseService.listProduct(enterpriseId), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/product/listPaging", method = RequestMethod.POST)
	public OutputList productListPaging(@RequestParam Long enterpriseId, int page, int size) {
		try {
			return new OutputList(enterpriseService.listProductPaging(enterpriseId, page, size),
					ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/product/detail", method = RequestMethod.POST)
	public Output productDetail(@RequestParam Long productId) {
		try {
			ProductEntity product = enterpriseService.findOneProduct(productId);
			return new Output(product, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/product/listAll", method = RequestMethod.POST)
	public OutputList productListAll() {
		try {
			return new OutputList(enterpriseService.listAllProduct(), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/product/listAllPaging", method = RequestMethod.POST)
	public OutputList productListAllPaging(int page, int size) {
		try {
			return new OutputList(enterpriseService.listAllPagingProduct(page, size), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/product/search", method = RequestMethod.GET)
	public OutputList productSearch(@RequestParam String input) {
		try {
			List<ProductEntity> list = enterpriseService.searchProduct(input);
			return new OutputList(list, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	/**
	 * News
	 */
	@RequestMapping(value = "/news/add", method = RequestMethod.POST)
	public Output newsAdd(@RequestParam Long enterpriseId, @RequestParam String title, @RequestParam String allHtml) {
		try {
			String linkPath = ueditorService.save(allHtml);
			NewsEntity news = new NewsEntity(enterpriseId, title, linkPath);
			news.setCreateTime(new Date());
			enterpriseService.saveNews(news);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/news/edit", method = RequestMethod.POST)
	public Output newsEdit(@RequestParam Long newsId, @RequestParam String title, @RequestParam String allHtml) {
		try {
			NewsEntity news = enterpriseService.findOneNews(newsId);
			String linkPath = ueditorService.save(allHtml);
			enterpriseService.updateNews(news, title, linkPath);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/news/delete", method = RequestMethod.POST)
	public Output newsDelete(@RequestParam String newsIds) {
		try {
			List<Long> list = new LinkedList<>();
			for (String idStr : StringUtils.split(newsIds, ",")) {
				list.add(Long.parseLong(idStr));
			}
			enterpriseService.deleteNews(list);
			return new Output(null, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/news/listByPointUserId", method = RequestMethod.POST)
	public OutputList newsListByPointUserId(@RequestParam Long pointUserId) {
		try {
			BaseUserEntity pointUser = userService.findOneBase(pointUserId);
			return new OutputList(enterpriseService.listNewsByPointUser(pointUser), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/news/list", method = RequestMethod.POST)
	public OutputList newsList(@RequestParam Long enterpriseId) {
		try {
			return new OutputList(enterpriseService.listNews(enterpriseId), ReturnStatus.SUCCESS.status(),
					ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/news/listPaging", method = RequestMethod.POST)
	public OutputList newsListPaging(@RequestParam Long enterpriseId, int page, int size) {
		try {
			return new OutputList(enterpriseService.listNewsPaging(enterpriseId, page, size),
					ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new OutputList(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}

	@RequestMapping(value = "/news/detail", method = RequestMethod.POST)
	public Output newsDetail(@RequestParam Long newsId) {
		try {
			NewsEntity news = enterpriseService.findOneNews(newsId);
			return new Output(news, ReturnStatus.SUCCESS.status(), ReturnStatus.SUCCESS.msg());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			return new Output(null, ReturnStatus.FAILED.status(), e.getMessage());
		}
	}
}