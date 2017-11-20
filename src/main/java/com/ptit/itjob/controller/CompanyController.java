package com.ptit.itjob.controller;

import com.ptit.itjob.service.CompanyService;
import com.ptit.itjob.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class CompanyController {
    private CompanyService companyService;

    @Autowired
    public CompanyController(CompanyService companyService, JobService jobService) {
        this.companyService = companyService;
    }

    @GetMapping("/company")
    public String list() {
        return "company_list";
    }

    @GetMapping("/company/{id}")
    public String detail(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("company", companyService.findOne(id));
        return "company_detail";
    }
}
