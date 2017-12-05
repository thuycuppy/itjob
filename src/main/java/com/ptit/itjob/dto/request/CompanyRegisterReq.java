package com.ptit.itjob.dto.request;

import com.ptit.itjob.model.CompanyType;
import com.ptit.itjob.model.Location;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class CompanyRegisterReq extends RegisterReq {
    private CompanyType companyType;

    @NotEmpty
    @Length(max = 45)
    private String quantity;

    private Location location;

    @NotEmpty
    @Length(max = 255)
    private String address;

    @Length(max = 255)
    private String website;

    @NotEmpty
    @Length(max = 20)
    private String phone;

    @Length(max = 500)
    private String description;

    public CompanyRegisterReq() {
    }

    public CompanyRegisterReq(String name, String email, String password, String confirmPassword, CompanyType companyType, String quantity, Location location, String address, String website, String phone, String description) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.confirmPassword = confirmPassword;
        this.companyType = companyType;
        this.quantity = quantity;
        this.location = location;
        this.address = address;
        this.website = website;
        this.phone = phone;
        this.description = description;
    }

    public CompanyType getCompanyType() {
        return companyType;
    }

    public void setCompanyType(CompanyType companyType) {
        this.companyType = companyType;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public Location getLocation() {
        return location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
