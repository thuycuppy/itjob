package com.ptit.itjob.service;

import com.ptit.itjob.dto.request.CandidateRegisterReq;
import org.springframework.web.multipart.MultipartFile;

public interface CandidateService {
	void register(CandidateRegisterReq registerDto, MultipartFile resume);
}
