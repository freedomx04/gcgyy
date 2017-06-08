package com.hongmeng.gcgyy.service.authority;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import com.hongmeng.gcgyy.entity.assist.AppealEntity;
import com.hongmeng.gcgyy.entity.authority.BaseEnterpriseEntity;
import com.hongmeng.gcgyy.entity.authority.BaseUserEntity;
import com.hongmeng.gcgyy.entity.authority.EnterpriseEntity;
import com.hongmeng.gcgyy.entity.authority.EnterpriseEntity.PointStatus;
import com.hongmeng.gcgyy.entity.authority.NewsEntity;
import com.hongmeng.gcgyy.entity.authority.ProductEntity;
import com.hongmeng.gcgyy.entity.authority.UserEntity;
import com.hongmeng.gcgyy.entity.baseData.AreaEntity;
import com.hongmeng.gcgyy.entity.baseData.ProductTypeEntity;
import com.hongmeng.gcgyy.entity.industryService.DeclareApplyEntity;
import com.hongmeng.gcgyy.entity.industryService.HireEntity;
import com.hongmeng.gcgyy.entity.monitor.BenefitEntity;
import com.hongmeng.gcgyy.entity.monitor.EconomicEntity;
import com.hongmeng.gcgyy.entity.monitor.EconomicTargetEntity;
import com.hongmeng.gcgyy.entity.monitor.EnergyEntity;
import com.hongmeng.gcgyy.entity.monitor.LocalTaxEntity;
import com.hongmeng.gcgyy.entity.monitor.NationalTaxEntity;
import com.hongmeng.gcgyy.entity.monitor.ScoreEntity;
import com.hongmeng.gcgyy.repository.assist.AppealRepositoy;
import com.hongmeng.gcgyy.repository.authority.BaseEnterpriseRepository;
import com.hongmeng.gcgyy.repository.authority.EnterpriseRepository;
import com.hongmeng.gcgyy.repository.authority.NewsRepository;
import com.hongmeng.gcgyy.repository.authority.ProductRepository;
import com.hongmeng.gcgyy.repository.authority.UserRepository;
import com.hongmeng.gcgyy.repository.industryService.DeclareApplyRepository;
import com.hongmeng.gcgyy.repository.industryService.HireRepository;
import com.hongmeng.gcgyy.repository.monitor.BenefitRepository;
import com.hongmeng.gcgyy.repository.monitor.EconomicRepository;
import com.hongmeng.gcgyy.repository.monitor.EconomicTargetRepository;
import com.hongmeng.gcgyy.repository.monitor.EnergyRepository;
import com.hongmeng.gcgyy.repository.monitor.LocalTaxRepository;
import com.hongmeng.gcgyy.repository.monitor.NationalTaxRepository;
import com.hongmeng.gcgyy.repository.monitor.ScoreRepository;

@Service
public class EnterpriseServiceImpl implements EnterpriseService {

	@Autowired
	EnterpriseRepository enterpriseRepository;

	@Autowired
	BaseEnterpriseRepository baseEnterpriseRepository;

	@Autowired
	ProductRepository productRepository;

	@Autowired
	NewsRepository newsRepository;

	@Autowired
	UserRepository userRepository;

	@Override
	public EnterpriseEntity findOne(Long enterpriseId) {
		return enterpriseRepository.findOne(enterpriseId);
	}

	@Override
	public BaseEnterpriseEntity findOneBase(Long enterpriseId) {
		return baseEnterpriseRepository.findOne(enterpriseId);
	}

	@Override
	public void save(EnterpriseEntity enterprise) {
		enterpriseRepository.save(enterprise);
	}

	@Override
	public void update(EnterpriseEntity enterprise, String imagePath, String name, String introduction, AreaEntity area,
			ProductTypeEntity productType, String mainProduct, Date productionTime, String principal, String telephone,
			String address, String representative, String shareholder, Double registeredCapital, String alterRecording,
			BaseUserEntity pointUser, String pointUserTel, Integer pointStatus, String nationalTaxNumber,
			String nationalTaxUser, String localTaxNumber, String localTaxUser) {
		enterprise.setImagePath(imagePath);
		enterprise.setName(name);
		enterprise.setIntroduction(introduction);
		enterprise.setArea(area);
		enterprise.setProductType(productType);
		enterprise.setMainProduct(mainProduct);
		enterprise.setProductionTime(productionTime);
		enterprise.setPrincipal(principal);
		enterprise.setTelephone(telephone);
		enterprise.setAddress(address);
		enterprise.setRepresentative(representative);
		enterprise.setShareholder(shareholder);
		enterprise.setRegisteredCapital(registeredCapital);
		enterprise.setAlterRecording(alterRecording);
		enterprise.setPointUser(pointUser);
		enterprise.setPointUserTel(pointUserTel);
		enterprise.setPointStatus(pointStatus);
		enterprise.setNationalTaxNumber(nationalTaxNumber);
		enterprise.setNationalTaxUser(nationalTaxUser);
		enterprise.setLocalTaxNumber(localTaxNumber);
		enterprise.setLocalTaxUser(localTaxUser);
		enterpriseRepository.save(enterprise);
	}

	
	@Autowired
	HireRepository hireRepository;
	@Autowired
	EconomicRepository economicRepository;
	@Autowired
	EconomicTargetRepository economicTargetRepository;
	@Autowired
	BenefitRepository benefitRepository;
	@Autowired
	EnergyRepository energyRepository;
	@Autowired
	LocalTaxRepository localTaxRepository;
	@Autowired
	NationalTaxRepository nationalTaxRepository;
	@Autowired
	ScoreRepository scoreRepository;
	@Autowired
	DeclareApplyRepository declareApplyRepository;
	@Autowired
	AppealRepositoy appealRepository;
	
