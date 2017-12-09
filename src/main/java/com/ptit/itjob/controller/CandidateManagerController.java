package com.ptit.itjob.controller;

import com.ptit.itjob.common.PaginationUtil;
import com.ptit.itjob.dto.response.ApplicationRes;
import com.ptit.itjob.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class CandidateManagerController {
	private CandidateService candidateService;
	private ApplicationService applicationService;
	private LocationService locationService;
	private SkillService skillService;
	private JobTypeService jobTypeService;
	private ExperienceService experienceService;

	@Autowired
	public CandidateManagerController(CandidateService candidateService, ApplicationService applicationService, LocationService locationService, SkillService skillService, JobTypeService jobTypeService, ExperienceService experienceService) {
		this.candidateService = candidateService;
		this.applicationService = applicationService;
		this.locationService = locationService;
		this.skillService = skillService;
		this.jobTypeService = jobTypeService;
		this.experienceService = experienceService;
	}

	@GetMapping("/candidate-manager/profile")
	public String showCandidateProfile(Model model) {
		model.addAttribute("candidate", candidateService.findCurrent());
		return "candidate_profile";
	}

	@GetMapping("/candidate-manager/edit-profile")
	public String editCandidateProfile(Model model) {
		model.addAttribute("locations", locationService.findAll());
		model.addAttribute("skills", skillService.findAll());
		model.addAttribute("jobTypes", jobTypeService.findAll());
		model.addAttribute("experiences", experienceService.findAll());
		return "candidate_edit_profile";
	}

	@GetMapping("/candidate-manager/applied-jobs")
	public String listAppliedJobs(@RequestParam(value = "page", defaultValue = "1") Integer page, Model model) {
		Page<ApplicationRes> applications = applicationService.findByCurrentCandidate(page);
		model.addAttribute("applications", applications);
		model.addAttribute("pagination", PaginationUtil.paging(applications));
		return "candidate_applied_jobs";
	}
}
