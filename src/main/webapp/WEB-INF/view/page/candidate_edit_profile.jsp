<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
                            <li>
                                <a href="/candidate-manager/profile"> <i class="fa fa-user"></i> Profile</a>
                            </li>
                            <li class="active">
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
                <c:url value="/candidate-manager/edit-profile" var="action" />
                <form:form action="${action}" method="POST" modelAttribute="req" enctype="multipart/form-data">
                <div class="heading-inner first-heading">
                    <p class="title">Edit Profile</p>
                </div>
                <div class="col-md-12 col-sm-12 col-xs-12 nopadding">
                    <div class="profile-edit row">
                        <!-- Candidate name -->
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label>Your Name <span class="required">*</span></label>
                                <form:input path="name" cssClass="form-control" />
                                <c:set var="nameErrors"><form:errors path="name"/></c:set>
                                <c:if test="${not empty nameErrors}">
                                    <div class="field-error">
                                        <i class="fa fa-exclamation-circle"></i>
                                        <form:errors path="name" delimiter="<br><i class='fa fa-exclamation-circle'></i> " />
                                    </div>
                                </c:if>
                            </div>
                        </div>

                        <!-- Candidate birthday -->
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label>Date Of Birth<span class="required">*</span></label>
                                <form:input path="dob" cssClass="form-control datepicker" />
                                <c:set var="dobErrors"><form:errors path="dob"/></c:set>
                                <c:if test="${not empty dobErrors}">
                                    <div class="field-error">
                                        <i class="fa fa-exclamation-circle"></i>
                                        <form:errors path="dob" delimiter="<br><i class='fa fa-exclamation-circle'></i> " />
                                    </div>
                                </c:if>
                            </div>
                        </div>

                        <!-- Candidate phone -->
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label>Phone <span class="required">*</span></label>
                                <form:input path="phone" cssClass="form-control" />
                                <c:set var="phoneErrors"><form:errors path="phone"/></c:set>
                                <c:if test="${not empty phoneErrors}">
                                    <div class="field-error">
                                        <i class="fa fa-exclamation-circle"></i>
                                        <form:errors path="phone" delimiter="<br><i class='fa fa-exclamation-circle'></i> " />
                                    </div>
                                </c:if>
                            </div>
                        </div>

                        <!-- Candidate address -->
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label>Address <span class="required">*</span></label>
                                <form:input path="address" cssClass="form-control" />
                                <c:set var="addressErrors"><form:errors path="address"/></c:set>
                                <c:if test="${not empty addressErrors}">
                                    <div class="field-error">
                                        <i class="fa fa-exclamation-circle"></i>
                                        <form:errors path="address" delimiter="<br><i class='fa fa-exclamation-circle'></i> " />
                                    </div>
                                </c:if>
                            </div>
                        </div>

                        <!-- Candidate sex -->
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label>Sex:</label>
                                <label class="radio-inline">
                                    <form:radiobutton path="sex" value="false" />Female
                                </label>
                                <label class="radio-inline">
                                    <form:radiobutton path="sex" value="true" />Male
                                </label>
                            </div>
                        </div>

                        <!-- Candidate avatar -->
                        <div class="col-md-12 col-sm-12">
                            <div class="input-group image-preview form-group">
                                <label>Avatar:</label>
                                <input type="text" placeholder="Upload Profile Image" class="form-control image-preview-filename" disabled="disabled">
                                <span class="input-group-btn">
                                    <button type="button" class="btn btn-default image-preview-clear" style="display:none;">
                                        <span class="glyphicon glyphicon-remove"></span> Clear
                                    </button>
                                    <div class="btn btn-default image-preview-input">
                                        <span class="glyphicon glyphicon-folder-open"></span>
                                        <span class="image-preview-input-title">Browse</span>
                                        <input type="file"  name="avatar" accept="image/jpeg" />
                                    </div>
                                </span>
                            </div>
                        </div>

                        <!-- Resume -->
                        <div class="col-md-12 col-sm-12">
                            <div class="input-group image-preview form-group">
                                <label>Resume:</label>
                                <input type="text" placeholder="Upload Your Resume" class="form-control image-preview-filename" disabled="disabled">
                                <span class="input-group-btn">
                                    <button type="button" class="btn btn-default image-preview-clear" style="display:none;">
                                        <span class="glyphicon glyphicon-remove"></span> Clear
                                    </button>
                                    <div class="btn btn-default image-preview-input">
                                        <span class="glyphicon glyphicon-folder-open"></span>
                                        <span class="image-preview-input-title">Browse</span>
                                        <input type="file" name="resume" accept="application/pdf" />
                                    </div>
                                </span>
                            </div>
                        </div>

                        <div class="col-md-12 col-sm-12">
                            <div class="form-group">
                                <label>About Yourself:</label>
                                <textarea cols="6" rows="8" placeholder="" id="description" class="form-control"></textarea>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="heading-inner first-heading">
                    <p class="title">Expected Job</p>
                </div>
                <div class="col-md-12 col-sm-12 col-xs-12 nopadding">
                    <div class="profile-edit row">
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label>Location</label>
                                <form:select path="location" items="${locations}" itemValue="id" itemLabel="name" cssClass="form-control select2" />
                            </div>
                        </div>

                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label>Skills</label>
                                <form:select multiple="true" path="skills" items="${skills}" itemValue="id" itemLabel="name" cssClass="form-control select2" />
                            </div>
                        </div>

                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label>Job Type</label>
                                <form:select path="jobType" items="${jobTypes}" itemValue="id" itemLabel="name" cssClass="form-control select2" />
                            </div>
                        </div>

                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label>Job Experience</label>
                                <form:select path="experience" items="${experiences}" itemValue="id" itemLabel="name" cssClass="form-control select2" />
                            </div>
                        </div>

                        <div class="col-md-12 col-sm-12">
                            <div class="form-group">
                                <label>Expected Salary</label>
                                <form:input path="expectedSalary" cssClass="form-control" />
                                <c:set var="expectedSalaryErrors"><form:errors path="expectedSalary"/></c:set>
                                <c:if test="${not empty expectedSalaryErrors}">
                                    <div class="field-error">
                                        <i class="fa fa-exclamation-circle"></i>
                                        <form:errors path="expectedSalary" delimiter="<br><i class='fa fa-exclamation-circle'></i> " />
                                    </div>
                                </c:if>
                            </div>
                        </div>

                        <div class="col-md-12 col-sm-12">
                            <button type="submit" class="btn btn-default pull-right">
                                Save Profile <i class="fa fa-angle-right"></i>
                            </button>
                        </div>
                    </div>
                </div>
                </form:form>
            </div>
        </div>
    </div>
</section>

<script src="/js/app/candidate_edit_profile.js"></script>