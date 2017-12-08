package com.ptit.itjob.service;

import com.ptit.itjob.dto.request.CandidateRegisterReq;
import com.ptit.itjob.dto.response.ApplicationRes;
import com.ptit.itjob.model.Candidate;
import org.springframework.data.domain.Page;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface CandidateService {
	Candidate findCurrent();

	void create(CandidateRegisterReq registerDto, MultipartFile resume);
}
