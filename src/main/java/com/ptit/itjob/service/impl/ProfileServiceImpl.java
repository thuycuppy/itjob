package com.ptit.itjob.service.impl;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ptit.itjob.dto.request.RegisterDto;
import com.ptit.itjob.model.Account;
import com.ptit.itjob.repository.AccountRepository;
import com.ptit.itjob.service.ProfileService;
import com.ptit.itjob.common.Constant;

@Service
public class ProfileServiceImpl implements ProfileService {
	private AccountRepository accountRepository;
	private ModelMapper modelMapper;
	private PasswordEncoder passwordEncoder;

	@Autowired
	public ProfileServiceImpl(AccountRepository accountRepository, ModelMapper modelMapper, PasswordEncoder passwordEncoder) {
		this.accountRepository = accountRepository;
		this.modelMapper = modelMapper;
		this.passwordEncoder = passwordEncoder;
	}

	@Override
	@Transactional
	public void register(RegisterDto registerDto) {
		Account account = modelMapper.map(registerDto, Account.class);
		account.setPassword(passwordEncoder.encode(registerDto.getPassword()));
		account.setAvatar(Constant.DEFAULT_AVATAR);
		accountRepository.save(account);
	}
}
