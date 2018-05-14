package com.hongmeng.gcgyy.entity.authority;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Index;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hongmeng.gcgyy.entity.BaseEntity;
import com.hongmeng.gcgyy.entity.baseData.AreaEntity;
import com.hongmeng.gcgyy.entity.baseData.ProductTypeEntity;

@Entity
@Table(name = "authority_enterprise", indexes = { 
	@Index(name = "index_enterprise_name", columnList = "name"),
	@Index(name = "index_enterprise_pointstatus", columnList = "point_status")
})
public class EnterpriseEntity extends BaseEntity {

	public class PointStatus {
		public static final int UNPOINT = 0; // 非重点企业
		public static final int POINT = 1; // 重点企业
	}

	private String imagePath; // 企业图片

	@Column(unique = true)
	private String name; // 企业名称

	@Column(length = 4000)
	private String introduction; // 企业介绍

	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "area_id")
	private AreaEntity area; // 区域

	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "product_type_id")
	private ProductTypeEntity productType; // 产品类别

	private String mainProduct; // 主要产品名称

	private Date productionTime; // 投产时间

	private String principal; // 企业负责人

	private String telephone; // 联系电话

	private String address; // 地址

	private String designCapacity; // 设计产能

	private String representative; // 企业法人

	@Column(length = 2000)
	private String shareholder; // 主要股东

	private Double registeredCapital; // 注册资金

	@Column(length = 2000)
	private String alterRecording; // 变更记录

	@OneToMany(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "enterprise_id")
	private List<BaseUserEntity> users = new LinkedList<>(); // 企业联系人

	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "point_user_id")
	private BaseUserEntity pointUser; // 挂点人

	private String pointUserTel; // 挂点人电话

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "enterprise_id")
	private List<ProductEntity> products = new LinkedList<>(); // 企业产品

	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "enterprise_id")
	private List<NewsEntity> newsList = new LinkedList<>(); // 企业新闻

	private String nationalTaxNumber; // 国税识别号

	private String nationalTaxUser; // 国税纳税人名称

	private String localTaxNumber; // 地税识别号

	private String localTaxUser; // 地税纳税人名称

	@Column(name = "point_status")
	private Integer pointStatus = PointStatus.UNPOINT; // 重点企业

	public EnterpriseEntity() {
		// TODO Auto-generated constructor stub
	}

	public EnterpriseEntity(String name, AreaEntity area, String mainProduct, Date productionTime,
			ProductTypeEntity productType, String principal, String telephone, String address, 
			String nationalTaxNumber, String nationalTaxUser, String localTaxNumber, String localTaxUser) {
		this.name = name;
		this.area = area;
		this.mainProduct = mainProduct;
		this.productionTime = productionTime;
		this.productType = productType;
		this.principal = principal;
		this.telephone = telephone;
		this.address = address;
		this.nationalTaxNumber = nationalTaxNumber;
		this.nationalTaxUser = nationalTaxUser;
		this.localTaxNumber = localTaxNumber;
		this.localTaxUser = localTaxUser;
	}

	public EnterpriseEntity(String imagePath, String name, String introduction, AreaEntity area,
			ProductTypeEntity productType, String mainProduct, Date productionTime, String principal, String telephone,
			String address, String representative, String shareholder, Double registeredCapital, String alterRecording,
			BaseUserEntity pointUser, String pointUserTel, Integer pointStatus, String nationalTaxNumber, 
			String nationalTaxUser, String localTaxNumber, String localTaxUser) {
		this.imagePath = imagePath;
		this.name = name;
		this.introduction = introduction;
		this.area = area;
		this.productType = productType;
		this.mainProduct = mainProduct;
		this.productionTime = productionTime;
		this.principal = principal;
		this.telephone = telephone;
		this.address = address;
		this.representative = representative;
		this.shareholder = shareholder;
		this.registeredCapital = registeredCapital;
		this.alterRecording = alterRecording;
		this.pointUser = pointUser;
		this.pointUserTel = pointUserTel;
		this.pointStatus = pointStatus;
		this.nationalTaxNumber = nationalTaxNumber;
		this.nationalTaxUser = nationalTaxUser;
		this.localTaxNumber = localTaxNumber;
		this.localTaxUser = localTaxUser;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public AreaEntity getArea() {
		return area;
	}

	public void setArea(AreaEntity area) {
		this.area = area;
	}

	public ProductTypeEntity getProductType() {
		return productType;
	}

	public void setProductType(ProductTypeEntity productType) {
		this.productType = productType;
	}

	public String getMainProduct() {
		return mainProduct;
	}

	public void setMainProduct(String mainProduct) {
		this.mainProduct = mainProduct;
	}

	public Date getProductionTime() {
		return productionTime;
	}

	public void setProductionTime(Date productionTime) {
		this.productionTime = productionTime;
	}

	public String getPrincipal() {
		return principal;
	}

	public void setPrincipal(String principal) {
		this.principal = principal;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRepresentative() {
		return representative;
	}

	public void setRepresentative(String representative) {
		this.representative = representative;
	}

	public String getShareholder() {
		return shareholder;
	}

	public void setShareholder(String shareholder) {
		this.shareholder = shareholder;
	}

	public Double getRegisteredCapital() {
		return registeredCapital;
	}

	public void setRegisteredCapital(Double registeredCapital) {
		this.registeredCapital = registeredCapital;
	}

	public String getAlterRecording() {
		return alterRecording;
	}

	public void setAlterRecording(String alterRecording) {
		this.alterRecording = alterRecording;
	}

	public List<BaseUserEntity> getUsers() {
		return users;
	}

	public void setUsers(List<BaseUserEntity> users) {
		this.users = users;
	}

	public BaseUserEntity getPointUser() {
		return pointUser;
	}

	public void setPointUser(BaseUserEntity pointUser) {
		this.pointUser = pointUser;
	}

	public String getPointUserTel() {
		return pointUserTel;
	}

	public void setPointUserTel(String pointUserTel) {
		this.pointUserTel = pointUserTel;
	}

	public List<ProductEntity> getProducts() {
		return products;
	}

	public void setProducts(List<ProductEntity> products) {
		this.products = products;
	}

	public List<NewsEntity> getNewsList() {
		return newsList;
	}

	public void setNewsList(List<NewsEntity> newsList) {
		this.newsList = newsList;
	}

	public String getDesignCapacity() {
		return designCapacity;
	}

	public void setDesignCapacity(String designCapacity) {
		this.designCapacity = designCapacity;
	}

	public String getNationalTaxNumber() {
		return nationalTaxNumber;
	}

	public void setNationalTaxNumber(String nationalTaxNumber) {
		this.nationalTaxNumber = nationalTaxNumber;
	}

	public String getNationalTaxUser() {
		return nationalTaxUser;
	}

	public void setNationalTaxUser(String nationalTaxUser) {
		this.nationalTaxUser = nationalTaxUser;
	}

	public String getLocalTaxNumber() {
		return localTaxNumber;
	}

	public void setLocalTaxNumber(String localTaxNumber) {
		this.localTaxNumber = localTaxNumber;
	}

	public String getLocalTaxUser() {
		return localTaxUser;
	}

	public void setLocalTaxUser(String localTaxUser) {
		this.localTaxUser = localTaxUser;
	}

	public Integer getPointStatus() {
		return pointStatus;
	}

	public void setPointStatus(Integer pointStatus) {
		this.pointStatus = pointStatus;
	}

}