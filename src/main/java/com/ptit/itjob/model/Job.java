package com.ptit.itjob.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "job", catalog = "itjob")
public class Job implements java.io.Serializable {
	private static final long serialVersionUID = -9050670354758197128L;
	private Integer id;
	private Company company;
	private Experience experience;
	private JobType jobType;
	private Location location;
	private String title;
	private Integer salary;
	private String description;
	private String requirement;
	private Date createdAt;
	private Set<Skill> skills = new HashSet<Skill>(0);
	private Set<Application> applications = new HashSet<Application>(0);

	public Job() {
	}

	public Job(Company company, Experience experience, JobType jobType, Location location, String title, Integer salary,
			String description, String requirement, Date createdAt) {
		this.company = company;
		this.experience = experience;
		this.jobType = jobType;
		this.location = location;
		this.title = title;
		this.salary = salary;
		this.description = description;
		this.requirement = requirement;
		this.createdAt = createdAt;
	}

	public Job(Company company, Experience experience, JobType jobType, Location location, String title, int salary,
			String description, String requirement, Date createdAt, Set<Skill> skills, Set<Application> applications) {
		this.company = company;
		this.experience = experience;
		this.jobType = jobType;
		this.location = location;
		this.title = title;
		this.salary = salary;
		this.description = description;
		this.requirement = requirement;
		this.createdAt = createdAt;
		this.skills = skills;
		this.applications = applications;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "company_id", nullable = false)
	public Company getCompany() {
		return this.company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "experience_id", nullable = false)
	public Experience getExperience() {
		return this.experience;
	}

	public void setExperience(Experience experience) {
		this.experience = experience;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "job_type_id", nullable = false)
	public JobType getJobType() {
		return this.jobType;
	}

	public void setJobType(JobType jobType) {
		this.jobType = jobType;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "location_id", nullable = false)
	public Location getLocation() {
		return this.location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

	@Column(name = "title", nullable = false)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "salary", nullable = false)
	public Integer getSalary() {
		return this.salary;
	}

	public void setSalary(Integer salary) {
		this.salary = salary;
	}

	@Column(name = "description", nullable = false, length = 1000)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "requirement", nullable = false, length = 1000)
	public String getRequirement() {
		return this.requirement;
	}

	public void setRequirement(String requirement) {
		this.requirement = requirement;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "created_at", nullable = false, length = 19)
	public Date getCreatedAt() {
		return this.createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "job_skill", catalog = "itjob", joinColumns = {
			@JoinColumn(name = "job_id", nullable = false, updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "skill_id", nullable = false, updatable = false) })
	public Set<Skill> getSkills() {
		return this.skills;
	}

	public void setSkills(Set<Skill> skills) {
		this.skills = skills;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "job")
	public Set<Application> getApplications() {
		return this.applications;
	}

	public void setApplications(Set<Application> applications) {
		this.applications = applications;
	}

}
