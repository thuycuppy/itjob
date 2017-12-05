package com.ptit.itjob.service.impl;

import com.ptit.itjob.common.Constant;
import com.ptit.itjob.model.Candidate;
import com.ptit.itjob.model.Company;
import com.ptit.itjob.repository.CandidateRepository;
import com.ptit.itjob.repository.CompanyRepository;
import com.ptit.itjob.security.CustomUserDetails;
import com.ptit.itjob.service.SecurityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Service
public class SecurityServiceImpl implements SecurityService {

    @Override
    public void logout(HttpServletRequest request, HttpServletResponse response) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
            new SecurityContextLogoutHandler().logout(request, response, authentication);
        }
    }

}
