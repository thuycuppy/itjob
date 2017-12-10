package com.ptit.itjob.model;

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

@Entity
@Table(name = "account", catalog = "itjob")
public class Account implements java.io.Serializable {

	private static final long serialVersionUID = -2914371033814744534L;
	private Integer id;
	private String name;
	private String password;
	private String email;
	private String role;
	private String image;
	private Set<Candidate> candidates = new HashSet<Candidate>(0);
	private Set<Company> companies = new HashSet<Company>(0);

	public Account() {
	}

	public Account(String name, String password, String email, String role) {
		this.name = name;
		this.password = password;
		this.email = email;
		this.role = role;
	}

	public Account(String name, String password, String email, String role, String image, Set<Candidate> candidates,
			Set<Company> companies) {
		this.name = name;
		this.password = password;
		this.email = email;
		this.role = role;
		this.image = image;
		this.candidates = candidates;
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

	@Column(name = "name", nullable = false, length = 50)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "password", nullable = false, length = 60)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "email", nullable = false)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "role", nullable = false, length = 50)
	public String getRole() {
		return this.role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@Column(name = "image")
	public String getImage() {
		return this.image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "account")
	public Set<Candidate> getCandidates() {
		return this.candidates;
	}

	public void setCandidates(Set<Candidate> candidates) {
		this.candidates = candidates;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "account")
	public Set<Company> getCompanies() {
		return this.companies;
	}

	public void setCompanies(Set<Company> companies) {
		this.companies = companies;
	}

}
