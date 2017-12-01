<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<section class="job-breadcrumb">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-7 co-xs-12 text-left">
                <h3>Job Detail</h3>
            </div>
            <div class="col-md-6 col-sm-5 co-xs-12 text-right">
                <div class="bread">
                    <ol class="breadcrumb">
                        <li><a href="/">Home</a> </li>
                        <li class="active">Job Detail</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="single-job-section single-job-section-2">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="single-job-detail-box">
                    <div class="col-md-9 col-sm-12 col-xs-12">
                        <div class="company-img">
                            <img src="/${job.company.logo}" alt="${job.company.name}">
                        </div>
                        <div class="job-detail-2">
                            <h2>${job.title}</h2>
                            <div class="job-detail-meta">
                                <ul>
                                    <li><i class="fa fa-map-marker"></i> ${job.location.name}</li>
                                    <li><i class="fa fa-money"></i> $${job.salary}</li>
                                    <li><i class="fa fa-clock-o"></i> ${job.jobType.name}</li>

                                </ul>
                            </div>
                            <div class="b-socials full-socials">
                                <ul class="list-unstyled">
                                    <li><a href="https://twitter.com/"><i class="fa fa-twitter fa-fw"></i>Tweet</a></li>
                                    <li><a href="https://www.facebook.com/"><i class="fa fa-facebook fa-fw"></i>Share</a></li>
                                    <li><a href="https://plus.google.com/"><i class="fa fa-google-plus fa-fw"></i>Google+</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-12 col-xs-12">
                        <div class="apply-job">
                            <a class="btn btn-default" data-toggle="modal" data-target="#myModal"><i class="fa fa-upload"></i>Apply Now</a>

                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="col-md-8 col-sm-12 col-xs-12">
                    <div class="single-job-page-2 job-short-detail">
                        <div class="heading-inner">
                            <p class="title">Job Description</p>
                        </div>
                        <div class="job-desc job-detail-boxes">
                            <p>${job.description}</p>
                        </div>
                        <div class="heading-inner">
                            <p class="title">Job Requirement</p>
                        </div>
                        <div class="job-desc job-detail-boxes">
                            <p>${job.requirement}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12 col-xs-12">
                    <div class="widget">
                        <div class="widget-heading"><span class="title">Short Discription</span></div>
                        <ul class="short-decs-sidebar">
                            <li>
                                <div><h4>Job Experience:</h4></div>
                                <div><i class="fa fa-clock-o"></i> ${job.experience.name}</div>
                            </li>
                            <li>
                                <div><h4>Skills:</h4></div>
                                <div>
                                    <i class="fa fa-pencil"></i>
                                    <c:forEach var="skill" items="${job.skills}">
                                        ${skill.name}
                                    </c:forEach>
                                </div>
                            </li>
                            <li>
                                <div><h4>Posted On:</h4></div>
                                <div><i class="fa fa-calendar"></i> <fmt:formatDate type="date" value="${job.createdAt}" /></div>
                            </li>
                        </ul>
                    </div>
                    <aside>
                        <div class="company-detail widget">
                            <div class="widget-heading"><span class="title">Company Detail</span></div>
                            <div class="company-contact-detail">
                                <table>
                                    <tr>
                                        <th>Name:</th>
                                        <td> ${job.company.name}</td>
                                    </tr>
                                    <tr>
                                        <th>Quantity:</th>
                                        <td> ${job.company.quantity}</td>
                                    </tr>
                                    <tr>
                                        <th>Phone:</th>
                                        <td> ${job.company.phone}</td>
                                    </tr>
                                    <tr>
                                        <th>Website:</th>
                                        <td> ${job.company.website}</td>
                                    </tr>
                                    <tr>
                                        <th>Address:</th>
                                        <td> ${job.company.address}</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </aside>
                </div>
            </div>
        </div>
    </div>
</section>