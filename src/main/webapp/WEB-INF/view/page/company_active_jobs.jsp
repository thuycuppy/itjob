<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="job-breadcrumb">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-7 co-xs-12 text-left">
                <h3>Active Jobs</h3>
            </div>
            <div class="col-md-6 col-sm-5 co-xs-12 text-right">
                <div class="bread">
                    <ol class="breadcrumb">
                        <li><a href="/">Home</a> </li>
                        <li><a href="/company-manager/profile">Company Manager</a></li>
                        <li class="active">Active Jobs</li>
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
                    <p class="title">Active Jobs</p>
                </div>
                <div class="table-responsive">
                    <table class="table table-striped table-bordered">
                        <thead>
                        <tr>
                            <th width="78%">Job</th>
                            <th class="text-center" width="22%">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="job" items="${jobs.content}" varStatus="loop">
                            <tr>
                                <th>${job.title}</th>
                                <td>
                                    <a href="/job/${job.id}" class="btn btn-success">Detail</a>
                                    <a href="/company-manager/job/${job.id}/resume" class="btn btn-danger">Resume</a>
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
                                <li><a href="/company-manager/active-jobs?page=1"><span aria-hidden="true">«</span></a></li>
                            </c:otherwise>
                        </c:choose>
                        <c:forEach var="page" begin="${pagination.beginIndex}" end="${pagination.endIndex}">
                            <c:choose>
                                <c:when test="${page == pagination.currentIndex}">
                                    <li class="active"><a href="/company-manager/active-jobs?page=${page}">${page}</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="/company-manager/active-jobs?page=${page}">${page}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:choose>
                            <c:when test="${pagination.currentIndex == job.totalPages}">
                                <li class="disabled"><a href="#"><span aria-hidden="true">»</span></a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="/company-manager/active-jobs?page=${jobs.totalPages}"><span aria-hidden="true">»</span></a></li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>