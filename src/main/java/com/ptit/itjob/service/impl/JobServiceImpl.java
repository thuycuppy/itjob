package com.ptit.itjob.service.impl;

import com.ptit.itjob.common.Constant;
import com.ptit.itjob.dto.response.CompanyJobRes;
import com.ptit.itjob.dto.response.JobListRes;
import com.ptit.itjob.dto.response.JobSearchRes;
import com.ptit.itjob.model.Company;
import com.ptit.itjob.model.Job;
import com.ptit.itjob.security.CustomUserDetails;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ptit.itjob.repository.JobRepository;
import com.ptit.itjob.service.JobService;

import java.util.List;

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
	public Page<JobListRes> findAll(int page) {
		PageRequest pageRequest = new PageRequest(page, Constant.JOB_PER_PAGE, new Sort(Sort.Direction.DESC, "createdAt"));
		Page<Job> jobs = jobRepository.findAll(pageRequest);
		return jobs.map(this::convertJobToJobListRes);
	}

	@Override
	@Transactional(readOnly = true)
	public Page<JobListRes> findLatest() {
		PageRequest pageRequest = new PageRequest(0, Constant.JOB_HOME, new Sort(Sort.Direction.DESC, "createdAt"));
		Page<Job> jobs = jobRepository.findAll(pageRequest);
		return jobs.map(this::convertJobToJobListRes);
	}

	@Override
	@Transactional(readOnly = true)
	public Page<JobListRes> findByCompany(Integer companyId, Integer page) {
		PageRequest pageRequest = new PageRequest(page, Constant.COMPANY_JOB_PER_PAGE, new Sort(Sort.Direction.DESC, "createdAt"));
		Page<Job> jobs = jobRepository.findByCompanyId(companyId, pageRequest);
		return jobs.map(this::convertJobToJobListRes);
	}

	@Override
	@Transactional(readOnly = true)
	public Page<CompanyJobRes> findByCurrentCompany(Integer page) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		Company currentCompany = userDetails.getCompany();
		PageRequest pageRequest = new PageRequest(page - 1, Constant.ACTIVE_JOB_PER_PAGE, new Sort(Sort.Direction.DESC, "createdAt"));
		Page<Job> jobs = jobRepository.findByCompanyId(currentCompany.getId(), pageRequest);
		return jobs.map(this::convertJobToCompanyJobRes);
	}

	@Override
	@Transactional(readOnly = true)
	public List<JobSearchRes> findByTitle(String title) {
		return jobRepository.findFirst5ByTitleContaining(title);
	}

	@Override
	@Transactional(readOnly = true)
	public List<JobSearchRes> findByTitleAndLocation(String title, Integer locationId) {
		return jobRepository.findFirst5ByTitleContainingAndLocationId(title, locationId);
	}

	@Override
	@Transactional(readOnly = true)
	public Job findById(Integer id) {
		return jobRepository.findOne(id);
	}

	private JobListRes convertJobToJobListRes(Job job) {
		JobListRes res = modelMapper.map(job, JobListRes.class);
		res.setCompanyId(job.getCompany().getId());
		res.setCompanyName(job.getCompany().getName());
		res.setCompanyLogo(job.getCompany().getLogo());
		res.setJobType(job.getJobType().getName());
		return res;
	}

	private CompanyJobRes convertJobToCompanyJobRes(Job job) {
		return modelMapper.map(job, CompanyJobRes.class);
	}
}