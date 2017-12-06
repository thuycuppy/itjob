<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<section class="job-breadcrumb">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-7 co-xs-12 text-left">
                <h3>Applied Jobs</h3>
            </div>
            <div class="col-md-6 col-sm-5 co-xs-12 text-right">
                <div class="bread">
                    <ol class="breadcrumb">
                        <li><a href="/">Home</a> </li>
                        <li><a href="/candidate-manager/profile">Candidate Manager</a></li>
                        <li class="active">Applied Jobs</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="dashboard-body">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-sm-4 col-xs-12">
                <div class="profile-card">
                    <sec:authentication var="principal" property="principal" />
                    <c:set var="account" value="${principal.getAccount()}" />
                    <div class="banner">
                        <img src="/img/building.jpg" alt="" class="img-responsive">
                    </div>
                    <div class="user-image">
                        <img src="${account.avatar}" class="img-responsive img-circle" alt="">
                    </div>
                    <div class="card-body">
                        <h3>${account.name}</h3>
                    </div>
                    <ul class="social-network social-circle onwhite">
                        <li><a href="#" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                        <li><a href="#" class="icoTwitter" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                        <li><a href="#" class="icoGoogle" title="Google +"><i class="fa fa-google-plus"></i></a></li>
                        <li><a href="#" class="icoLinkedin" title="Linkedin +"><i class="fa fa-linkedin"></i></a></li>
                    </ul>
                </div>
                <div class="profile-nav">
                    <div class="panel">
                        <ul class="nav nav-pills nav-stacked">
                            <li>
                                <a href="/candidate-manager/profile"> <i class="fa fa-user"></i> Profile</a>
                            </li>
                            <li>
                                <a href="/candidate-manager/edit-profile"> <i class="fa fa-edit"></i> Edit Profile</a>
                            </li>
                            <li class="active">
                                <a href="/candidate-manager/applied-jobs"> <i class="fa fa-list-alt"></i> Jobs Applied</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-8 col-sm-8 col-xs-12">
                <div class="heading-inner first-heading">
                    <p class="title">Applied Jobs</p>
                </div>
                <div class="table-responsive">
                    <table class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <th class="text-center">#</th>
                            <th>Company</th>
                            <th>Job</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="application" items="${applications.content}" varStatus="loop">
                        <tr>
                            <th class="text-center">${loop.index + 1}</th>
                            <td><a href="/company/${application.companyId}">${application.companyName}</a></td>
                            <td><a href="/job/${application.jobId}">${application.jobTitle}</a></td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="pagination-box clearfix">
                    <ul class="pagination">
                        <c:choose>
                            <c:when test="${pagination.currentIndex == 1}">
                                <li class="disabled"><a href="#"><span aria-hidden="true">«</span></a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="/candidate-manager/applied-jobs?page=1"><span aria-hidden="true">«</span></a></li>
                            </c:otherwise>
                        </c:choose>
                        <c:forEach var="page" begin="${pagination.beginIndex}" end="${pagination.endIndex}">
                            <c:choose>
                                <c:when test="${page == pagination.currentIndex}">
                                    <li class="active"><a href="/candidate-manager/applied-jobs?page=${page}">${page}</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="/candidate-manager/applied-jobs?page=${page}">${page}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:choose>
                            <c:when test="${pagination.currentIndex == applications.totalPages}">
                                <li class="disabled"><a href="#"><span aria-hidden="true">»</span></a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="/candidate-manager/applied-jobs?page=${applications.totalPages}"><span aria-hidden="true">»</span></a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>