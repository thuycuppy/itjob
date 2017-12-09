package com.ptit.itjob.repository;

import com.ptit.itjob.model.JobType;
import org.springframework.data.repository.CrudRepository;

public interface JobTypeRepository extends CrudRepository<JobType, Integer> {
}
