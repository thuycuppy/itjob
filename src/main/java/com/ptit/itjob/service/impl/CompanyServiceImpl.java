package com.ptit.itjob.service.impl;

import com.ptit.itjob.common.Constant;
import com.ptit.itjob.dto.response.CompanyDetailRes;
import com.ptit.itjob.dto.response.CompanyListRes;
import com.ptit.itjob.dto.response.CompanySearchRes;
import com.ptit.itjob.model.Company;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ptit.itjob.repository.CompanyRepository;
import com.ptit.itjob.service.CompanyService;

import java.util.List;

@Service
public class CompanyServiceImpl implements CompanyService {
	private CompanyRepository companyRepository;
	private ModelMapper modelMapper;

	@Autowired
	public CompanyServiceImpl(CompanyRepository companyRepository, ModelMapper modelMapper) {
		this.companyRepository = companyRepository;
		this.modelMapper = modelMapper;
	}

	@Override
	@Transactional(readOnly = true)
	public Page<CompanyListRes> findTop() {
		PageRequest pageRequest = new PageRequest(0, Constant.COMPANY_HOME, new Sort(Sort.Direction.DESC, "jobs.size"));
		Page<Company> companies = companyRepository.findAll(pageRequest);
		return companies.map(this::convertToCompanyListDto);
	}

	@Override
	@Transactional(readOnly = true)
	public Page<CompanyListRes> findAll(int page) {
		PageRequest pageRequest = new PageRequest(page, Constant.COMPANY_PER_PAGE);
		Page<Company> companies = companyRepository.findAll(pageRequest);
		return companies.map(this::convertToCompanyListDto);
	}

	@Override
	@Transactional(readOnly = true)
	public List<CompanySearchRes> findByName(String name) {
		return companyRepository.findFirst5ByNameContaining(name);
	}

	@Override
	public CompanyDetailRes findById(Integer id) {
		return convertToCompanyDetailDto(companyRepository.findOneById(id));
	}

	private CompanyListRes convertToCompanyListDto(Company company) {
		CompanyListRes dto = modelMapper.map(company, CompanyListRes.class);
		dto.setTotalJobs(company.getJobs().size());
		return dto;
	}

	private CompanyDetailRes convertToCompanyDetailDto(Company company) {
		CompanyDetailRes dto = modelMapper.map(company, CompanyDetailRes.class);
		dto.setCompanyType(company.getCompanyType().getName());
		dto.setLocation(company.getLocation().getName());
		return dto;
	}
}
