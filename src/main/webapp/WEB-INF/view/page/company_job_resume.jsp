<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="job-breadcrumb">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-7 co-xs-12 text-left">
                <h3>Job Resumes</h3>
            </div>
            <div class="col-md-6 col-sm-5 co-xs-12 text-right">
                <div class="bread">
                    <ol class="breadcrumb">
                        <li><a href="/">Home</a> </li>
                        <li><a href="/company-manager/profile">Company Manager</a></li>
                        <li class="active">Job Resumes</li>
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
                <div class="profile-nav">
                    <div class="panel">
                        <ul class="nav nav-pills nav-stacked">
                            <li>
                                <a href="/company-manager/profile"> <i class="fa fa-user"></i> Profile</a>
                            </li>
                            <li>
                                <a href="/company-manager/edit-profile"> <i class="fa fa-edit"></i> Edit Profile</a>
                            </li>
                            <li>
                                <a href="/company-manager/post-job"> <i class="fa fa-plus-square-o"></i> Post Job</a>
                            </li>
                            <li class="active">
                                <a href="/company-manager/active-jobs"> <i class="fa fa-list-alt"></i> Active Jobs</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-8 col-sm-8 col-xs-12">
                <div class="heading-inner first-heading">
                    <p class="title">Job Resume</p>
                </div>
                <div class="table-responsive">
                    <table class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <th class="text-center" width="5%">#</th>
                            <th width="55%">Candidate</th>
                            <th width="25%">Apply At</th>
                            <th width="15%">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="application" items="${applications.content}" varStatus="loop">
                            <tr>
                                <th class="text-center">${loop.index + 1}</th>
                                <td>${application.candidateName}</td>
                                <td>${application.createdAt}</td>
                                <td>
                                    <a href="${application.candidateResume}" class="btn btn-success">View Resume</a>
                                </td>
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
                                <li><a href="/company-manager/job/${jobId}/resume?page=1"><span aria-hidden="true">«</span></a></li>
                            </c:otherwise>
                        </c:choose>
                        <c:forEach var="page" begin="${pagination.beginIndex}" end="${pagination.endIndex}">
                            <c:choose>
                                <c:when test="${page == pagination.currentIndex}">
                                    <li class="active"><a href="/company-manager/job/${jobId}/resume?page=${page}">${page}</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="/company-manager/job/${jobId}/resume?page=${page}">${page}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:choose>
                            <c:when test="${pagination.currentIndex == applications.totalPages}">
                                <li class="disabled"><a href="#"><span aria-hidden="true">»</span></a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="/company-manager/job/${jobId}/resume?page=${applications.totalPages}"><span aria-hidden="true">»</span></a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>