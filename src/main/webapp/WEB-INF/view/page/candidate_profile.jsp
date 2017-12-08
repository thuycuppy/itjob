<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="job-breadcrumb">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-7 co-xs-12 text-left">
                <h3>Profile</h3>
            </div>
            <div class="col-md-6 col-sm-5 co-xs-12 text-right">
                <div class="bread">
                    <ol class="breadcrumb">
                        <li><a href="/">Home</a></li>
                        <li><a href="/candidate-manager/profile">Candidate Manager</a></li>
                        <li class="active">Profile</li>
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
                    <div class="banner">
                        <img src="/img/building.jpg" alt="" class="img-responsive">
                    </div>
                    <div class="user-image">
                        <img src="${candidate.account.avatar}" class="img-responsive img-circle" alt="">
                    </div>
                    <div class="card-body">
                        <h3>${candidate.name}</h3>
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
                            <li class="active">
                                <a href="/candidate-manager/profile"> <i class="fa fa-user"></i> Profile</a>
                            </li>
                            <li>
                                <a href="/candidate-manager/edit-profile"> <i class="fa fa-edit"></i> Edit Profile</a>
                            </li>
                            <li>
                                <a href="/candidate-manager/applied-jobs"> <i class="fa fa-list-alt"></i> Jobs Applied</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-8 col-sm-8 col-xs-12">
                <div class="job-short-detail">
                    <div class="heading-inner">
                        <p class="title">Profile detail</p>
                    </div>
                    <dl>
                        <dt>Full Name:</dt>
                        <dd>${candidate.name}</dd>

                        <dt>Date Of Birth:</dt>
                        <dd>${candidate.dob}</dd>


                        <dt>Sex:</dt>
                        <dd>
                            <c:choose>
                                <c:when test="${candidate.sex}">Male</c:when>
                                <c:otherwise>Female</c:otherwise>
                            </c:choose>
                        </dd>

                        <dt>Phone:</dt>
                        <dd>${candidate.phone}</dd>

                        <dt>Email:</dt>
                        <dd>${candidate.account.email}</dd>

                        <dt>Address:</dt>
                        <dd>${candidate.address}</dd>

                        <dt>Resume: </dt>
                        <dd>
                            <c:if test="${candidate.resume != null}">
                                <a href="${candidate.resume}">View</a>
                            </c:if>
                        </dd>
                    </dl>
                </div>

                <div class="heading-inner">
                    <p class="title">Some Line About Me</p>
                </div>
                <p>${candidate.description}</p>

                <div class="heading-inner">
                    <p class="title">Expected Job</p>
                </div>
                <div class="job-short-detail">
                    <dl>
                        <dt>Skills:</dt>
                        <dd>
                            <c:forEach var="skill" items="${candidate.skills}">
                                ${skill.name}
                            </c:forEach>
                        </dd>

                        <dt>Job Type:</dt>
                        <dd>${candidate.jobType.name}</dd>

                        <dt>Location:</dt>
                        <dd>${candidate.location.name}</dd>


                        <dt>Experience:</dt>
                        <dd>${candidate.experience.name}</dd>

                        <dt>Salary:</dt>
                        <dd>${candidate.expectedSalary}</dd>
                    </dl>
                </div>
            </div>
        </div>
    </div>
</section>