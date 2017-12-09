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
                    <form>
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label>Name: <span class="required">*</span></label>
                                <input type="text" placeholder="" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label>Quantity: <span class="required">*</span></label>
                                <input type="text" placeholder="" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label>Type of Company:</label>
                                <select class="form-control select2">
                                    <c:forEach var="companyType" items="${companyTypes}">
                                        <option value="${companyType.id}">${companyType.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label>Location:</label>
                                <select class="form-control select2">
                                    <c:forEach var="location" items="${locations}">
                                        <option value="${location.id}">${location.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label>Address <span class="required">*</span></label>
                                <input type="text" placeholder="" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label>Website</label>
                                <input type="text" placeholder="" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <div class="form-group">
                                <label>Phone: <span class="required">*</span></label>
                                <input type="text" placeholder="" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-12">
                            <div class="input-group image-preview form-group">
                                <label>Logo: <span class="required">*</span></label>
                                <input type="text" placeholder="Upload company logo" class="form-control image-preview-filename" disabled="disabled">
                                <span class="input-group-btn">
                                    <button type="button" class="btn btn-default image-preview-clear" style="display:none;">
                                        <span class="glyphicon glyphicon-remove"></span> Clear
                                    </button>
                                    <div class="btn btn-default image-preview-input">
                                        <span class="glyphicon glyphicon-folder-open"></span>
                                        <span class="image-preview-input-title">Browse</span>
                                        <input type="file" accept="file_extension" name="input-file-preview" />
                                    </div>
                                </span>
                            </div>
                        </div>

                        <div class="col-md-12 col-sm-12">
                            <div class="form-group">
                                <label>About Company</label>
                                <textarea cols="6" rows="8" id="description" class="form-control"></textarea>
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-12">
                            <button class="btn btn-default pull-right"> Save Profile <i class="fa fa-angle-right"></i></button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="/js/app/company_edit_profile.js"></script>