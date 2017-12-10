package com.ptit.itjob.service.impl;

import com.ptit.itjob.common.Constant;
import com.ptit.itjob.common.Session;
import com.ptit.itjob.dto.response.ApplicationRes;
import com.ptit.itjob.model.Application;
import com.ptit.itjob.model.Candidate;
import com.ptit.itjob.model.Job;
import com.ptit.itjob.repository.ApplicationRepository;
import com.ptit.itjob.repository.CandidateRepository;
import com.ptit.itjob.repository.JobRepository;
import com.ptit.itjob.service.ApplicationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Service
public class ApplicationServiceImpl implements ApplicationService {
    private ApplicationRepository applicationRepository;
    private CandidateRepository candidateRepository;
    private JobRepository jobRepository;
    private Session session;

    @Autowired
    public ApplicationServiceImpl(ApplicationRepository applicationRepository, CandidateRepository candidateRepository, JobRepository jobRepository, Session session) {
        this.applicationRepository = applicationRepository;
        this.candidateRepository = candidateRepository;
        this.jobRepository = jobRepository;
        this.session = session;
    }

    @Override
    @Transactional(readOnly = true)
    public Page<ApplicationRes> findByCurrentCandidate(Integer page) {
        Candidate candidate = session.getCurrentCandidate();
        PageRequest pageRequest = new PageRequest(page - 1, Constant.APPLICATION_PER_PAGE);
        return applicationRepository.findByCandidateId(candidate.getId(), pageRequest);
    }

    @Override
    @Transactional(readOnly = true)
    public Page<ApplicationRes> findByJob(Integer jobId, Integer page) {
        PageRequest pageRequest = new PageRequest(page - 1, Constant.APPLICATION_PER_PAGE);
        return applicationRepository.findByJobId(jobId, pageRequest);
    }

    @Override
    @Transactional(readOnly = true)
    public boolean isApplied(Integer candidateId, Integer jobId) {
        return (applicationRepository.findByCandidateIdAndJobId(candidateId, jobId) != null);
    }

    @Override
    @Transactional
    public void createApplication(Integer candidateId, Integer jobId) {
        Candidate candidate = candidateRepository.findOne(candidateId);
        Job job = jobRepository.findOne(jobId);
        Date now = new Date();
        Application application = new Application(candidate, job, now);
        applicationRepository.save(application);
    }
}
