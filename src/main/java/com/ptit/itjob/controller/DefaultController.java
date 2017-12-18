package com.ptit.itjob.controller;

import com.ptit.itjob.model.Candidate;
import com.ptit.itjob.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class DefaultController {
    private CandidateService candidateService;
    private CompanyService companyService;
    private JobService jobService;
    private ApplicationService applicationService;
    private LocationService locationService;

    @Autowired
    public DefaultController(CandidateService candidateService, CompanyService companyService, JobService jobService, ApplicationService applicationService, LocationService locationService) {
        this.candidateService = candidateService;
        this.companyService = companyService;
        this.jobService = jobService;
        this.applicationService = applicationService;
        this.locationService = locationService;
    }


    /*================== HOME PAGE ================== */

    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("locations", locationService.findAll());
        model.addAttribute("latestJobs", jobService.findLatest());
        model.addAttribute("topCompanies", companyService.findTop());
        return "home";
    }


    /*================== AUTHENTICATION PAGES ================== */

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
            new SecurityContextLogoutHandler().logout(request, response, authentication);
        }
        return "redirect:/login";
    }


    /*================== COMPANY PAGES ================== */

    @GetMapping("/companies")
    public String listCompany() {
        return "company_list";
    }

    @GetMapping("/company/{id}")
    public String showCompanyDetail(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("company", companyService.findById(id));
        return "company_detail";
    }


    /*================== JOB PAGES ================== */

    @RequestMapping("/jobs")
    public String listJob() {
        return "job_list";
    }

    @GetMapping("/job/{id}")
    public String showJob(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("job", jobService.findById(id));
        return "job_detail";
    }

    @GetMapping("/job/{id}/apply")
    public String applyJob(@PathVariable("id") Integer jobId) {
        String redirectUrl = "redirect:/job/" + jobId;

        Candidate currentCandidate = candidateService.findCurrent();
        if (currentCandidate == null) {
            return redirectUrl + "?error1";
        }

        if (currentCandidate.getResume() ==  null) {
            return redirectUrl + "?error2";
        }

        if (applicationService.isApplied(currentCandidate.getId(), jobId)) {
            return redirectUrl + "?error3";
        }

        applicationService.createApplication(currentCandidate.getId(), jobId);

        return redirectUrl + "?success";
    }

}
