package com.ptit.itjob.controller;

import com.ptit.itjob.dto.request.CandidateRegisterReq;
import com.ptit.itjob.dto.request.CompanyRegisterReq;
import com.ptit.itjob.model.Candidate;
import com.ptit.itjob.model.CompanyType;
import com.ptit.itjob.model.Location;
import com.ptit.itjob.service.*;
import com.ptit.itjob.validator.CompanyRegisterValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.beans.PropertyEditorSupport;

@Controller
public class DefaultController {
    private CandidateService candidateService;
    private CompanyService companyService;
    private JobService jobService;
    private ApplicationService applicationService;
    private LocationService locationService;
    private CompanyTypeService companyTypeService;
    private CompanyRegisterValidator registerValidator;

    @Autowired
    public DefaultController(CandidateService candidateService, CompanyService companyService, JobService jobService, ApplicationService applicationService, LocationService locationService, CompanyTypeService companyTypeService, CompanyRegisterValidator registerValidator) {
        this.candidateService = candidateService;
        this.companyService = companyService;
        this.jobService = jobService;
        this.applicationService = applicationService;
        this.locationService = locationService;
        this.companyTypeService = companyTypeService;
        this.registerValidator = registerValidator;
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


    /*================== CANDIDATE PAGES ================== */

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

    @GetMapping("/company/register")
    public String registerCompany(Model model) {
        model.addAttribute("companyTypes", companyTypeService.findAll());
        model.addAttribute("locations", locationService.findAll());
        model.addAttribute("registerDto", new CompanyRegisterReq());
        return "company_register";
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
    }

    @PostMapping("/company/register")
    public String handleRegisterCompany(
            @ModelAttribute("registerDto") @Valid CompanyRegisterReq req,
            Model model, BindingResult result, RedirectAttributes redirect,
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
