package com.ptit.itjob.dto.response;

import java.io.Serializable;

public class JobListDto implements Serializable {
    private static final long serialVersionUID = 4595634959863992395L;
    private Integer jobId;
    private String title;
    private int salary;
    private String description;
    private Integer companyId;
    private String companyLogo;
    private String companyName;
    private String jobTypeName;

    public JobListDto() {
    }

    public JobListDto(Integer jobId, String title, int salary, String description, Integer companyId, String companyLogo, String companyName, String jobTypeName) {
        this.jobId = jobId;
        this.title = title;
        this.salary = salary;
        this.description = description;
        this.companyId = companyId;
        this.companyLogo = companyLogo;
        this.companyName = companyName;
        this.jobTypeName = jobTypeName;
    }

    public Integer getJobId() {
        return jobId;
    }

    public void setJobId(Integer jobId) {
        this.jobId = jobId;
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

    public String getJobTypeName() {
        return jobTypeName;
    }

    public void setJobTypeName(String jobTypeName) {
        this.jobTypeName = jobTypeName;
    }
}
