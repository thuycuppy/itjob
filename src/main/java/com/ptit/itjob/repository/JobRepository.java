package com.ptit.itjob.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.ptit.itjob.model.Job;

public interface JobRepository extends CrudRepository<Job, Integer> {
	List<Job> findTop4ByOrderByCreatedAtDesc();
}
