package com.ptit.itjob.controller;

import com.ptit.itjob.common.PaginationUtil;
import com.ptit.itjob.common.Session;
import com.ptit.itjob.dto.request.CandidateEditProfileReq;
import com.ptit.itjob.dto.response.ApplicationRes;
import com.ptit.itjob.model.Candidate;
import com.ptit.itjob.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
public class CandidateManagerController {
	private CandidateService candidateService;
	private ApplicationService applicationService;
	private LocationService locationService;
	private SkillService skillService;
	private JobTypeService jobTypeService;
	private ExperienceService experienceService;
	private Session session;

	@Autowired
	public CandidateManagerController(CandidateService candidateService, ApplicationService applicationService, LocationService locationService, SkillService skillService, JobTypeService jobTypeService, ExperienceService experienceService, Session session) {
		this.candidateService = candidateService;
		this.applicationService = applicationService;
		this.locationService = locationService;
		this.skillService = skillService;
		this.jobTypeService = jobTypeService;
		this.experienceService = experienceService;
		this.session = session;
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
		model.addAttribute("req", session.getCurrentCandidateEditProfileReq());
		return "candidate_edit_profile";
	}

	@PostMapping("/candidate-manager/edit-profile")
	public String handleEditCandidateProfile(@ModelAttribute("req") @Valid CandidateEditProfileReq req,
											 BindingResult result, Model model, RedirectAttributes redirect,
											 @RequestParam(value = "avatar", required = false) MultipartFile avatar,
											 @RequestParam(value = "resume", required = false) MultipartFile resume) {
		if (result.hasErrors()) {
			model.addAttribute("locations", locationService.findAll());
			model.addAttribute("skills", skillService.findAll());
			model.addAttribute("jobTypes", jobTypeService.findAll());
			model.addAttribute("experiences", experienceService.findAll());
			return "candidate_edit_profile";
		}

		candidateService.update(req, avatar, resume);
		redirect.addFlashAttribute("success", "You updated profile successfully!");
		return "redirect:/candidate-manager/edit-profile";
	}

	@GetMapping("/candidate-manager/applied-jobs")
	public String listAppliedJobs(@RequestParam(value = "page", defaultValue = "1") Integer page, Model model) {
		Page<ApplicationRes> applications = applicationService.findByCurrentCandidate(page);
		model.addAttribute("applications", applications);
		model.addAttribute("pagination", PaginationUtil.paging(applications));
		return "candidate_applied_jobs";
	}
}
