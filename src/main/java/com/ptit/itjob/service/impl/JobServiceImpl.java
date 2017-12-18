package com.ptit.itjob.service.impl;

import com.ptit.itjob.common.Constant;
import com.ptit.itjob.common.Session;
import com.ptit.itjob.dto.request.PostJobReq;
import com.ptit.itjob.dto.response.CompanyJobRes;
import com.ptit.itjob.dto.response.ExpectedJobRes;
import com.ptit.itjob.dto.response.JobListRes;
import com.ptit.itjob.dto.response.JobSearchRes;
import com.ptit.itjob.model.Candidate;
import com.ptit.itjob.model.Company;
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

import java.util.Date;
import java.util.List;

@Service
public class JobServiceImpl implements JobService {
	private JobRepository jobRepository;
	private Session session;
	private ModelMapper modelMapper;

	@Autowired
	public JobServiceImpl(JobRepository jobRepository, Session session, ModelMapper modelMapper) {
		this.jobRepository = jobRepository;
		this.session = session;
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
	public Page<ExpectedJobRes> findExpected(Integer page) {
		Candidate currentCandidate = session.getCurrentCandidate();
		PageRequest pageRequest = new PageRequest(page - 1, Constant.ACTIVE_JOB_PER_PAGE, new Sort(Sort.Direction.DESC, "createdAt"));
		Page<Job> jobs = jobRepository.findExpected(currentCandidate.getLocation(), currentCandidate.getJobType(),
				currentCandidate.getExperience(), currentCandidate.getExpectedSalary(), pageRequest);
		return jobs.map(this::convertJobToExpectedJobRes);
	}

	@Override
	@Transactional(readOnly = true)
	public Page<CompanyJobRes> findByCurrentCompany(Integer page) {
		Company currentCompany = session.getCurrentCompany();
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

	@Override
	@Transactional
	public void create(PostJobReq req) {
		Job job = modelMapper.map(req, Job.class);
		job.setCompany(session.getCurrentCompany());
		job.setCreatedAt(new Date());
		jobRepository.save(job);
	}

	private JobListRes convertJobToJobListRes(Job job) {
		JobListRes res = modelMapper.map(job, JobListRes.class);
		res.setCompanyId(job.getCompany().getId());
		res.setCompanyName(job.getCompany().getName());
		res.setCompanyLogo(job.getCompany().getLogo());
		res.setJobType(job.getJobType().getName());
		return res;
	}

	private ExpectedJobRes convertJobToExpectedJobRes(Job job) {
		ExpectedJobRes res = new ExpectedJobRes();
		res.setId(job.getId());
		res.setTitle(job.getTitle());
		res.setCompanyId(job.getCompany().getId());
		res.setCompanyName(job.getCompany().getName());
		return res;
	}

	private CompanyJobRes convertJobToCompanyJobRes(Job job) {
		return modelMapper.map(job, CompanyJobRes.class);
	}
}
