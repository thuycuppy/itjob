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
                    <c:if test="${param.success != null}">
                        <div class="alert alert-success alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            Your resume has been sent. Company will contact you soon!
                        </div>
                    </c:if>

                    <c:if test="${param.error1 != null}">
                        <div class="alert alert-danger alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            You do not have permission to perform this feature!
                        </div>
                    </c:if>

                    <c:if test="${param.error2 != null}">
                        <div class="alert alert-danger alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            You do not have a resume yet. Please update your personal information!
                        </div>
                    </c:if>

                    <c:if test="${param.error3 != null}">
                        <div class="alert alert-danger alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            You applied this job!
                        </div>
                    </c:if>

                    <div class="col-md-9 col-sm-12 col-xs-12">
                        <div class="company-img">
                            <img src="${job.company.logo}" alt="${job.company.name}">
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
                        <sec:authorize access="hasAnyRole('CANDIDATE')">
                        <div class="apply-job">
                            <a href="/job/${job.id}/apply" class="btn btn-default"><i class="fa fa-upload"></i> Apply Now</a>
                        </div>
                        </sec:authorize>
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