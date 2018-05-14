package com.hongmeng.gcgyy.service.authority;

import java.util.Date;
import java.util.List;

import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;
import com.hongmeng.gcgyy.entity.authority.BaseUserEntity;
import com.hongmeng.gcgyy.entity.authority.EnterpriseEntity;
import com.hongmeng.gcgyy.entity.authority.NewsEntity;
import com.hongmeng.gcgyy.entity.authority.ProductEntity;
import com.hongmeng.gcgyy.entity.baseData.AreaEntity;
import com.hongmeng.gcgyy.entity.baseData.ProductTypeEntity;

public interface EnterpriseService {

	EnterpriseEntity findOne(Long enterpriseId);

	BaseEnterpriseEntity findOneBase(Long enterpriseId);

	void save(EnterpriseEntity enterprise);

	void update(EnterpriseEntity enterprise, String imagePath, String name, String introduction, AreaEntity area,
			ProductTypeEntity productType, String mainProduct, Date productionTime, String principal, String telephone,
			String address, String representative, String shareholder, Double registeredCapital, String alterRecording,
			BaseUserEntity pointUser, String pointUserTel, Integer pointStatus, String nationalTaxNumber,
			String nationalTaxUser, String localTaxNumber, String localTaxUser);

	void delete(Long enterpriseId);

	List<EnterpriseEntity> list();

	List<EnterpriseEntity> listPaging(int page, int size);

	Long findByUserId(Long userId);

	EnterpriseEntity findByName(String name);
	
	BaseEnterpriseEntity findByNameBase(String name);

	List<EnterpriseEntity> listByPointUserId(Long pointUserId);

	List<EnterpriseEntity> listByPointUserId(Long pointUserId, int page, int size);
	

	/**
	 * Product
	 */
	ProductEntity findOneProduct(Long productId);

	void saveProduct(ProductEntity product);

	void updateProduct(ProductEntity product, String imagePath, String name, String introduction, String specification,
			String telephone);

	void deleteProduct(List<Long> productIds);

	List<ProductEntity> listProduct(Long enterpriseId);

	List<ProductEntity> listProductPaging(Long enterpriseId, int page, int size);

	List<ProductEntity> listAllProduct();

	List<ProductEntity> listAllPagingProduct(int page, int size);
	
	List<ProductEntity> searchProduct(String input);

	/**
	 * News
	 */
	NewsEntity findOneNews(Long newsId);

	void saveNews(NewsEntity news);

	void updateNews(NewsEntity news, String title, String linkPath);

	void deleteNews(List<Long> newsIds);

	List<NewsEntity> listNews(Long enterpriseId);

	List<NewsEntity> listNewsPaging(Long enterpriseId, int page, int size);

	List<ProductEntity> listProductByPointUser(BaseUserEntity pointUser);

	List<NewsEntity> listNewsByPointUser(BaseUserEntity pointUser);

	/**
	 * base enterprise
	 */
	List<BaseEnterpriseEntity> listBase();

	List<BaseEnterpriseEntity> listBase(int page, int size);

	List<BaseEnterpriseEntity> listByAreaId(Long areaId);

	List<BaseEnterpriseEntity> listByProductTypeId(Long productTypeId);

	List<BaseEnterpriseEntity> listPoint();
	
	List<BaseEnterpriseEntity> search(String input);

}