package com.ptit.itjob.dto.request;

import javax.persistence.Transient;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class RegisterDto {
	@NotEmpty
	@Length(max = 100)
	private String name;
	
	@NotEmpty
	@Length(min = 6)
	private String password;
	
	@Transient
    @NotEmpty
    private String confirmPassword;
	
	@NotEmpty
	@Email
	private String email;
	
	private String role;
	
	public RegisterDto() {
		// TODO Auto-generated constructor stub
	}

	public RegisterDto(String name, String password, String confirmPassword, String email, String role) {
		super();
		this.name = name;
		this.password = password;
		this.confirmPassword = confirmPassword;
		this.email = email;
		this.role = role;
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

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
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
	
}
