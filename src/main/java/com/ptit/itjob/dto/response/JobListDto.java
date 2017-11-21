package com.ptit.itjob.dto.response;

import java.io.Serializable;

public class JobListDto implements Serializable {
    private static final long serialVersionUID = 4595634959863992395L;
    private Integer id;
    private String title;
    private int salary;
    private String description;
    private Integer companyId;
    private String companyLogo;
    private String companyName;
    private String jobType;

    public JobListDto() {
    }

    public JobListDto(Integer id, String title, int salary, String description, Integer companyId, String companyLogo, String companyName, String jobType) {
        this.id = id;
        this.title = title;
        this.salary = salary;
        this.description = description;
        this.companyId = companyId;
        this.companyLogo = companyLogo;
        this.companyName = companyName;
        this.jobType = jobType;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    public String getCompanyLogo() {
        return companyLogo;
    }

    public void setCompanyLogo(String companyLogo) {
        this.companyLogo = companyLogo;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getJobType() {
        return jobType;
    }

    public void setJobType(String jobType) {
        this.jobType = jobType;
    }
}
