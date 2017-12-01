package com.ptit.itjob.dto.response;

import java.io.Serializable;

public class CompanyDetailRes implements Serializable {
    private static final long serialVersionUID = 120635732328388901L;
    private Integer id;
    private String companyType;
    private String name;
    private String quantity;
    private String website;
    private String location;
    private String address;
    private String logo;
    private String description;
    private String phone;

    public CompanyDetailRes() {
    }

    public CompanyDetailRes(Integer id, String companyType, String name, String quantity, String website, String location, String address, String logo, String description, String phone) {
        this.id = id;
        this.companyType = companyType;
        this.name = name;
        this.quantity = quantity;
        this.website = website;
        this.location = location;
        this.address = address;
        this.logo = logo;
        this.description = description;
        this.phone = phone;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCompanyType() {
        return companyType;
    }

    public void setCompanyType(String companyType) {
        this.companyType = companyType;
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

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
