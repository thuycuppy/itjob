package com.ptit.itjob.controller;

import com.ptit.itjob.common.PaginationUtil;
import com.ptit.itjob.common.Session;
import com.ptit.itjob.dto.request.CompanyEditProfileReq;
import com.ptit.itjob.dto.request.CompanyRegisterReq;
import com.ptit.itjob.dto.request.PostJobReq;
import com.ptit.itjob.dto.response.ApplicationRes;
import com.ptit.itjob.dto.response.CompanyJobRes;
import com.ptit.itjob.model.CompanyType;
import com.ptit.itjob.model.Experience;
import com.ptit.itjob.model.JobType;
import com.ptit.itjob.model.Location;
import com.ptit.itjob.service.*;
import com.ptit.itjob.validator.CompanyRegisterValidator;
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
public class CompanyManagerController {
    private CompanyService companyService;
    private JobService jobService;
    private ApplicationService applicationService;
    private CompanyTypeService companyTypeService;
    private LocationService locationService;
    private SkillService skillService;
    private JobTypeService jobTypeService;
    private ExperienceService experienceService;
    private CompanyRegisterValidator registerValidator;
    private Session session;

    @Autowired
    public CompanyManagerController(CompanyService companyService, JobService jobService, ApplicationService applicationService, CompanyTypeService companyTypeService, LocationService locationService, SkillService skillService, JobTypeService jobTypeService, ExperienceService experienceService, CompanyRegisterValidator registerValidator, Session session) {
        this.companyService = companyService;
        this.jobService = jobService;
        this.applicationService = applicationService;
        this.companyTypeService = companyTypeService;
        this.locationService = locationService;
        this.skillService = skillService;
        this.jobTypeService = jobTypeService;
        this.experienceService = experienceService;
        this.registerValidator = registerValidator;
        this.session = session;
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(CompanyType.class, "companyType", new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) {
                CompanyType type = companyTypeService.findOne(Integer.parseInt(text));
                setValue(type);
            }
        });

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

    @GetMapping("/company/register")
    public String registerCompany(Model model) {
        model.addAttribute("companyTypes", companyTypeService.findAll());
        model.addAttribute("locations", locationService.findAll());
        model.addAttribute("registerReq", new CompanyRegisterReq());
        return "company_register";
    }

    @PostMapping("/company/register")
    public String handleRegisterCompany(@ModelAttribute("registerReq") @Valid CompanyRegisterReq req,
                                        BindingResult result, Model model, RedirectAttributes redirect,
                                        @RequestParam(value = "logo") MultipartFile logo) {
        registerValidator.validate(req, result);
        if (result.hasErrors()) {
            model.addAttribute("companyTypes", companyTypeService.findAll());
            model.addAttribute("locations", locationService.findAll());
            return "company_register";
        }

        companyService.create(req, logo);
        redirect.addFlashAttribute("success", "You registered successfully!");
        return "redirect:/login";
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
        model.addAttribute("registerReq", session.getCurrentCompanyEditProfileReq());
        return "company_edit_profile";
    }

    @PostMapping("/company-manager/edit-profile")
    public String handleEditCandidateProfile(@ModelAttribute("registerReq") @Valid CompanyEditProfileReq req,
                                             BindingResult result, Model model, RedirectAttributes redirect,
                                             @RequestParam(value = "logo", required = false) MultipartFile logo) {
        if (result.hasErrors()) {
            model.addAttribute("companyTypes", companyTypeService.findAll());
            model.addAttribute("locations", locationService.findAll());
            return "company_edit_profile";
        }

        companyService.update(req, logo);
        redirect.addFlashAttribute("success", "You updated profile successfully!");
        return "redirect:/company-manager/edit-profile";
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
        model.addAttribute("postJobReq", new PostJobReq());
        return "company_post_job";
    }

    @PostMapping("/company-manager/post-job")
    public String handlePostJob(@ModelAttribute("postJobReq") @Valid PostJobReq req,
                                BindingResult result, Model model, RedirectAttributes redirect) {
        if (result.hasErrors()) {
            model.addAttribute("locations", locationService.findAll());
            model.addAttribute("skills", skillService.findAll());
            model.addAttribute("jobTypes", jobTypeService.findAll());
            model.addAttribute("experiences", experienceService.findAll());
            return "company_post_job";
        }

        jobService.create(req);
        redirect.addFlashAttribute("success", "Your job is posted successfully!");
        return "redirect:/company-manager/post-job";
    }
}
