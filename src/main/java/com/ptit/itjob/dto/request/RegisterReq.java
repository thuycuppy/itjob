package com.ptit.itjob.dto.request;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.Transient;

public class RegisterReq {
    @NotEmpty
    @Length(max = 50)
    protected String name;

    @NotEmpty
    @Email
    protected String email;

    @NotEmpty
    @Length(min = 6)
    protected String password;

    @Transient
    @NotEmpty
    protected String confirmPassword;

    public RegisterReq() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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
}
