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
@Table(name = "candidate", catalog = "itjob")
public class Candidate implements java.io.Serializable {

	private static final long serialVersionUID = -5499446589031626257L;
	private Integer id;
	private Account account;
	private Experience experience;
	private JobType jobType;
	private Location location;
	private String name;
	private Date dob;
	private String phone;
	private boolean sex;
	private String address;
	private String description;
	private String avatar;
	private String resume;
	private Integer expectedSalary;
	private Set<Skill> skills = new HashSet<Skill>(0);
	private Set<Application> applications = new HashSet<Application>(0);

	public Candidate() {
	}

	public Candidate(Account account, String name, Date dob, String phone, boolean sex, String address) {
		this.account = account;
		this.name = name;
		this.dob = dob;
		this.phone = phone;
		this.sex = sex;
		this.address = address;
	}

	public Candidate(Account account, Experience experience, JobType jobType, Location location, String name, Date dob,
					 String phone, boolean sex, String address, String description, String avatar, String resume, Integer expectedSalary,
					 Set<Skill> skills, Set<Application> applications) {
		this.account = account;
		this.experience = experience;
		this.jobType = jobType;
		this.location = location;
		this.name = name;
		this.dob = dob;
		this.phone = phone;
		this.sex = sex;
		this.address = address;
		this.description = description;
		this.avatar = avatar;
		this.resume = resume;
		this.expectedSalary = expectedSalary;
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
	@JoinColumn(name = "account_id", nullable = false)
	public Account getAccount() {
		return this.account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "expected_experience_id")
	public Experience getExperience() {
		return this.experience;
	}

	public void setExperience(Experience experience) {
		this.experience = experience;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "expected_job_type_id")
	public JobType getJobType() {
		return this.jobType;
	}

	public void setJobType(JobType jobType) {
		this.jobType = jobType;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "expected_location_id")
	public Location getLocation() {
		return this.location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

	@Column(name = "name", nullable = false, length = 50)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "dob", nullable = false, length = 10)
	public Date getDob() {
		return this.dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	@Column(name = "phone", nullable = false, length = 20)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "sex", nullable = false)
	public boolean isSex() {
		return this.sex;
	}

	public void setSex(boolean sex) {
		this.sex = sex;
	}

	@Column(name = "address", nullable = false)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "description")
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "avatar")
	public String getAvatar() {
		return this.avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	@Column(name = "resume")
	public String getResume() {
		return this.resume;
	}

	public void setResume(String resume) {
		this.resume = resume;
	}

	@Column(name = "expected_salary")
	public Integer getExpectedSalary() {
		return this.expectedSalary;
	}

	public void setExpectedSalary(Integer expectedSalary) {
		this.expectedSalary = expectedSalary;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "candidate_skill", catalog = "itjob", joinColumns = {
			@JoinColumn(name = "candidate_id", nullable = false, updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "skill_id", nullable = false, updatable = false) })
	public Set<Skill> getSkills() {
		return this.skills;
	}

	public void setSkills(Set<Skill> skills) {
		this.skills = skills;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "candidate")
	public Set<Application> getApplications() {
		return this.applications;
	}

	public void setApplications(Set<Application> applications) {
		this.applications = applications;
	}

}
