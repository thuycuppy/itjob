package com.ptit.itjob.service.impl;

import java.util.HashSet;
import java.util.Set;

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

    @Autowired
    public UserDetailsServiceImpl(AccountRepository accountRepository) {
        this.accountRepository = accountRepository;
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
        customUserDetails.setAuthorities(grantedAuthorities);
        return customUserDetails;
    }
}
