package com.ptit.itjob.model;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "company", catalog = "itjob")
public class Company implements java.io.Serializable {

	private static final long serialVersionUID = -3691803802002824948L;
	private Integer id;
	private Account account;
	private CompanyType companyType;
	private Location location;
	private String name;
	private String quantity;
	private String website;
	private String address;
	private String logo;
	private String description;
	private String phone;
	private Set<Job> jobs = new HashSet<Job>(0);

	public Company() {
	}

	public Company(Account account, CompanyType companyType, Location location, String name, String quantity,
			String address, String logo, String phone) {
		this.account = account;
		this.companyType = companyType;
		this.location = location;
		this.name = name;
		this.quantity = quantity;
		this.address = address;
		this.logo = logo;
		this.phone = phone;
	}

	public Company(Account account, CompanyType companyType, Location location, String name, String quantity,
			String website, String address, String logo, String description, String phone, Set<Job> jobs) {
		this.account = account;
		this.companyType = companyType;
		this.location = location;
		this.name = name;
		this.quantity = quantity;
		this.website = website;
		this.address = address;
		this.logo = logo;
		this.description = description;
		this.phone = phone;
		this.jobs = jobs;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "account_id", nullable = false)
	public Account getAccount() {
		return this.account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "company_type_id", nullable = false)
	public CompanyType getCompanyType() {
		return this.companyType;
	}

	public void setCompanyType(CompanyType companyType) {
		this.companyType = companyType;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "location_id", nullable = false)
	public Location getLocation() {
		return this.location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

	@Column(name = "name", nullable = false, length = 50)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "quantity", nullable = false, length = 45)
	public String getQuantity() {
		return this.quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	@Column(name = "website")
	public String getWebsite() {
		return this.website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	@Column(name = "address", nullable = false)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "logo", nullable = false)
	public String getLogo() {
		return this.logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	@Column(name = "description", length = 500)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "phone", nullable = false)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "company")
	public Set<Job> getJobs() {
		return this.jobs;
	}

	public void setJobs(Set<Job> jobs) {
		this.jobs = jobs;
	}

}
