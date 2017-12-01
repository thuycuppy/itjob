package com.ptit.itjob.controller;

import com.ptit.itjob.dto.response.CompanyListRes;
import com.ptit.itjob.dto.response.CompanySearchRes;
import com.ptit.itjob.dto.response.JobListRes;
import com.ptit.itjob.dto.response.JobSearchRes;
import com.ptit.itjob.service.CompanyService;
import com.ptit.itjob.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class AJAXController {
    private CompanyService companyService;
    private JobService jobService;

    @Autowired
    public AJAXController(CompanyService companyService, JobService jobService) {
        this.companyService = companyService;
        this.jobService = jobService;
    }

    @GetMapping("/ajax/loadmore/company")
    public Page<CompanyListRes> loadMoreCompany(@RequestParam("page") Integer page) {
        return companyService.findAll(page);
    }

    @GetMapping("/ajax/loadmore/company/{id}/job")
    public Page<JobListRes> loadMoreCompanyJob(@PathVariable("id") Integer companyId, @RequestParam("page") Integer page) {
        return jobService.findByCompany(companyId, page);
    }

    @GetMapping("/ajax/loadmore/job")
    public Page<JobListRes> loadMoreJob(@RequestParam("page") Integer page) {
        return jobService.findAll(page);
    }

    @GetMapping("/ajax/autocomplete/home")
    public List<JobSearchRes> searchAutocompleteHome(
            @RequestParam("title") String title,
            @RequestParam("location") Integer locationId) {
        return jobService.findByTitleAndLocation(title, locationId);
    }

    @GetMapping("/ajax/autocomplete/company")
    public List<CompanySearchRes> searchAutocompleteCompany(@RequestParam("name") String name) {
        return companyService.findByName(name);
    }

    @GetMapping("/ajax/autocomplete/job")
    public List<JobSearchRes> searchAutocompleteJob(@RequestParam("title") String title) {
        return jobService.findByTitle(title);
    }
}
