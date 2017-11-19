package com.ptit.itjob.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ptit.itjob.service.CompanyService;
import com.ptit.itjob.service.JobService;
import com.ptit.itjob.service.LocationService;

@Controller
public class IndexController {
	
	@Autowired
	private LocationService locationService;
	@Autowired
	private JobService jobService;
	@Autowired
	private CompanyService companyService;
	
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("locations", locationService.findAll());
		model.addAttribute("latestJobs", jobService.findLatestJobs());
		model.addAttribute("topCompanies", companyService.findTopCompanies());
		return "index";
	}
	
}
