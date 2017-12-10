package com.ptit.itjob.dto.request;

import com.ptit.itjob.model.Experience;
import com.ptit.itjob.model.JobType;
import com.ptit.itjob.model.Location;
import com.ptit.itjob.model.Skill;

import javax.validation.constraints.Digits;
import javax.validation.constraints.Min;
import java.util.Set;

public class CandidateEditProfileReq extends CandidateRegisterReq {
    private Integer id;
    private Location location;
    private Set<Skill> skills;
    private JobType jobType;
    private Experience experience;

    @Digits(integer = 10, fraction = 0)
    @Min(value = 0)
    private Integer expectedSalary;

    public CandidateEditProfileReq() {
    }

    public CandidateEditProfileReq(String name, String email, String password, String confirmPassword, String dob, String phone, boolean sex, String address, Integer id, Location location, Set<Skill> skills, JobType jobType, Experience experience, Integer expectedSalary) {
        super(name, email, password, confirmPassword, dob, phone, sex, address);
        this.id = id;
        this.location = location;
        this.skills = skills;
        this.jobType = jobType;
        this.experience = experience;
        this.expectedSalary = expectedSalary;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Location getLocation() {
        return location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    public Set<Skill> getSkills() {
        return skills;
    }

    public void setSkills(Set<Skill> skills) {
        this.skills = skills;
    }

    public JobType getJobType() {
        return jobType;
    }

    public void setJobType(JobType jobType) {
        this.jobType = jobType;
    }

    public Experience getExperience() {
        return experience;
    }

    public void setExperience(Experience experience) {
        this.experience = experience;
    }

    public Integer getExpectedSalary() {
        return expectedSalary;
    }

    public void setExpectedSalary(Integer expectedSalary) {
        this.expectedSalary = expectedSalary;
    }
}
