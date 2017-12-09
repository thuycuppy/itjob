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
    private CompanyTypeService companyTypeService;
    private LocationService locationService;
    private SkillService skillService;
    private JobTypeService jobTypeService;
    private ExperienceService experienceService;

    @Autowired
    public CompanyManagerController(CompanyService companyService, JobService jobService, ApplicationService applicationService, CompanyTypeService companyTypeService, LocationService locationService, SkillService skillService, JobTypeService jobTypeService, ExperienceService experienceService) {
        this.companyService = companyService;
        this.jobService = jobService;
        this.applicationService = applicationService;
        this.companyTypeService = companyTypeService;
        this.locationService = locationService;
        this.skillService = skillService;
        this.jobTypeService = jobTypeService;
        this.experienceService = experienceService;
    }

    @GetMapping("/company-manager/profile")
    public String showCompanyProfile(Model model) {
        model.addAttribute("company", companyService.findCurrent());
        return "company_profile";
    }

    @GetMapping("/company-manager/edit-profile")
    public String editCompanyProfile(Model model) {
        model.addAttribute("companyTypes", companyTypeService.findAll());
        model.addAttribute("locations", locationService.findAll());
        return "company_edit_profile";
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

    @GetMapping("/company-manager/post-job")
    public String postJob(Model model) {
        model.addAttribute("locations", locationService.findAll());
        model.addAttribute("skills", skillService.findAll());
        model.addAttribute("jobTypes", jobTypeService.findAll());
        model.addAttribute("experiences", experienceService.findAll());
        return "company_post_job";
    }
}
