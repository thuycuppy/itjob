package com.ptit.itjob.dto.response;

import java.io.Serializable;

public class CompanyJobRes implements Serializable {
    private static final long serialVersionUID = -4949609279369108969L;
    private Integer id;
    private String title;

    public CompanyJobRes() {
    }

    public CompanyJobRes(Integer id, String title) {
        this.id = id;
        this.title = title;
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
}
