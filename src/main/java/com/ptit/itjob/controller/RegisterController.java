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
import com.ptit.itjob.validator.RegisterValidator;

@Controller
public class RegisterController {
	private RegisterValidator registerValidator;
	private CandidateService candidateService;

	@Autowired
	public RegisterController(RegisterValidator registerValidator, CandidateService candidateService) {
		this.registerValidator = registerValidator;
		this.candidateService = candidateService;
	}

	@GetMapping("/register/candidate")
	public String registerCandidate(Model model) {
		model.addAttribute("registerDto", new CandidateRegisterReq());
		return "register";
	}
	
	@PostMapping("/register/candidate")
	public String handleRegisterCandidate(
			@ModelAttribute("registerDto") @Valid CandidateRegisterReq req,
			BindingResult result, RedirectAttributes redirect,
			@RequestParam(value = "resume", required = false) MultipartFile resume) {
		registerValidator.validate(req, result);
        if (result.hasErrors()) {
            return "register";
        }

        candidateService.register(req, resume);
        redirect.addFlashAttribute("success", "You registered successfully!");
        return "redirect:/login";
	}

}
