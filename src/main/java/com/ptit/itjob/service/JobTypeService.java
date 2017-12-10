package com.ptit.itjob.service;

import com.ptit.itjob.model.JobType;

public interface JobTypeService {
    Iterable<JobType> findAll();

    JobType findOne(Integer id);
}
