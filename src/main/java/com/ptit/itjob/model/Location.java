package com.ptit.itjob.model;
// Generated Nov 11, 2017 10:15:30 AM by Hibernate Tools 5.2.6.Final

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
 * Location generated by hbm2java
 */
@Entity
@Table(name = "location", catalog = "itjob")
public class Location implements java.io.Serializable {

	private Integer id;
	private String name;
	private Set<Candidate> candidates = new HashSet<Candidate>(0);
	private Set<Job> jobsForJobtypeId = new HashSet<Job>(0);
	private Set<Job> jobsForLocationId = new HashSet<Job>(0);
	private Set<Company> companies = new HashSet<Company>(0);

	public Location() {
	}

	public Location(String name) {
		this.name = name;
	}

	public Location(String name, Set<Candidate> candidates, Set<Job> jobsForJobtypeId, Set<Job> jobsForLocationId,
			Set<Company> companies) {
		this.name = name;
		this.candidates = candidates;
		this.jobsForJobtypeId = jobsForJobtypeId;
		this.jobsForLocationId = jobsForLocationId;
		this.companies = companies;
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

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "location")
	public Set<Candidate> getCandidates() {
		return this.candidates;
	}

	public void setCandidates(Set<Candidate> candidates) {
		this.candidates = candidates;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "locationByJobtypeId")
	public Set<Job> getJobsForJobtypeId() {
		return this.jobsForJobtypeId;
	}

	public void setJobsForJobtypeId(Set<Job> jobsForJobtypeId) {
		this.jobsForJobtypeId = jobsForJobtypeId;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "locationByLocationId")
	public Set<Job> getJobsForLocationId() {
		return this.jobsForLocationId;
	}

	public void setJobsForLocationId(Set<Job> jobsForLocationId) {
		this.jobsForLocationId = jobsForLocationId;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "location")
	public Set<Company> getCompanies() {
		return this.companies;
	}

	public void setCompanies(Set<Company> companies) {
		this.companies = companies;
	}

}
