package com.ptit.itjob.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ptit.itjob.dto.request.CandidateRegisterReq;
import com.ptit.itjob.service.CandidateService;
import com.ptit.itjob.validator.CandidateRegisterValidator;

@Controller
public class CandidateController {
	private CandidateRegisterValidator registerValidator;
	private CandidateService candidateService;

	@Autowired
	public CandidateController(CandidateRegisterValidator registerValidator, CandidateService candidateService) {
		this.registerValidator = registerValidator;
		this.candidateService = candidateService;
	}

	@GetMapping("/candidate/register")
	public String registerCandidate(Model model) {
		model.addAttribute("registerDto", new CandidateRegisterReq());
		return "candidate_register";
	}
	
	@PostMapping("/candidate/register")
	public String handleRegisterCandidate(
			@ModelAttribute("registerDto") @Valid CandidateRegisterReq req,
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
}
