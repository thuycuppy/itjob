<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="slidershow-bg parallex">
    <div class="container">
        <div class="row">
            <ul class="cb-slideshow">
                <li><span>Image 01</span></li>
                <li><span>Image 02</span></li>
                <li><span>Image 03</span></li>
                <li><span>Image 04</span></li>
            </ul>
            <div class="col-md-10 col-sm-12 col-md-offset-1 col-xs-12 nopadding">
                <div class="search-form-contaner">
                    <h1 class="search-main-title"> One million success stories. Start yours today </h1>
                    <form class="form-inline">
                        <div class="col-md-7 col-sm-7 col-xs-12 nopadding">
                            <div class="form-group">
                                <input type="text" class="form-control" name="keyword" placeholder="Search Keyword" value="">
                                <i class="icon-magnifying-glass"></i>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-3 col-xs-12 nopadding">
                            <div class="form-group">
                                <select class="select-location form-control">
                                	<c:forEach var="location" items="${locations}">
                                		<option value="${location.id}">${location.name}</option>
                                	</c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-2 col-sm-2 col-xs-12 nopadding">
                            <div class="form-group form-action">
                                <button type="button" class="btn btn-default btn-search-submit">Search <i class="fa fa-angle-right"></i></button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="light-grey">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="Heading-title black">
                    <h1>Latest Jobs</h1>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium</p>
                </div>
            </div>
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="all-jobs-list-box2">
                    <c:forEach var="latestJob" items="${latestJobs.content}">
                    <div class="job-box job-box-2">
                        <div class="col-md-2 col-sm-2 col-xs-12 hidden-sm">
                            <div class="comp-logo">
                                <a href="#"><img src="${latestJob.companyLogo}" class="img-responsive" alt="${latestJob.companyName}"> </a>
                            </div>
                        </div>
                        <div class="col-md-10 col-sm-10 col-xs-12">
                            <div class="job-title-box">
                                <a href="#" class="job-title">${latestJob.title}</a><br />
                                <a href="#"><span class="comp-name">${latestJob.companyName}</span></a>
                                <a href="#" class="job-type jt-remote-color"><i class="fa fa-clock-o"></i> ${latestJob.jobTypeName}</a>
                            </div>
                            <p>${latestJob.description}<a href="#">Read More</a> </p>
                        </div>
                        <div class="job-salary"> <i class="fa fa-money"></i> $${latestJob.salary}</div>
                    </div>
                    </c:forEach>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="load-more-btn">
                            <button class="btn-default">View All <i class="fa fa-angle-right"></i></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="featured-jobs">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="col-md-12 col-sm-12 col-xs-12">
                	<div class="Heading-title black">
                    	<h1>Top Companies</h1>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium</p>
                    </div>
                </div>
                <c:forEach var="topCompany" items="${topCompanies.content}">
                <div class="col-md-4 col-sm-6 col-xs-12">
               		<div class="company-list-box">
	                   	<span class="company-list-img">
	                       	<img src="${topCompany.logo}" class="img-responsive" alt="">
	                   	</span>
              	        <div class="company-list-box-detail">
                       		<h5>${topCompany.name}</h5>
                           	<p>${topCompany.address}</p>
                          	<div class="ratings"><span class="badge"> ${topCompany.totalJobs} jobs</span></div>
                        </div>
                    </div>
                </div>
                </c:forEach>
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="load-more-btn">
                        <button class="btn-default">View All <i class="fa fa-angle-right"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>