package com.ptit.itjob.service.impl;

import com.ptit.itjob.common.DateUtil;
import com.ptit.itjob.common.FileUtil;
import com.ptit.itjob.common.Session;
import com.ptit.itjob.dto.request.CandidateEditProfileReq;
import com.ptit.itjob.model.Candidate;
import com.ptit.itjob.repository.CandidateRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.BeanUtils;
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
	private ModelMapper modelMapper;
	private PasswordEncoder passwordEncoder;
	private Session session;

	@Autowired
	public CandidateServiceImpl(AccountRepository accountRepository, CandidateRepository candidateRepository, ModelMapper modelMapper, PasswordEncoder passwordEncoder, Session session) {
		this.accountRepository = accountRepository;
		this.candidateRepository = candidateRepository;
		this.modelMapper = modelMapper;
		this.passwordEncoder = passwordEncoder;
		this.session = session;
	}

	@Override
	@Transactional(readOnly = true)
	public Candidate findCurrent() {
		return session.getCurrentCandidate();
	}

	@Override
	@Transactional
	public void create(CandidateRegisterReq req, MultipartFile resume) {
		// Insert into account table
		Account account = modelMapper.map(req, Account.class);
		account.setPassword(passwordEncoder.encode(req.getPassword()));
		account.setImage(Constant.DEFAULT_AVATAR);
		account.setRole(Constant.ROLE_CANDIDATE);
		accountRepository.save(account);

		// Insert into candidate table
		Candidate candidate = modelMapper.map(req, Candidate.class);
		candidate.setDob(DateUtil.convertStringToDate(req.getDob(), Constant.DF_YYYY_MM_DD_DASH));
		candidate.setAvatar(Constant.DEFAULT_AVATAR);
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

	@Override
	@Transactional
	public void update(CandidateEditProfileReq req, MultipartFile avatar, MultipartFile resume) {
		Candidate candidate = session.getCurrentCandidate();
		BeanUtils.copyProperties(req, candidate);

		// Update candidate table
		candidate.setDob(DateUtil.convertStringToDate(req.getDob(), Constant.DF_YYYY_MM_DD_DASH));

		// Upload avatar
		if (avatar != null) {
			String fileName = FileUtil.upload(avatar, Constant.UPLOAD_CANDIDATE_AVATAR_DIRECTORY);
			if (fileName != null) {
				candidate.setAvatar(Constant.UPLOAD_CANDIDATE_AVATAR_PATH + fileName);

				// Update account table
				Account account = candidate.getAccount();
				account.setName(candidate.getName());
				account.setImage(candidate.getAvatar());
				accountRepository.save(account);
			}
		}

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
