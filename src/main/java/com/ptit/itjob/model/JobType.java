package com.ptit.itjob.model;
// Generated Dec 6, 2017 12:09:00 AM by Hibernate Tools 5.2.6.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * JobType generated by hbm2java
 */
@Entity
@Table(name = "job_type", catalog = "itjob")
public class JobType implements java.io.Serializable {

	private Integer id;
	private String name;
	private Set<Candidate> candidates = new HashSet<Candidate>(0);
	private Set<Job> jobs = new HashSet<Job>(0);

	public JobType() {
	}

	public JobType(String name, Set<Candidate> candidates, Set<Job> jobs) {
		this.name = name;
		this.candidates = candidates;
		this.jobs = jobs;
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

	@Column(name = "name")
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "jobType")
	public Set<Candidate> getCandidates() {
		return this.candidates;
	}

	public void setCandidates(Set<Candidate> candidates) {
		this.candidates = candidates;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "jobType")
	public Set<Job> getJobs() {
		return this.jobs;
	}

	public void setJobs(Set<Job> jobs) {
		this.jobs = jobs;
	}

}