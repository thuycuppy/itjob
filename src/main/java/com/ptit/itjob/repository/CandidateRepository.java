package com.ptit.itjob.repository;

import com.ptit.itjob.model.Account;
import com.ptit.itjob.model.Candidate;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface CandidateRepository extends CrudRepository<Candidate, Integer> {
    @Query("select c from Candidate c left join fetch c.jobType left join fetch c.location left join fetch c.experience left join fetch c.skills " +
            "where c.account = ?1")
    Candidate findByAccount(Account account);
}
