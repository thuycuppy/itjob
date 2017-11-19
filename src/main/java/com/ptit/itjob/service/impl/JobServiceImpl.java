package com.ptit.itjob.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ptit.itjob.model.Job;
import com.ptit.itjob.repository.JobRepository;
import com.ptit.itjob.service.JobService;

@Service
public class JobServiceImpl implements JobService {

	@Autowired
	private JobRepository jobRepository;
	
	@Override
	@Transactional(readOnly = true)
	public List<Job> findLatestJobs() {
		return jobRepository.findTop4ByOrderByCreatedAtDesc();
	}

}
