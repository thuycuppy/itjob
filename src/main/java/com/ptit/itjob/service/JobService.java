package com.ptit.itjob.service;

import java.util.List;

import com.ptit.itjob.model.Job;

public interface JobService {
	List<Job> findLatestJobs();
}
