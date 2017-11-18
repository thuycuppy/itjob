package com.ptit.itjob.service.impl;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ptit.itjob.dto.RegisterDto;
import com.ptit.itjob.model.Account;
import com.ptit.itjob.repository.AccountRepository;
import com.ptit.itjob.service.ProfileService;
import com.ptit.itjob.util.Constant;

@Service
public class ProfileServiceImpl implements ProfileService {
	@Autowired
	private AccountRepository accountRepository;
	@Autowired
	private ModelMapper modelMapper;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	@Transactional
	public void register(RegisterDto registerDto) {
		Account account = modelMapper.map(registerDto, Account.class);
		account.setPassword(passwordEncoder.encode(registerDto.getPassword()));
		account.setAvatar(Constant.DEFAULT_AVATAR);
		accountRepository.save(account);
	}
}
