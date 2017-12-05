package com.ptit.itjob.service;

import com.ptit.itjob.dto.request.CandidateRegisterReq;
import com.ptit.itjob.model.Candidate;
import org.springframework.web.multipart.MultipartFile;

public interface CandidateService {
	Candidate findCurrent();

	void create(CandidateRegisterReq registerDto, MultipartFile resume);
}
