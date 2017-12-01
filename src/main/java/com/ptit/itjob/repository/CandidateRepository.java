package com.ptit.itjob.repository;

import com.ptit.itjob.model.Candidate;
import org.springframework.data.repository.CrudRepository;

public interface CandidateRepository extends CrudRepository<Candidate, Integer> {
}
