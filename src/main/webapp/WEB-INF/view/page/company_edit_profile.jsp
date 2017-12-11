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
                        <li><a href="/">Home</a> </li>
                        <li><a href="/company-manager/profile">Company Manager</a></li>
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
                <div class="profile-nav">
                    <div class="panel">
                        <ul class="nav nav-pills nav-stacked">
                            <li>
                                <a href="/company-manager/profile"> <i class="fa fa-user"></i> Profile</a>
                            </li>
                            <li class="active">
                                <a href="/company-manager/edit-profile"> <i class="fa fa-edit"></i> Edit Profile</a>
                            </li>
                            <li>
                                <a href="/company-manager/post-job"> <i class="fa fa-plus-square-o"></i>Post Job </a>
                            </li>
                            <li>
                                <a href="/company-manager/active-jobs"> <i class="fa fa-list-alt"></i> Active Jobs</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-8 col-sm-8 col-xs-12">
                <div class="heading-inner first-heading">
                    <p class="title">Edit Profile</p>
                </div>

                <div class="profile-edit row">
                    <c:if test="${not empty success}">
                        <div class="alert alert-success alert-dismissible" role="alert">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                ${success}
                        </div>
                    </c:if>

                    <c:url value="/company-manager/edit-profile" var="action" />
                    <form:form action="${action}" method="POST" modelAttribute="registerReq" enctype="multipart/form-data">
                        <!-- Company name -->
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label>Name: <span class="required">*</span></label>
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

                        <!-- Company quantity -->
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label>Quantity: <span class="required">*</span></label>
                                <form:input path="quantity" cssClass="form-control" />
                                <c:set var="quantityErrors"><form:errors path="quantity"/></c:set>
                                <c:if test="${not empty quantityErrors}">
                                    <div class="field-error">
                                        <i class="fa fa-exclamation-circle"></i>
                                        <form:errors path="quantity" delimiter="<br><i class='fa fa-exclamation-circle'></i> " />
                                    </div>
                                </c:if>
                            </div>
                        </div>

                        <!-- Company type -->
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label>Type of Company:</label>
                                <form:select path="companyType" cssClass="form-control select2">
                                    <c:forEach items="${companyTypes}" var="companyType">
                                        <c:choose>
                                            <c:when test="${companyType.id eq registerReq.companyType.id}">
                                                <option value="${companyType.id}" selected="true">${companyType.name}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${companyType.id}">${companyType.name}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </form:select>
                            </div>
                        </div>

                        <!-- Company location -->
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label>Location:</label>
                                <form:select path="location" cssClass="form-control select2">
                                    <c:forEach items="${locations}" var="location">
                                        <c:choose>
                                            <c:when test="${location.id eq registerReq.location.id}">
                                                <option value="${location.id}" selected="true">${location.name}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${location.id}">${location.name}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </form:select>
                            </div>
                        </div>

                        <!-- Company address -->
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

                        <!-- Company website -->
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label>Website:</label>
                                <form:input path="website" cssClass="form-control" />
                            </div>
                        </div>

                        <!-- Company phone -->
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label>Phone: <span class="required">*</span></label>
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


                        <div class="col-md-12 col-sm-12">
                            <label>Logo:</label>
                            <input type="file" name="logo" accept="image/jpeg">
                        </div>

                        <div class="col-md-12 col-sm-12" style="margin-top: 20px;">
                            <div class="form-group">
                                <label>About Company:</label>
                                <form:textarea path="description" cssClass="form-control" />
                            </div>
                        </div>

                        <div class="col-md-12 col-sm-12">
                            <button type="btnSumit" class="btn btn-default pull-right">
                                Save Profile <i class="fa fa-angle-right"></i>
                            </button>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="/js/app/company_edit_profile.js"></script>