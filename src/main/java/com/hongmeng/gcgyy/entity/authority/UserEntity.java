package com.hongmeng.gcgyy.entity.authority;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.hongmeng.gcgyy.entity.BaseEntity;

@Entity
@Table(name = "authority_user")
public class UserEntity extends BaseEntity {

	/**
	 * 用户状态 0：无效 1：有效
	 */
	public class UserStatus {
		public static final int STATUS_NO_VALID = 0;
		public static final int STATUS_VALID = 1;
	}

	/**
	 * 性别 0：女 1：男
	 */
	public class Sex {
		public static final int SEX_FEMALE = 0;
		public static final int SEX_MALE = 1;
	}

	@Column(unique = true)
	private String username; // 用户名

	private String name; // 姓名

	private String password; // MD5加密后的密码

	private String officephone; // 办公电话

	private String telephone; // 个人电话

	private Integer sex; // 性别

	private String email; // 邮箱

	private String address; // 地址

	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "department_id")
	private DepartmentEntity department; // 部门

	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "enterprise_id")
	private EnterpriseEntity enterprise; // 企业

	@OneToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name = "role_id")
	private RoleEntity role; // 关联角色

	private Integer status = UserStatus.STATUS_VALID; // 用户状态

	private String imagePath; // 头像路径

	@Column(length = 4000)
	private String description; // 个人描述
	
	private String position; // 职位

	private String wxUserId; // 微信用户Id
	
	public UserEntity() {
		// TODO Auto-generated constructor stub
	}

	public UserEntity(String username, String password, String telephone) {
		this.username = username;
		this.password = password;
		this.telephone = telephone;
	}

	public UserEntity(String username, String name, String officephone, String telephone, Integer sex, String email,
			String address, DepartmentEntity department, EnterpriseEntity enterprise, RoleEntity role, String description) {
		this.username = username;
		this.name = name;
		this.officephone = officephone;
		this.telephone = telephone;
		this.sex = sex;
		this.email = email;
		this.address = address;
		this.department = department;
		this.enterprise = enterprise;
		this.role = role;
		this.description = description;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getOfficephone() {
		return officephone;
	}

	public void setOfficephone(String officephone) {
		this.officephone = officephone;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public DepartmentEntity getDepartment() {
		return department;
	}

	public void setDepartment(DepartmentEntity department) {
		this.department = department;
	}

	public EnterpriseEntity getEnterprise() {
		return enterprise;
	}

	public void setEnterprise(EnterpriseEntity enterprise) {
		this.enterprise = enterprise;
	}

	public RoleEntity getRole() {
		return role;
	}

	public void setRole(RoleEntity role) {
		this.role = role;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getWxUserId() {
		return wxUserId;
	}

	public void setWxUserId(String wxUserId) {
		this.wxUserId = wxUserId;
	}
	
}