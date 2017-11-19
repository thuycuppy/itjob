package com.ptit.itjob.controller;

import com.ptit.itjob.common.PaginationUtil;
import com.ptit.itjob.dto.response.CompanyDetailDto;
import com.ptit.itjob.dto.response.CompanyListDto;
import com.ptit.itjob.dto.response.JobListDto;
import com.ptit.itjob.service.CompanyService;
import com.ptit.itjob.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CompanyController {
    private CompanyService companyService;
    private JobService jobService;

    @Autowired
    public CompanyController(CompanyService companyService, JobService jobService) {
        this.companyService = companyService;
        this.jobService = jobService;
    }

    @GetMapping("/company/list")
    public String list(@RequestParam(value = "page", defaultValue = "1") Integer page, Model model) {
        Page<CompanyListDto> dtos = companyService.findAll(page - 1);
        model.addAttribute("companies", dtos);
        model.addAttribute("pagination", PaginationUtil.paging(dtos));
        return "company.list";
    }

    @GetMapping("/company/detail")
    public String detail(@RequestParam("id") Integer id, Model model) {
        CompanyDetailDto companyDetailDto = companyService.findOne(id);
        Page<JobListDto> jobDtos = jobService.findByCompany(id, 1);
        model.addAttribute("company", companyDetailDto);
        model.addAttribute("jobs", jobDtos);
        return "company_detail";
    }
}
