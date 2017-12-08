package com.ptit.itjob.controller;

import com.ptit.itjob.common.PaginationUtil;
import com.ptit.itjob.dto.response.ApplicationRes;
import com.ptit.itjob.service.ApplicationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.ptit.itjob.service.CandidateService;

@Controller
public class CandidateManagerController {
	private CandidateService candidateService;
	private ApplicationService applicationService;

	@Autowired
	public CandidateManagerController(CandidateService candidateService, ApplicationService applicationService) {
		this.candidateService = candidateService;
		this.applicationService = applicationService;
	}

	@GetMapping("/candidate-manager/profile")
	public String showCandidate(Model model) {
		model.addAttribute("candidate", candidateService.findCurrent());
		return "candidate_profile";
	}

	@GetMapping("/candidate-manager/applied-jobs")
	public String listAppliedJobs(@RequestParam(value = "page", defaultValue = "1") Integer page, Model model) {
		Page<ApplicationRes> applications = applicationService.findByCurrentCandidate(page);
		model.addAttribute("applications", applications);
		model.addAttribute("pagination", PaginationUtil.paging(applications));
		return "candidate_applied_jobs";
	}
}
