package com.ptit.itjob.controller;

import com.ptit.itjob.common.PaginationUtil;
import com.ptit.itjob.dto.response.ApplicationRes;
import com.ptit.itjob.dto.response.CompanyJobRes;
import com.ptit.itjob.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class CompanyManagerController {
    private CompanyService companyService;
    private JobService jobService;
    private ApplicationService applicationService;

    @Autowired
    public CompanyManagerController(CompanyService companyService, JobService jobService, ApplicationService applicationService) {
        this.companyService = companyService;
        this.jobService = jobService;
        this.applicationService = applicationService;
    }

    @GetMapping("/company-manager/profile")
    public String showCompanyProfile(Model model) {
        model.addAttribute("company", companyService.findCurrent());
        return "company_profile";
    }

    @GetMapping("/company-manager/active-jobs")
    public String listActiveJobs(@RequestParam(value = "page", defaultValue = "1") Integer page, Model model) {
        Page<CompanyJobRes> jobs = jobService.findByCurrentCompany(page);
        model.addAttribute("jobs", jobs);
        model.addAttribute("pagination", PaginationUtil.paging(jobs));
        return "company_active_jobs";
    }

    @GetMapping("/company-manager/job/{jobId}/resume")
    public String listResume(
            @PathVariable("jobId") Integer jobId,
            @RequestParam(value = "page", defaultValue = "1") Integer page,
            Model model) {
        Page<ApplicationRes> applications = applicationService.findByJob(jobId, page);
        model.addAttribute("applications", applications);
        model.addAttribute("jobId", jobId);
        model.addAttribute("pagination", PaginationUtil.paging(applications));
        return "company_job_resume";
    }
}
