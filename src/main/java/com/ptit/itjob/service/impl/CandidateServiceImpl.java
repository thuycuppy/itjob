package com.ptit.itjob.service.impl;

import com.ptit.itjob.common.DateUtil;
import com.ptit.itjob.common.FileUtil;
import com.ptit.itjob.model.Candidate;
import com.ptit.itjob.repository.CandidateRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ptit.itjob.dto.request.CandidateRegisterReq;
import com.ptit.itjob.model.Account;
import com.ptit.itjob.repository.AccountRepository;
import com.ptit.itjob.service.CandidateService;
import com.ptit.itjob.common.Constant;
import org.springframework.web.multipart.MultipartFile;

@Service
public class CandidateServiceImpl implements CandidateService {
	private AccountRepository accountRepository;
	private CandidateRepository candidateRepository;
	private PasswordEncoder passwordEncoder;

	@Autowired
	public CandidateServiceImpl(AccountRepository accountRepository, CandidateRepository candidateRepository, PasswordEncoder passwordEncoder) {
		this.accountRepository = accountRepository;
		this.candidateRepository = candidateRepository;
		this.passwordEncoder = passwordEncoder;
	}

	@Override
	@Transactional
	public void register(CandidateRegisterReq registerDto, MultipartFile resume) {
		// Insert into account table
		Account account = new Account();
		account.setName(registerDto.getName());
		account.setEmail(registerDto.getEmail());
		account.setPassword(passwordEncoder.encode(registerDto.getPassword()));
		account.setAvatar(Constant.DEFAULT_AVATAR);
		account.setRole(Constant.ROLE_CANDIDATE);
		accountRepository.save(account);

		// Insert into candidate table
		Candidate candidate = new Candidate();
		candidate.setName(registerDto.getName());
		candidate.setDob(DateUtil.convertStringToDate(registerDto.getDob(), Constant.DF_YYYY_MM_DD_DASH));
		candidate.setPhone(registerDto.getPhone());
		candidate.setSex(registerDto.isSex());
		candidate.setAddress(registerDto.getAddress());
		candidate.setAccount(account);

		// Upload resume
		if (resume != null) {
			String fileName = FileUtil.upload(resume, Constant.UPLOAD_CANDIDATE_RESUME_DIRECTORY);
			if (fileName != null) {
				candidate.setResume(Constant.UPLOAD_CANDIDATE_RESUME_PATH + fileName);
			}
		}

		candidateRepository.save(candidate);
	}
}
