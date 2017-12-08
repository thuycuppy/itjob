package com.ptit.itjob.service;

import com.ptit.itjob.dto.response.CompanyJobRes;
import com.ptit.itjob.dto.response.JobListRes;
import com.ptit.itjob.dto.response.JobSearchRes;
import com.ptit.itjob.model.Job;
import org.springframework.data.domain.Page;

import java.util.List;

public interface JobService {
	Page<JobListRes> findAll(int page);

	Page<JobListRes> findLatest();

	Page<JobListRes> findByCompany(Integer companyId, Integer page);

	Page<CompanyJobRes> findByCurrentCompany(Integer page);

	List<JobSearchRes> findByTitle(String title);

	List<JobSearchRes> findByTitleAndLocation(String title, Integer locationId);

	Job findById(Integer id);
}
