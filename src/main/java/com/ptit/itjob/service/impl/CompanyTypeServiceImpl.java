package com.ptit.itjob.service.impl;

import com.ptit.itjob.model.CompanyType;
import com.ptit.itjob.repository.CompanyTypeRepository;
import com.ptit.itjob.service.CompanyTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CompanyTypeServiceImpl implements CompanyTypeService {
    private CompanyTypeRepository companyTypeRepository;

    @Autowired
    public CompanyTypeServiceImpl(CompanyTypeRepository companyTypeRepository) {
        this.companyTypeRepository = companyTypeRepository;
    }

    @Override
    @Transactional(readOnly = true)
    public Iterable<CompanyType> findAll() {
        return companyTypeRepository.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public CompanyType findOne(Integer id) {
        return companyTypeRepository.findOne(id);
    }
}
