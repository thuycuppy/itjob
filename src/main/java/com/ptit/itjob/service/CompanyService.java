package com.ptit.itjob.service;

import com.ptit.itjob.dto.response.CompanyDetailDto;
import com.ptit.itjob.dto.response.CompanyListDto;
import com.ptit.itjob.model.Company;
import org.springframework.data.domain.Page;

public interface CompanyService {
	Page<CompanyListDto> findTop();

	Page<CompanyListDto> findAll(int page);

	Page<CompanyListDto> findByName(String name, int page);

	CompanyDetailDto findById(Integer id);
}
