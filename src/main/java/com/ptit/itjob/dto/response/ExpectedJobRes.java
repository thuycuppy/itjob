package com.ptit.itjob.dto.response;

import java.io.Serializable;

public class ExpectedJobRes implements Serializable {
    private static final long serialVersionUID = -2543874482601844283L;
    private Integer id;
    private String title;
    private Integer companyId;
    private String companyName;

    public ExpectedJobRes() {
    }

    public ExpectedJobRes(Integer id, String title, Integer companyId, String companyName) {
        this.id = id;
        this.title = title;
        this.companyId = companyId;
        this.companyName = companyName;
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
}
