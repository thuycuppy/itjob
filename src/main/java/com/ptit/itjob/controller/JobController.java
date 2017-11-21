package com.ptit.itjob.controller;

import com.ptit.itjob.service.JobService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JobController {
    private JobService jobService;

    @Autowired
    public JobController(JobService jobService) {
        this.jobService = jobService;
    }

    @RequestMapping("/job")
    public String listJob() {
        return "job_list";
    }

    @GetMapping("/job/{id}")
    public String showJob(@PathVariable("id") Integer id, Model model) {
        model.addAttribute("job", jobService.findById(id));
        return "job_detail";
    }
}
