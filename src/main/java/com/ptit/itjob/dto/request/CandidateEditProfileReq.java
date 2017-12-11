package com.ptit.itjob.dto.request;

import com.ptit.itjob.model.Experience;
import com.ptit.itjob.model.JobType;
import com.ptit.itjob.model.Location;
import com.ptit.itjob.model.Skill;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.Digits;
import javax.validation.constraints.Min;
import java.util.Set;

public class CandidateEditProfileReq {
    @NotEmpty
    @Length(max = 50)
    protected String name;

    @NotEmpty
    @Length(max = 10)
    private String dob;

    @NotEmpty
    @Length(max = 20)
    private String phone;

    private boolean sex;

    @NotEmpty
    @Length(max = 255)
    private String address;

    private Location location;
    private Set<Skill> skills;
    private JobType jobType;
    private Experience experience;

    @Digits(integer = 10, fraction = 0)
    @Min(value = 0)
    private Integer expectedSalary;

    public CandidateEditProfileReq() {
    }

    public CandidateEditProfileReq(String name, String dob, String phone, boolean sex, String address, Location location, Set<Skill> skills, JobType jobType, Experience experience, Integer expectedSalary) {
        this.name = name;
        this.dob = dob;
        this.phone = phone;
        this.sex = sex;
        this.address = address;
        this.location = location;
        this.skills = skills;
        this.jobType = jobType;
        this.experience = experience;
        this.expectedSalary = expectedSalary;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public boolean isSex() {
        return sex;
    }

    public void setSex(boolean sex) {
        this.sex = sex;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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
