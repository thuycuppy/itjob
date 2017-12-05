package com.ptit.itjob.controller;

import com.ptit.itjob.dto.request.CompanyRegisterReq;
import com.ptit.itjob.model.CompanyType;
import com.ptit.itjob.model.Location;
import com.ptit.itjob.service.CompanyService;
import com.ptit.itjob.service.CompanyTypeService;
import com.ptit.itjob.service.LocationService;
import com.ptit.itjob.validator.CompanyRegisterValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.beans.PropertyEditorSupport;

@Controller
public class CompanyController {
    private CompanyService companyService;
    private CompanyTypeService companyTypeService;
    private LocationService locationService;
    private CompanyRegisterValidator registerValidator;

    @Autowired
    public CompanyController(CompanyService companyService, CompanyTypeService companyTypeService, LocationService locationService, CompanyRegisterValidator registerValidator) {
        this.companyService = companyService;
        this.companyTypeService = companyTypeService;
        this.locationService = locationService;
        this.registerValidator = registerValidator;
    }

    @GetMapping("/company")
    public String listCompany() {
        return "company_list";
    }

    @GetMapping("/company/{id}")
    public String showCompanyDetail(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("company", companyService.findById(id));
        return "company_detail";
    }

    @GetMapping("/company/profile")
    public String showCompanyProfile(Model model) {
        model.addAttribute("company", companyService.findCurrent());
        return "company_profile";
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
}
