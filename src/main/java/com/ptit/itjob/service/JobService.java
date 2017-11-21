package com.ptit.itjob.service;

import com.ptit.itjob.dto.response.JobListDto;
import com.ptit.itjob.model.Job;
import org.springframework.data.domain.Page;

public interface JobService {
	Page<JobListDto> findLatest();

	Page<JobListDto> findAll(int page);

	Page<JobListDto> findByCompany(Integer companyId, int page);

	Job findById(Integer id);
}
