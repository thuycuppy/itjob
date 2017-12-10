package com.ptit.itjob.dto.request;

import com.ptit.itjob.model.Experience;
import com.ptit.itjob.model.JobType;
import com.ptit.itjob.model.Location;
import com.ptit.itjob.model.Skill;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.Digits;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Set;

public class PostJobReq implements Serializable {
    private static final long serialVersionUID = 8567381621393622046L;

    @NotEmpty
    @Length(max = 255)
    private String title;

    @NotNull
    @Digits(integer = 10, fraction = 0)
    @Min(value = 0)
    private Integer salary;

    private Location location;

    @NotEmpty
    private Set<Skill> skills;

    private JobType jobType;

    private Experience experience;

    @NotEmpty
    @Length(max = 1000)
    private String description;

    @NotEmpty
    @Length(max = 1000)
    private String requirement;

    public PostJobReq() {
    }

    public PostJobReq(String title, Integer salary, Location location, Set<Skill> skills, JobType jobType, Experience experience, String description, String requirement) {
        this.title = title;
        this.salary = salary;
        this.location = location;
        this.skills = skills;
        this.jobType = jobType;
        this.experience = experience;
        this.description = description;
        this.requirement = requirement;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getSalary() {
        return salary;
    }

    public void setSalary(Integer salary) {
        this.salary = salary;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getRequirement() {
        return requirement;
    }

    public void setRequirement(String requirement) {
        this.requirement = requirement;
    }
}
