<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
                    <c:if test="${not empty success}">
                        <div class="alert alert-success">
                            <p>${success}</p>
                        </div>
                    </c:if>
                    <div class="Heading-title black">
                        <h3>Post Your Job</h3>
                    </div>
                    <c:url value="/company-manager/post-job" var="action" />
                    <div class="row">
                        <form:form action="${action}" method="POST" modelAttribute="postJobReq">
                            <!-- Job title -->
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label>Job Title <span class="required">*</span></label>
                                    <form:input path="title" cssClass="form-control" />
                                    <c:set var="titleErrors"><form:errors path="title"/></c:set>
                                    <c:if test="${not empty titleErrors}">
                                        <div class="field-error">
                                            <i class="fa fa-exclamation-circle"></i>
                                            <form:errors path="title" delimiter="<br><i class='fa fa-exclamation-circle'></i> " />
                                        </div>
                                    </c:if>
                                </div>
                            </div>

                            <!-- Job salary -->
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label>Job Salary ($) <span class="required">*</span></label>
                                    <form:input path="salary" cssClass="form-control" />
                                    <c:set var="salaryErrors"><form:errors path="salary"/></c:set>
                                    <c:if test="${not empty salaryErrors}">
                                        <div class="field-error">
                                            <i class="fa fa-exclamation-circle"></i>
                                            <form:errors path="salary" delimiter="<br><i class='fa fa-exclamation-circle'></i> " />
                                        </div>
                                    </c:if>
                                </div>
                            </div>

                            <!-- Location -->
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label>Location</label>
                                    <form:select path="location" items="${locations}" itemValue="id" itemLabel="name" cssClass="form-control select2" />
                                </div>
                            </div>

                            <!-- Skills -->
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label>Skills <span class="required">*</span></label>
                                    <form:select multiple="true" path="skills" items="${skills}" itemValue="id" itemLabel="name" cssClass="form-control select2" />
                                    <c:set var="skillsError"><form:errors path="skills"/></c:set>
                                    <c:if test="${not empty skillsError}">
                                        <div class="field-error">
                                            <i class="fa fa-exclamation-circle"></i>
                                            <form:errors path="skills" delimiter="<br><i class='fa fa-exclamation-circle'></i> " />
                                        </div>
                                    </c:if>
                                </div>
                            </div>

                            <!-- Job type -->
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label>Job Type</label>
                                    <form:select path="jobType" items="${jobTypes}" itemValue="id" itemLabel="name" cssClass="form-control select2" />
                                </div>
                            </div>

                            <!-- Experience -->
                            <div class="col-md-6 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label>Job Experience</label>
                                    <form:select path="experience" items="${experiences}" itemValue="id" itemLabel="name" cssClass="form-control select2" />
                                </div>
                            </div>

                            <!-- Description -->
                            <div class="col-md-12 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label>Description <span class="required">*</span></label>
                                    <form:textarea path="description" cssClass="form-control" />
                                    <c:set var="descriptionErrors"><form:errors path="description"/></c:set>
                                    <c:if test="${not empty descriptionErrors}">
                                        <div class="field-error">
                                            <i class="fa fa-exclamation-circle"></i>
                                            <form:errors path="description" delimiter="<br><i class='fa fa-exclamation-circle'></i> " />
                                        </div>
                                    </c:if>
                                </div>
                            </div>

                            <!-- Requirement -->
                            <div class="col-md-12 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <label>Requirement <span class="required">*</span></label>
                                    <form:textarea path="requirement" cssClass="form-control" />
                                    <c:set var="requirementErrors"><form:errors path="requirement"/></c:set>
                                    <c:if test="${not empty requirementErrors}">
                                        <div class="field-error">
                                            <i class="fa fa-exclamation-circle"></i>
                                            <form:errors path="requirement" delimiter="<br><i class='fa fa-exclamation-circle'></i> " />
                                        </div>
                                    </c:if>
                                </div>
                            </div>

                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <button type="submit" class="btn btn-default pull-right">
                                    Publish Job <i class="fa fa-angle-right"></i>
                                </button>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="/js/app/company_post_job.js"></script>