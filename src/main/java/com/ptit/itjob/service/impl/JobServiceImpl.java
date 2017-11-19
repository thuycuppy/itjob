package com.ptit.itjob.service.impl;

import com.ptit.itjob.common.Constant;
import com.ptit.itjob.dto.response.JobListDto;
import com.ptit.itjob.model.Job;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ptit.itjob.repository.JobRepository;
import com.ptit.itjob.service.JobService;

@Service
public class JobServiceImpl implements JobService {
	private JobRepository jobRepository;
	private ModelMapper modelMapper;

	@Autowired
	public JobServiceImpl(JobRepository jobRepository, ModelMapper modelMapper) {
		this.jobRepository = jobRepository;
		this.modelMapper = modelMapper;
	}

	@Override
	@Transactional(readOnly = true)
	public Page<JobListDto> findLatest() {
		PageRequest pageRequest = new PageRequest(0, 4, new Sort(Sort.Direction.DESC, "createdAt"));
		Page<Job> jobs = jobRepository.findAll(pageRequest);
		return jobs.map(this::convertToJobListDto);
	}

	@Override
	public Page<JobListDto> findByCompany(Integer companyId, int page) {
		PageRequest pageRequest = new PageRequest(page, Constant.COMPANY_JOB_PER_PAGE, new Sort(Sort.Direction.DESC, "createdAt"));
		Page<Job> jobs = jobRepository.findByCompanyId(companyId, pageRequest);
		return jobs.map(this::convertToJobListDto);
	}

	private JobListDto convertToJobListDto(Job job) {
		JobListDto dto = modelMapper.map(job, JobListDto.class);
		dto.setCompanyId(job.getCompany().getId());
		dto.setCompanyName(job.getCompany().getName());
		dto.setCompanyLogo(job.getCompany().getLogo());
		dto.setJobTypeName(job.getJobType().getName());
		return dto;
	}
}
