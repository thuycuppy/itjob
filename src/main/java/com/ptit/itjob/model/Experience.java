package com.ptit.itjob.model;

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

@Entity
@Table(name = "experience", catalog = "itjob")
public class Experience implements java.io.Serializable {

	private static final long serialVersionUID = -5402406163957103869L;
	private Integer id;
	private String name;
	private Set<Candidate> candidates = new HashSet<Candidate>(0);
	private Set<Job> jobs = new HashSet<Job>(0);

	public Experience() {
	}

	public Experience(String name) {
		this.name = name;
	}

	public Experience(String name, Set<Candidate> candidates, Set<Job> jobs) {
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

	@Column(name = "name", nullable = false)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "experience")
	public Set<Candidate> getCandidates() {
		return this.candidates;
	}

	public void setCandidates(Set<Candidate> candidates) {
		this.candidates = candidates;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "experience")
	public Set<Job> getJobs() {
		return this.jobs;
	}

	public void setJobs(Set<Job> jobs) {
		this.jobs = jobs;
	}

}
