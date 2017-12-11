package com.ptit.itjob.dto.request;

import com.ptit.itjob.model.CompanyType;
import com.ptit.itjob.model.Location;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import java.io.Serializable;

public class CompanyEditProfileReq implements Serializable {
    private static final long serialVersionUID = -9213501200902987624L;

    @NotEmpty
    @Length(max = 50)
    protected String name;

    @NotEmpty
    @Length(max = 45)
    private String quantity;

    private CompanyType companyType;

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

    public CompanyEditProfileReq() {
    }

    public CompanyEditProfileReq(String name, String quantity, CompanyType companyType, Location location, String address, String website, String phone, String description) {
        this.name = name;
        this.quantity = quantity;
        this.companyType = companyType;
        this.location = location;
        this.address = address;
        this.website = website;
        this.phone = phone;
        this.description = description;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public CompanyType getCompanyType() {
        return companyType;
    }

    public void setCompanyType(CompanyType companyType) {
        this.companyType = companyType;
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
