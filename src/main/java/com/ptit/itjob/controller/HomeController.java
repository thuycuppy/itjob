package com.ptit.itjob.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ptit.itjob.service.CompanyService;
import com.ptit.itjob.service.JobService;
import com.ptit.itjob.service.LocationService;

@Controller
public class HomeController {

	private LocationService locationService;
	private JobService jobService;
	private CompanyService companyService;

	@Autowired
	public HomeController(LocationService locationService, JobService jobService, CompanyService companyService) {
		this.locationService = locationService;
		this.jobService = jobService;
		this.companyService = companyService;
	}

	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("locations", locationService.findAll());
		model.addAttribute("latestJobs", jobService.findLatest());
		model.addAttribute("topCompanies", companyService.findTop());
		return "home";
	}
	
}
