package com.ptit.itjob.service;

import com.ptit.itjob.dto.response.JobListDto;
import org.springframework.data.domain.Page;

public interface JobService {
	Page<JobListDto> findLatest();

	Page<JobListDto> findByCompany(Integer companyId, int page);
}
