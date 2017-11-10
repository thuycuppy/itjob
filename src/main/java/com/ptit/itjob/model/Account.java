package com.ptit.itjob.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "account")
public class Account implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "accountID")
	private Integer accountID;
	
	@Column(name = "name", length = 100)
	private String name;
	
	@Column(name = "password", length = 60)
	private String password;
	
	@Column(name = "email", length = 255)
	private String email;
	
	@Column(name = "role", length = 50)
	private String role;
	
	@Column(name = "avatar", length = 255)
	private String avatar;
	
	public Account() {
		// TODO Auto-generated constructor stub
	}

	public Account(Integer accountID, String name, String password, String email, String role, String avatar) {
		super();
		this.accountID = accountID;
		this.name = name;
		this.password = password;
		this.email = email;
		this.role = role;
		this.avatar = avatar;
	}

	public Integer getAccountID() {
		return accountID;
	}

	public void setAccountID(Integer accountID) {
		this.accountID = accountID;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
