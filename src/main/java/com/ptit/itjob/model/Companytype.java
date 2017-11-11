package com.ptit.itjob.model;
// Generated Nov 11, 2017 10:15:30 AM by Hibernate Tools 5.2.6.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Companytype generated by hbm2java
 */
@Entity
@Table(name = "companytype", catalog = "itjob")
public class Companytype implements java.io.Serializable {

	private Integer id;
	private String name;
	private Set<Company> companies = new HashSet<Company>(0);

	public Companytype() {
	}

	public Companytype(String name) {
		this.name = name;
	}

	public Companytype(String name, Set<Company> companies) {
		this.name = name;
		this.companies = companies;
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

	@Column(name = "name", nullable = false)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "companytype")
	public Set<Company> getCompanies() {
		return this.companies;
	}

	public void setCompanies(Set<Company> companies) {
		this.companies = companies;
	}

}
