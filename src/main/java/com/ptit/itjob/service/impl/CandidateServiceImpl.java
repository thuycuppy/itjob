package com.ptit.itjob.service.impl;

import com.ptit.itjob.common.DateUtil;
import com.ptit.itjob.common.FileUtil;
import com.ptit.itjob.dto.response.ApplicationRes;
import com.ptit.itjob.model.Candidate;
import com.ptit.itjob.repository.ApplicationRepository;
import com.ptit.itjob.repository.CandidateRepository;
import com.ptit.itjob.security.CustomUserDetails;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ptit.itjob.dto.request.CandidateRegisterReq;
import com.ptit.itjob.model.Account;
import com.ptit.itjob.repository.AccountRepository;
import com.ptit.itjob.service.CandidateService;
import com.ptit.itjob.common.Constant;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
public class CandidateServiceImpl implements CandidateService {
	private AccountRepository accountRepository;
	private ApplicationRepository applicationRepository;
	private CandidateRepository candidateRepository;
	private PasswordEncoder passwordEncoder;

	@Autowired
	public CandidateServiceImpl(AccountRepository accountRepository, ApplicationRepository applicationRepository, CandidateRepository candidateRepository, PasswordEncoder passwordEncoder) {
		this.accountRepository = accountRepository;
		this.applicationRepository = applicationRepository;
		this.candidateRepository = candidateRepository;
		this.passwordEncoder = passwordEncoder;
	}

	@Override
	@Transactional(readOnly = true)
	public Candidate findCurrent() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		return userDetails.getCandidate();
	}

	@Override
	@Transactional(readOnly = true)
	public Page<ApplicationRes> findApplication(Integer page) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
		Candidate candidate = userDetails.getCandidate();
		PageRequest pageRequest = new PageRequest(page - 1, Constant.APPLIED_JOB_PER_PAGE);
		return applicationRepository.findByCandidateId(candidate.getId(), pageRequest);
	}

	@Override
	@Transactional
	public void create(CandidateRegisterReq registerDto, MultipartFile resume) {
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
