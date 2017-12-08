package com.ptit.itjob.service.impl;

import java.util.HashSet;
import java.util.Set;

import com.ptit.itjob.common.Constant;
import com.ptit.itjob.repository.CandidateRepository;
import com.ptit.itjob.repository.CompanyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ptit.itjob.model.Account;
import com.ptit.itjob.repository.AccountRepository;
import com.ptit.itjob.security.CustomUserDetails;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
    private AccountRepository accountRepository;
    private CandidateRepository candidateRepository;
    private CompanyRepository companyRepository;

    @Autowired
    public UserDetailsServiceImpl(AccountRepository accountRepository, CandidateRepository candidateRepository, CompanyRepository companyRepository) {
        this.accountRepository = accountRepository;
        this.candidateRepository = candidateRepository;
        this.companyRepository = companyRepository;
    }

    @Override
    @Transactional(readOnly = true)
    public CustomUserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Account account = accountRepository.findByEmail(username);
        if (account == null) {
            throw new UsernameNotFoundException("Account not found");
        }

        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
        grantedAuthorities.add(new SimpleGrantedAuthority(account.getRole()));

        CustomUserDetails customUserDetails = new CustomUserDetails();
        customUserDetails.setAccount(account);
        if (account.getRole().equals(Constant.ROLE_CANDIDATE)) {
            customUserDetails.setCandidate(candidateRepository.findByAccount(account));
        } else {
            customUserDetails.setCompany(companyRepository.findByAccount(account));
        }
        customUserDetails.setAuthorities(grantedAuthorities);
        return customUserDetails;
    }
}
