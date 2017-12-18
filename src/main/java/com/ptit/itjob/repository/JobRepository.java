package com.ptit.itjob.repository;

import com.ptit.itjob.dto.response.JobSearchRes;
import com.ptit.itjob.model.Experience;
import com.ptit.itjob.model.Job;
import com.ptit.itjob.model.JobType;
import com.ptit.itjob.model.Location;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

public interface JobRepository extends PagingAndSortingRepository<Job, Integer> {
	@Query(value = "select j from Job j left join fetch j.company left join fetch j.jobType",
			countQuery = "select count(j) from Job j")
	Page<Job> findAll(Pageable pageable);

	@Query(value = "select j from Job j left join fetch j.company left join fetch j.jobType where j.company.id = ?1",
			countQuery = "select count(j) from Job j where j.company.id = ?1")
	Page<Job> findByCompanyId(Integer companyId, Pageable pageable);

	@Query(value = "select j from Job j left join fetch j.company where j.location = ?1 or j.jobType = ?2 or j.experience = ?3 or j.salary = ?4",
			countQuery = "select count(j) from Job j where j.location = ?1 or j.jobType = ?2 or j.experience = ?3 or j.salary = ?4")
	Page<Job> findExpected(Location location, JobType jobType, Experience experience, Integer salary, Pageable pageable);

	List<JobSearchRes> findFirst5ByTitleContaining(String term);

	List<JobSearchRes> findFirst5ByTitleContainingAndLocationId(String term, Integer locationId);
}
