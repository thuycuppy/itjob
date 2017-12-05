package com.ptit.itjob.service;

import com.ptit.itjob.dto.request.CompanyRegisterReq;
import com.ptit.itjob.dto.response.CompanyDetailRes;
import com.ptit.itjob.dto.response.CompanyListRes;
import com.ptit.itjob.dto.response.CompanySearchRes;
import org.springframework.data.domain.Page;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface CompanyService {
	Page<CompanyListRes> findAll(int page);

	Page<CompanyListRes> findTop();

	List<CompanySearchRes> findByName(String name);

	CompanyDetailRes findById(Integer id);

	void create(CompanyRegisterReq registerDto, MultipartFile resume);
}
