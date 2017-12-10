<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
        
<section class="job-breadcrumb">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-7 co-xs-12 text-left">
                <h3>Candidate Register</h3>
            </div>
            <div class="col-md-6 col-sm-5 co-xs-12 text-right">
                <div class="bread">
                    <ol class="breadcrumb">
                        <li><a href="/">Home</a> </li>
                        <li class="active">Candidate Register</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="login-page light-blue">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="login-container" style="width: 700px">
                    <div class="loginbox">
                        <div class="loginbox-title">Sign up using social accounts</div>
                        <ul class="social-network social-circle onwhite">
                            <li><a href="#" class="icoFacebook" title="Facebook"><i class="fa fa-facebook"></i></a></li>
                            <li><a href="#" class="icoTwitter" title="Twitter"><i class="fa fa-twitter"></i></a></li>
                            <li><a href="#" class="icoGoogle" title="Google +"><i class="fa fa-google-plus"></i></a></li>
                            <li><a href="#" class="icoLinkedin" title="Linkedin +"><i class="fa fa-linkedin"></i></a></li>
                        </ul>
                        <div class="loginbox-or">
                            <div class="or-line"></div>
                            <div class="or">OR</div>
                        </div>
                        <c:url value="/candidate/register" var="action" />
        	 			<form:form action="${action}" method="POST" modelAttribute="req" enctype="multipart/form-data">
                            <!-- Candidate name -->
                            <div class="col-md-6 form-group">
                                <label>Your name: <span class="required">*</span></label>
                                <form:input path="name" cssClass="form-control" />
                                <c:set var="nameErrors"><form:errors path="name"/></c:set>
                                <c:if test="${not empty nameErrors}">
                                  <div class="field-error">
                                    <i class="fa fa-exclamation-circle"></i>
                                    <form:errors path="name" delimiter="<br><i class='fa fa-exclamation-circle'></i> " />
                                  </div>
                                </c:if>
                            </div>

                            <!-- Candidate email -->
                            <div class="col-md-6  form-group">
                                <label>Your Email: <span class="required">*</span></label>
                                <form:input path="email" cssClass="form-control" />
                                <c:set var="emailErrors"><form:errors path="email"/></c:set>
                                <c:if test="${not empty emailErrors}">
                                  <div class="field-error">
                                    <i class="fa fa-exclamation-circle"></i>
                                    <form:errors path="email" delimiter="<br><i class='fa fa-exclamation-circle'></i> " />
                                  </div>
                                </c:if>
                            </div>

                            <!-- Candidate password -->
                            <div class="col-md-6 form-group">
                                <label>Password: <span class="required">*</span></label>
                                <form:password path="password" cssClass="form-control" />
                                <c:set var="passwordErrors"><form:errors path="password"/></c:set>
                                <c:if test="${not empty passwordErrors}">
                                    <div class="field-error">
                                        <i class="fa fa-exclamation-circle"></i>
                                        <form:errors path="password" delimiter="<br><i class='fa fa-exclamation-circle'></i> " />
                                   </div>
                                </c:if>
                            </div>

                            <!-- Candidate confirm password -->
                            <div class="col-md-6 form-group">
                                <label>Confirm Password: <span class="required">*</span></label>
                                <form:password path="confirmPassword" cssClass="form-control" />
                                <c:set var="confirmPasswordErrors"><form:errors path="confirmPassword"/></c:set>
                                <c:if test="${not empty confirmPasswordErrors}">
                                  <div class="field-error">
                                    <i class="fa fa-exclamation-circle"></i>
                                    <form:errors path="confirmPassword" delimiter="<br><i class='fa fa-exclamation-circle'></i> " />
                                  </div>
                                </c:if>
                            </div>

                            <!-- Candidate resume -->
                            <div class="col-md-12 form-group">
                                <label>Your Resume:</label>
                                <input type="file" name="resume" accept="application/pdf">
                            </div>

                            <!-- Candidate birthday -->
                            <div class="col-md-6 form-group">
                                <label>Your Birthday: <span class="required">*</span></label>
                                <form:input path="dob" cssClass="form-control datepicker" />
                                <c:set var="dobErrors"><form:errors path="dob"/></c:set>
                                <c:if test="${not empty dobErrors}">
                                    <div class="field-error">
                                        <i class="fa fa-exclamation-circle"></i>
                                        <form:errors path="dob" delimiter="<br><i class='fa fa-exclamation-circle'></i> " />
                                    </div>
                                </c:if>
                            </div>

                            <!-- Candidate phone -->
                            <div class="col-md-6 form-group">
                                <label>Your Phone: <span class="required">*</span></label>
                                <form:input path="phone" cssClass="form-control" />
                                <c:set var="phoneErrors"><form:errors path="phone"/></c:set>
                                <c:if test="${not empty phoneErrors}">
                                    <div class="field-error">
                                        <i class="fa fa-exclamation-circle"></i>
                                        <form:errors path="phone" delimiter="<br><i class='fa fa-exclamation-circle'></i> " />
                                    </div>
                                </c:if>
                            </div>

                            <!-- Candidate sex -->
                            <div class="col-md-6 form-group">
                                <label>Your Sex:</label><br/>
                                <label class="radio-inline">
                                    <form:radiobutton path="sex" value="false" />Female
                                </label>
                                <label class="radio-inline">
                                    <form:radiobutton path="sex" value="true" />Male
                                </label>
                            </div>

                            <!-- Candidate address -->
                            <div class="col-md-6 form-group">
                                <label>Your Address: <span class="required">*</span></label>
                                <form:input path="address" cssClass="form-control" />
                                <c:set var="addressErrors"><form:errors path="address"/></c:set>
                                <c:if test="${not empty addressErrors}">
                                    <div class="field-error">
                                        <i class="fa fa-exclamation-circle"></i>
                                        <form:errors path="address" delimiter="<br><i class='fa fa-exclamation-circle'></i> " />
                                    </div>
                                </c:if>
                            </div>

                            <div class="loginbox-submit" style="padding: 0 15px">
                                <input type="submit" class="btn btn-default btn-block" value="Register">
                            </div>
                        </form:form>
                        <div class="loginbox-signup"> Already have account? <a href="/login">Sign in</a> </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>