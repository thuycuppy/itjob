package com.ptit.itjob.dto.response;

import java.io.Serializable;

public class CompanyListDto implements Serializable {
    private static final long serialVersionUID = 8445046521195282012L;
    private Integer id;
    private String name;
    private String logo;
    private String address;
    private int totalJobs;

    public CompanyListDto() {
    }

    public CompanyListDto(Integer id, String name, String logo, String address, int totalJobs) {
        this.id = id;
        this.name = name;
        this.logo = logo;
        this.address = address;
        this.totalJobs = totalJobs;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getTotalJobs() {
        return totalJobs;
    }

    public void setTotalJobs(int totalJobs) {
        this.totalJobs = totalJobs;
    }
}