	@Override
	public void delete(Long enterpriseId) {
		// 先删除关联表中该企业的记录
		// industry_service_hire
		Iterable<HireEntity> hireIt = hireRepository.findByEnterpriseId(enterpriseId);
		hireRepository.delete(hireIt);
		
		// monitor_economic
		Iterable<EconomicEntity> economicIt = economicRepository.findByEnterpriseId(enterpriseId);
		economicRepository.delete(economicIt);
		
		// monitor_economic_target
		Iterable<EconomicTargetEntity> economicTargetIt = economicTargetRepository.findByEnterpriseId(enterpriseId);
		economicTargetRepository.delete(economicTargetIt);
		
		// monitor_benefit
		Iterable<BenefitEntity> benefitIt = benefitRepository.findByEnterpriseId(enterpriseId);
		benefitRepository.delete(benefitIt);
		
		// monitor_energy
		Iterable<EnergyEntity> energyIt = energyRepository.findByEnterpriseId(enterpriseId);
		energyRepository.delete(energyIt);
		
		// monitor_local_tax
		Iterable<LocalTaxEntity> localTaxIt = localTaxRepository.findByEnterpriseId(enterpriseId);
		localTaxRepository.delete(localTaxIt);
		
		// monitor_national_tax
		Iterable<NationalTaxEntity> nationalTaxIt = nationalTaxRepository.findByEnterpriseId(enterpriseId);
		nationalTaxRepository.delete(nationalTaxIt);
		
		// monitor_score
		ScoreEntity score = scoreRepository.findByEnterpriseId(enterpriseId);
		if (score != null) {
			scoreRepository.delete(score);
		}
		
		// service_declare_apply
		Iterable<DeclareApplyEntity> declareApplyIt = declareApplyRepository.findByEnterpriseId(enterpriseId);
		declareApplyRepository.delete(declareApplyIt);
		
		// assist_appeal 
		Iterable<AppealEntity> appealIt = appealRepository.findByEnterpriseIdOrderByCreateTimeDesc(enterpriseId);
		appealRepository.delete(appealIt);
		
		// authority_user
		Iterable<UserEntity> userIt = userRepository.findByEnterpriseId(enterpriseId);
		for (UserEntity user: userIt) {
			user.setEnterprise(null);
			userRepository.save(user);
		}
		
		// 删完所以关联后再删除该企业
		enterpriseRepository.delete(enterpriseId);
	}

	@Override
	public List<EnterpriseEntity> list() {
		return (List<EnterpriseEntity>) enterpriseRepository.findAll();
	}

	@Override
	public List<EnterpriseEntity> listPaging(int page, int size) {
		Page<EnterpriseEntity> enterprisePage = enterpriseRepository.findAll(new PageRequest(page, size));
		return enterprisePage.getContent();
	}

	@Override
	public Long findByUserId(Long userId) {
		return enterpriseRepository.findByUserId(userId);
	}

	@Override
	public EnterpriseEntity findByName(String name) {
		return enterpriseRepository.findByName(name);
	}
	
	@Override
	public BaseEnterpriseEntity findByNameBase(String name) {
		return baseEnterpriseRepository.findByName(name);
	}
	
	@Override
	public ProductEntity findOneProduct(Long productId) {
		return productRepository.findOne(productId);
	}

	@Override
	public void saveProduct(ProductEntity product) {
		productRepository.save(product);
	}

	@Override
	public void updateProduct(ProductEntity product, String imagePath, String name, String introduction,
			String specification, String telephone) {
		product.setImagePath(imagePath);
		product.setName(name);
		product.setIntroduction(introduction);
		product.setSpecification(specification);
		product.setTelephone(telephone);
		productRepository.save(product);
	}

