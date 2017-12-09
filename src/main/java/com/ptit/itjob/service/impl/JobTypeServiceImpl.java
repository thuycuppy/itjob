package com.ptit.itjob.service.impl;

import com.ptit.itjob.model.JobType;
import com.ptit.itjob.repository.JobTypeRepository;
import com.ptit.itjob.service.JobTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JobTypeServiceImpl implements JobTypeService {
    private JobTypeRepository jobTypeRepository;

    @Autowired
    public JobTypeServiceImpl(JobTypeRepository jobTypeRepository) {
        this.jobTypeRepository = jobTypeRepository;
    }

    @Override
    public Iterable<JobType> findAll() {
        return jobTypeRepository.findAll();
    }
}
