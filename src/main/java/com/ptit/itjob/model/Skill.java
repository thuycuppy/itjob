package com.ptit.itjob.model;

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
import javax.persistence.Table;

@Entity
@Table(name = "skill", catalog = "itjob")
public class Skill implements java.io.Serializable {

	private static final long serialVersionUID = -3814427766577528866L;
	private Integer id;
	private String name;
	private Set<Job> jobs = new HashSet<Job>(0);
	private Set<Candidate> candidates = new HashSet<Candidate>(0);

	public Skill() {
	}

	public Skill(String name) {
		this.name = name;
	}

	public Skill(String name, Set<Job> jobs, Set<Candidate> candidates) {
		this.name = name;
		this.jobs = jobs;
		this.candidates = candidates;
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

	@Column(name = "name", nullable = false)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "job_skill", catalog = "itjob", joinColumns = {
			@JoinColumn(name = "skill_id", nullable = false, updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "job_id", nullable = false, updatable = false) })
	public Set<Job> getJobs() {
		return this.jobs;
	}

	public void setJobs(Set<Job> jobs) {
		this.jobs = jobs;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "candidate_skill", catalog = "itjob", joinColumns = {
			@JoinColumn(name = "skill_id", nullable = false, updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "candidate_id", nullable = false, updatable = false) })
	public Set<Candidate> getCandidates() {
		return this.candidates;
	}

	public void setCandidates(Set<Candidate> candidates) {
		this.candidates = candidates;
	}

}
