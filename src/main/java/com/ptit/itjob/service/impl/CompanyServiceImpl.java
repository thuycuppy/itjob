package com.ptit.itjob.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ptit.itjob.model.Company;
import com.ptit.itjob.repository.CompanyRepository;
import com.ptit.itjob.service.CompanyService;

@Service
public class CompanyServiceImpl implements CompanyService {

	@Autowired
	private CompanyRepository companyRepository;
	
	@Override
	@Transactional(readOnly = true)
	public List<Company> findTopCompanies() {
		return companyRepository.findTop6ByOrderByJobsDesc();
	}

}
