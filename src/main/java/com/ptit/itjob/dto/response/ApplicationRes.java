package com.ptit.itjob.dto.response;

import java.io.Serializable;
import java.util.Date;

public class ApplicationRes implements Serializable {
    private static final long serialVersionUID = 4092259897635025682L;
    private String candidateName;
    private String candidateResume;
    private Integer companyId;
    private String companyName;
    private Integer jobId;
    private String jobTitle;
    private Date createdAt;

    public ApplicationRes() {
    }

    public ApplicationRes(String candidateName, String candidateResume, Integer companyId, String companyName, Integer jobId, String jobTitle, Date createdAt) {
        this.candidateName = candidateName;
        this.candidateResume = candidateResume;
        this.companyId = companyId;
        this.companyName = companyName;
        this.jobId = jobId;
        this.jobTitle = jobTitle;
        this.createdAt = createdAt;
    }

    public String getCandidateName() {
        return candidateName;
    }

    public void setCandidateName(String candidateName) {
        this.candidateName = candidateName;
    }

    public String getCandidateResume() {
        return candidateResume;
    }

    public void setCandidateResume(String candidateResume) {
        this.candidateResume = candidateResume;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public Integer getJobId() {
        return jobId;
    }

    public void setJobId(Integer jobId) {
        this.jobId = jobId;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
}
