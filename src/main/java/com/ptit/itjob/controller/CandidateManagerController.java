package com.ptit.itjob.controller;

import com.ptit.itjob.common.PaginationUtil;
import com.ptit.itjob.common.Session;
import com.ptit.itjob.dto.request.CandidateEditProfileReq;
import com.ptit.itjob.dto.request.CandidateRegisterReq;
import com.ptit.itjob.dto.response.ApplicationRes;
import com.ptit.itjob.model.Experience;
import com.ptit.itjob.model.JobType;
import com.ptit.itjob.model.Location;
import com.ptit.itjob.service.*;
import com.ptit.itjob.validator.CandidateRegisterValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomCollectionEditor;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.beans.PropertyEditorSupport;
import java.util.Set;

@Controller
public class CandidateManagerController {
	private CandidateService candidateService;
	private ApplicationService applicationService;
	private LocationService locationService;
	private SkillService skillService;
	private JobTypeService jobTypeService;
	private ExperienceService experienceService;
	private CandidateRegisterValidator registerValidator;
	private Session session;

	@Autowired
	public CandidateManagerController(CandidateService candidateService, ApplicationService applicationService, LocationService locationService, SkillService skillService, JobTypeService jobTypeService, ExperienceService experienceService, CandidateRegisterValidator registerValidator, Session session) {
		this.candidateService = candidateService;
		this.applicationService = applicationService;
		this.locationService = locationService;
		this.skillService = skillService;
		this.jobTypeService = jobTypeService;
		this.experienceService = experienceService;
		this.registerValidator = registerValidator;
		this.session = session;
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(Location.class, "location", new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				Location location = locationService.findOne(Integer.parseInt(text));
				setValue(location);
			}
		});

		binder.registerCustomEditor(Set.class, "skills", new CustomCollectionEditor(Set.class) {
			@Override
			protected Object convertElement(Object element) {
				Integer id = Integer.parseInt((String) element);
				return skillService.findOne(id);
			}
		});

		binder.registerCustomEditor(JobType.class, "jobType", new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				JobType jobType = jobTypeService.findOne(Integer.parseInt(text));
				setValue(jobType);
			}
		});

		binder.registerCustomEditor(Experience.class, "experience", new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				Experience experience = experienceService.findOne(Integer.parseInt(text));
				setValue(experience);
			}
		});
	}

	@GetMapping("/candidate-manager/register")
	public String registerCandidate(Model model) {
		model.addAttribute("registerReq", new CandidateRegisterReq());
		return "candidate_register";
	}

	@PostMapping("/candidate-manager/register")
	public String handleRegisterCandidate(@ModelAttribute("registerReq") @Valid CandidateRegisterReq req,
										  BindingResult result, RedirectAttributes redirect,
										  @RequestParam(value = "resume", required = false) MultipartFile resume) {
		registerValidator.validate(req, result);
		if (result.hasErrors()) {
			return "candidate_register";
		}

		candidateService.create(req, resume);
		redirect.addFlashAttribute("success", "You registered successfully!");
		return "redirect:/login";
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
		model.addAttribute("registerReq", session.getCurrentCandidateEditProfileReq());
		return "candidate_edit_profile";
	}

	@PostMapping("/candidate-manager/edit-profile")
	public String handleEditCandidateProfile(@ModelAttribute("registerReq") @Valid CandidateEditProfileReq req,
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
