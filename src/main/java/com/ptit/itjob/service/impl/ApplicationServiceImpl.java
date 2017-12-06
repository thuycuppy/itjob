package com.ptit.itjob.service.impl;

import com.ptit.itjob.common.Constant;
import com.ptit.itjob.dto.response.ApplicationRes;
import com.ptit.itjob.model.Candidate;
import com.ptit.itjob.repository.ApplicationRepository;
import com.ptit.itjob.security.CustomUserDetails;
import com.ptit.itjob.service.ApplicationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ApplicationServiceImpl implements ApplicationService {
    private ApplicationRepository applicationRepository;

    @Autowired
    public ApplicationServiceImpl(ApplicationRepository applicationRepository) {
        this.applicationRepository = applicationRepository;
    }

    @Override
    @Transactional(readOnly = true)
    public Page<ApplicationRes> findByCurrentCandidate(Integer page) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
        Candidate candidate = userDetails.getCandidate();
        PageRequest pageRequest = new PageRequest(page - 1, Constant.APPLICATION_PER_PAGE);
        return applicationRepository.findByCandidateId(candidate.getId(), pageRequest);
    }

    @Override
    public Page<ApplicationRes> findByJob(Integer jobId, Integer page) {
        PageRequest pageRequest = new PageRequest(page - 1, Constant.APPLICATION_PER_PAGE);
        return applicationRepository.findByJobId(jobId, pageRequest);
    }
}
