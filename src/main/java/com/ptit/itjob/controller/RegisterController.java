package com.ptit.itjob.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ptit.itjob.dto.RegisterDto;
import com.ptit.itjob.service.ProfileService;
import com.ptit.itjob.validator.RegisterValidator;

@Controller
public class RegisterController {
	@Autowired
	private RegisterValidator registerValidator;
	@Autowired
	private ProfileService profileService;
	
	@GetMapping("/register")
	public String register(Model model) {
		model.addAttribute("registerDto", new RegisterDto());
		return "register";
	}
	
	@PostMapping("/register")
	public String handleRegister(@ModelAttribute("registerDto") @Valid RegisterDto registerDto, 
			BindingResult result, RedirectAttributes redirect) {
		registerValidator.validate(registerDto, result);
        if (result.hasErrors()) {
            return "register";
        }

        profileService.register(registerDto);
        redirect.addFlashAttribute("success", "You registered successfully!");
        return "redirect:/login";
	}
	
}
