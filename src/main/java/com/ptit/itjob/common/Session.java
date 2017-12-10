package com.ptit.itjob.common;

import com.ptit.itjob.dto.request.CandidateEditProfileReq;
import com.ptit.itjob.dto.request.CompanyEditProfileReq;
import com.ptit.itjob.model.Candidate;
import com.ptit.itjob.model.Company;
import com.ptit.itjob.security.CustomUserDetails;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Component
public class Session {
    private ModelMapper modelMapper;

    @Autowired
    public Session(ModelMapper modelMapper) {
        this.modelMapper = modelMapper;
    }

    public Candidate getCurrentCandidate() {
        return getUserDetails().getCandidate();
    }

    public CandidateEditProfileReq getCurrentCandidateEditProfileReq() {
        return modelMapper.map(getUserDetails().getCandidate(), CandidateEditProfileReq.class);
    }

    public Company getCurrentCompany() {
        return getUserDetails().getCompany();
    }

    public CompanyEditProfileReq getCurrentCompanyEditProfileReq() {
        return modelMapper.map(getUserDetails().getCompany(), CompanyEditProfileReq.class);
    }

    private static CustomUserDetails getUserDetails() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return (CustomUserDetails) authentication.getPrincipal();
    }
}
