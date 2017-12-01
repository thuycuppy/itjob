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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "candidate", catalog = "itjob")
public class Candidate implements java.io.Serializable {

	private static final long serialVersionUID = 917018581425455260L;
	private Integer id;
	private Account account;
	private Experience expectedExperience;
	private JobType expectedJobType;
	private Location expectedLocation;
	private String name;
	private Date dob;
	private String phone;
	private boolean sex;
	private String address;
	private String description;
	private String resume;
	private int expectedSalary;
	private Set<Skill> skills = new HashSet<Skill>(0);

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

	public Candidate(Account account, Experience expectedExperience, JobType expectedJobType, Location expectedLocation, String name, Date dob,
					 String phone, boolean sex, String address, int expectedSalary) {
		this.account = account;
		this.expectedExperience = expectedExperience;
		this.expectedJobType = expectedJobType;
		this.expectedLocation = expectedLocation;
		this.name = name;
		this.dob = dob;
		this.phone = phone;
		this.sex = sex;
		this.address = address;
		this.expectedSalary = expectedSalary;
	}

	public Candidate(Account account, Experience expectedExperience, JobType expectedJobType, Location expectedLocation, String name, Date dob,
			String phone, boolean sex, String address, String description, String resume, int expectedSalary,
			Set<Skill> skills) {
		this.account = account;
		this.expectedExperience = expectedExperience;
		this.expectedJobType = expectedJobType;
		this.expectedLocation = expectedLocation;
		this.name = name;
		this.dob = dob;
		this.phone = phone;
		this.sex = sex;
		this.address = address;
		this.description = description;
		this.resume = resume;
		this.expectedSalary = expectedSalary;
		this.skills = skills;
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
	@JoinColumn(name = "experience_id")
	public Experience getExpectedExperience() {
		return this.expectedExperience;
	}

	public void setExpectedExperience(Experience expectedExperience) {
		this.expectedExperience = expectedExperience;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "expected_job_type_id")
	public JobType getExpectedJobType() {
		return this.expectedJobType;
	}

	public void setExpectedJobType(JobType expectedJobType) {
		this.expectedJobType = expectedJobType;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "expected_location_id")
	public Location getExpectedLocation() {
		return this.expectedLocation;
	}

	public void setExpectedLocation(Location expectedLocation) {
		this.expectedLocation = expectedLocation;
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

	@Column(name = "resume")
	public String getResume() {
		return this.resume;
	}

	public void setResume(String resume) {
		this.resume = resume;
	}

	@Column(name = "expected_salary")
	public int getExpectedSalary() {
		return this.expectedSalary;
	}

	public void setExpectedSalary(int expectedSalary) {
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

}