	@Override
	public void deleteProduct(List<Long> productIds) {
		Iterable<ProductEntity> it = productRepository.findByIdIn(productIds);
		productRepository.delete(it);
	}

	@Override
	public List<ProductEntity> listProduct(Long enterpriseId) {
		return (List<ProductEntity>) productRepository.findAllByEnterpriseId(enterpriseId);
	}

	@Override
	public List<ProductEntity> listProductPaging(Long enterpriseId, int page, int size) {
		Page<ProductEntity> productPage = productRepository.findAllByEnterpriseId(enterpriseId,
				new PageRequest(page, size));
		return productPage.getContent();
	}

	@Override
	public List<ProductEntity> listAllProduct() {
		return (List<ProductEntity>) productRepository.findAll();
	}

	@Override
	public List<ProductEntity> listAllPagingProduct(int page, int size) {
		Page<ProductEntity> pageAll = productRepository.findAll(new PageRequest(page, size));
		return pageAll.getContent();
	}
	
	@Override
	public List<ProductEntity> searchProduct(String input) {
		return productRepository.findByNameContaining(input);
	}

	@Override
	public NewsEntity findOneNews(Long newsId) {
		return newsRepository.findOne(newsId);
	}

	@Override
	public void saveNews(NewsEntity news) {
		newsRepository.save(news);
	}

	@Override
	public void updateNews(NewsEntity news, String title, String linkPath) {
		news.setTitle(title);
		news.setLinkPath(linkPath);
		newsRepository.save(news);
	}

	@Override
	public void deleteNews(List<Long> newsIds) {
		Iterable<NewsEntity> it = newsRepository.findByIdIn(newsIds);
		newsRepository.delete(it);
	}

	@Override
	public List<NewsEntity> listNews(Long enterpriseId) {
		return (List<NewsEntity>) newsRepository.findAllByEnterpriseId(enterpriseId);
	}

	@Override
	public List<NewsEntity> listNewsPaging(Long enterpriseId, int page, int size) {
		Page<NewsEntity> newsPage = newsRepository.findAllByEnterpriseId(enterpriseId, new PageRequest(page, size));
		return newsPage.getContent();
	}

	@Override
	public List<EnterpriseEntity> listByPointUserId(Long pointUserId) {
		return enterpriseRepository.findByPointUserId(pointUserId);
	}

	@Override
	public List<EnterpriseEntity> listByPointUserId(Long pointUserId, int page, int size) {
		Page<EnterpriseEntity> enterprisePage = enterpriseRepository.findByPointUserId(pointUserId,
				new PageRequest(page, size));
		return enterprisePage.getContent();
	}

	@Override
	public List<ProductEntity> listProductByPointUser(BaseUserEntity pointUser) {
		List<EnterpriseEntity> list = enterpriseRepository.findByPointUser(pointUser);
		List<Long> enterpriseIds = new ArrayList<Long>();
		for (int i = 0; i < list.size(); i++) {
			enterpriseIds.add(list.get(i).getId());
		}
		return productRepository.findByEnterpriseIdIn(enterpriseIds);
	}

	@Override
	public List<NewsEntity> listNewsByPointUser(BaseUserEntity pointUser) {
		List<EnterpriseEntity> list = enterpriseRepository.findByPointUser(pointUser);
		List<Long> enterpriseIds = new ArrayList<Long>();
		for (int i = 0; i < list.size(); i++) {
			enterpriseIds.add(list.get(i).getId());
		}
		return newsRepository.findByEnterpriseIdIn(enterpriseIds);
	}

	/**
	 * base enterprise
	 */
	@Override
	public List<BaseEnterpriseEntity> listBase() {
		return (List<BaseEnterpriseEntity>) baseEnterpriseRepository.findAll();
	}

	@Override
	public List<BaseEnterpriseEntity> listBase(int page, int size) {
		Page<BaseEnterpriseEntity> enterprisePage = baseEnterpriseRepository.findAll(new PageRequest(page, size));
		return enterprisePage.getContent();
	}

	@Override
	public List<BaseEnterpriseEntity> listByAreaId(Long areaId) {
		return baseEnterpriseRepository.findByAreaId(areaId);
	}

	@Override
	public List<BaseEnterpriseEntity> listByProductTypeId(Long productTypeId) {
		return baseEnterpriseRepository.findByProductTypeId(productTypeId);
	}

	@Override
	public List<BaseEnterpriseEntity> listPoint() {
		return baseEnterpriseRepository.findByPointStatus(PointStatus.POINT);
	}
	
	@Override
	public List<BaseEnterpriseEntity> search(String input) {
		return baseEnterpriseRepository.findByNameContaining(input);
	}

}