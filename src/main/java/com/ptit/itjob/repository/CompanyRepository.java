package com.ptit.itjob.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.ptit.itjob.model.Company;

public interface CompanyRepository extends CrudRepository<Company, Integer> {
	List<Company> findTop6ByOrderByJobsDesc();
}
