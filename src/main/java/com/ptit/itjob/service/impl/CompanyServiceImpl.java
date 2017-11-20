package com.ptit.itjob.service.impl;

import com.ptit.itjob.common.Constant;
import com.ptit.itjob.dto.response.CompanyDetailDto;
import com.ptit.itjob.dto.response.CompanyListDto;
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
	public Page<CompanyListDto> findAll(int page) {
		PageRequest pageRequest = new PageRequest(page, Constant.COMPANY_PER_PAGE);
		Page<Company> companies = companyRepository.findAll(pageRequest);
		return companies.map(this::convertToCompanyListDto);
	}

	@Override
	@Transactional(readOnly = true)
	public Page<CompanyListDto> findTop() {
		PageRequest pageRequest = new PageRequest(0, 6, new Sort(Sort.Direction.DESC, "jobs"));
		Page<Company> companies = companyRepository.findAll(pageRequest);
		return companies.map(this::convertToCompanyListDto);
	}

	@Override
	public CompanyDetailDto findOne(Integer id) {
		return convertToCompanyDetailDto(companyRepository.findOneById(id));
	}

	private CompanyListDto convertToCompanyListDto(Company company) {
		CompanyListDto dto = modelMapper.map(company, CompanyListDto.class);
		dto.setTotalJobs(company.getJobs().size());
		return dto;
	}

	private CompanyDetailDto convertToCompanyDetailDto(Company company) {
		CompanyDetailDto dto = modelMapper.map(company, CompanyDetailDto.class);
		dto.setCompanyType(company.getCompanyType().getName());
		dto.setLocation(company.getLocation().getName());
		return dto;
	}
}
