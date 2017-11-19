package com.ptit.itjob.repository;

import com.ptit.itjob.model.Job;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface JobRepository extends PagingAndSortingRepository<Job, Integer> {
	@Query(value = "select j from Job j left join fetch j.company left join fetch j.jobType",
			countQuery = "select count(j) from Job j")
	Page<Job> findAll(Pageable pageable);

	@Query(value = "select j from Job j left join fetch j.company left join fetch j.jobType where j.company.id = ?1",
			countQuery = "select count(j) from Job j where j.company.id = ?1")
	Page<Job> findByCompanyId(Integer companyId, Pageable pageable);
}
