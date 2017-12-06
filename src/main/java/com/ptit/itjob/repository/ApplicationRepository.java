package com.ptit.itjob.repository;

import com.ptit.itjob.dto.response.ApplicationRes;
import com.ptit.itjob.model.Application;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

public interface ApplicationRepository extends PagingAndSortingRepository<Application, Integer> {
    @Query("select new com.ptit.itjob.dto.response.ApplicationRes(ca.name, co.id, co.name, j.id, j.title) " +
            "from Application a left join a.candidate ca left join a.job j left join a.job.company co " +
            "where a.candidate.id = ?1")
    Page<ApplicationRes> findByCandidateId(Integer candidateId, Pageable pageable);
}
