package com.ptit.itjob.repository;

import com.ptit.itjob.model.Account;
import com.ptit.itjob.model.Candidate;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

public interface CandidateRepository extends CrudRepository<Candidate, Integer> {
    Candidate findByAccount(Account account);
}
