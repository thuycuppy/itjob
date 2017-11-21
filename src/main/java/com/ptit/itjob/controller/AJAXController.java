package com.ptit.itjob.controller;

import com.ptit.itjob.dto.response.CompanyListDto;
import com.ptit.itjob.dto.response.JobListDto;
import com.ptit.itjob.service.CompanyService;
import com.ptit.itjob.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AJAXController {
    private CompanyService companyService;
    private JobService jobService;

    @Autowired
    public AJAXController(CompanyService companyService, JobService jobService) {
        this.companyService = companyService;
        this.jobService = jobService;
    }

    @GetMapping("/ajax/company")
    public Page<CompanyListDto> loadMoreCompanies(@RequestParam("page") Integer page) {
        return companyService.findAll(page);
    }

    @GetMapping("/ajax/company/{id}/job")
    public Page<JobListDto> loadMoreCompanyJobs(@PathVariable("id") Integer companyId, @RequestParam("page") Integer page) {
        return jobService.findByCompany(companyId, page);
    }

    @GetMapping("/ajax/job")
    public Page<JobListDto> loadMoreJobs(@RequestParam("page") Integer page) {
        return jobService.findAll(page);
    }
}
