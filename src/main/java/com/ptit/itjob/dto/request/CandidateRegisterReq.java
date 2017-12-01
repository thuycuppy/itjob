package com.ptit.itjob.dto.request;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class CandidateRegisterReq extends RegisterReq {
	@NotEmpty
	@Length(max = 10)
	private String dob;

	@NotEmpty
	@Length(max = 20)
	private String phone;

	private boolean sex;

	@NotEmpty
	@Length(max = 255)
	private String address;

	public CandidateRegisterReq() {
		// TODO Auto-generated constructor stub
	}

	public CandidateRegisterReq(String name, String email, String password, String confirmPassword, String dob, String phone, boolean sex, String address) {
		this.name = name;
		this.email = email;
		this.password = password;
		this.confirmPassword = confirmPassword;
		this.dob = dob;
		this.phone = phone;
		this.sex = sex;
		this.address = address;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public boolean isSex() {
		return sex;
	}

	public void setSex(boolean sex) {
		this.sex = sex;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
}
