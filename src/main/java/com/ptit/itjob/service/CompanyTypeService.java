package com.ptit.itjob.service;

import com.ptit.itjob.model.CompanyType;

public interface CompanyTypeService {
    Iterable<CompanyType> findAll();

    CompanyType findOne(Integer id);
}
