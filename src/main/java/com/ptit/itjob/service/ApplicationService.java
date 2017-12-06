package com.ptit.itjob.service;

import com.ptit.itjob.dto.response.ApplicationRes;
import org.springframework.data.domain.Page;

public interface ApplicationService {
    Page<ApplicationRes> findByCurrentCandidate(Integer page);

    Page<ApplicationRes> findByJob(Integer jobId, Integer page);
}
