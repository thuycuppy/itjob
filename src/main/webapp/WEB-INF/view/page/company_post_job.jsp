<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="job-breadcrumb">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-7 co-xs-12 text-left">
                <h3>Post A Job</h3>
            </div>
            <div class="col-md-6 col-sm-5 co-xs-12 text-right">
                <div class="bread">
                    <ol class="breadcrumb">
                        <li><a href="/">Home</a> </li>
                        <li><a href="/company-manager/profile">Company Manager</a></li>
                        <li class="active">Post A Job</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="post-job">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="box-panel">
                    <div class="Heading-title black">
                        <h3>Post A job</h3>
                    </div>
                    <form class="row">
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <label>Job Title</label>
                                <input type="text" placeholder="Job Title" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <label>Location</label>
                                <input type="text" placeholder="Job Location" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <label>Skills</label>
                                <select class="form-control" multiple="multiple">
                                    <option value="0">All Skills</option>
                                    <option value="1">Java</option>
                                    <option value="2">Android</option>
                                    <option value="3">.NET</option>
                                    <option value="4">C#</option>
                                    <option value="5">C++</option>
                                    <option value="6">Ruby</option>
                                    <option value="7">Python</option>
                                    <option value="8">Front End</option>
                                    <option value="10">Back End</option>
                                    <option value="11">Tester</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <label>Job Type</label>
                                <select class="form-control">
                                    <option value="0">Full Time</option>
                                    <option value="1">Part Time</option>
                                    <option value="2">Remote</option>
                                    <option value="3">Freelancer</option>
                                </select>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <label>Job Experience</label>
                                <select class="questions-category form-control">
                                    <option value="0">Fresher</option>
                                    <option value="1">Senior</option>
                                    <option value="2">Junior</option>
                                    <option value="3">PM</option>

                                </select>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <label>Expected Salary</label>
                                <select class="questions-category form-control">
                                    <option value="0">Less than 10,000</option>
                                    <option value="1">10,000 +</option>
                                    <option value="2">20,000 +</option>
                                    <option value="3">30,000 +</option>
                                    <option value="1">40,000 +</option>
                                    <option value="2">50,000 +</option>
                                    <option value="3">100,000 +</option>
                                    <option value="3">Negotiable</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <label>Description</label>
                                <input type="text" placeholder="Job Description" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <label>Requirement</label>
                                <input type="text" placeholder="Job Requirement" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <button class="btn btn-default pull-right">Publish Job <i class="fa fa-angle-right"></i></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="/js/app/company_post_job.js"></script>