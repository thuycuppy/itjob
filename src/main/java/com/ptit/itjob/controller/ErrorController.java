package com.ptit.itjob.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorController {
	@GetMapping("/403")
	public String accessDenied() {
		return "403";
	}
	
	@GetMapping("/404")
	public String pageNotFound() {
		return "404";
	}
}
