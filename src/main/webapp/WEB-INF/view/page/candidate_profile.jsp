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
                        <img src="${candidate.avatar}" class="img-responsive img-circle" alt="">
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
                <div class="heading-inner first-heading">
                    <p class="title">Edit Profile</p>
                </div>
                <div class="col-md-12 col-sm-12 col-xs-12 nopadding">
                    <div class="profile-edit row">
                        <form>
                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label>Full Name <span class="required">*</span></label>
                                    <input type="text" placeholder="" class="form-control">
                                </div>
                            </div>

                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label>Date Of Birth<span class="required">*</span></label>
                                    <input type="text" placeholder="" class="form-control">
                                </div>
                            </div>

                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label>Email <span class="required">*</span></label>
                                    <input type="email" placeholder="" class="form-control">
                                </div>
                            </div>

                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label>Phone <span class="required">*</span></label>
                                    <input type="text" placeholder="" class="form-control">
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
                                    <label>Sex: <span class="required">*</span></label>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="role" value="company" checked>Female
                                        </label>
                                    </div>
                                    <div class="radio">
                                        <label>
                                            <input type="radio" name="role" value="candidate">Male
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12 col-sm-12">
                                <div class="input-group image-preview form-group">
                                    <label>Profile Image: <span class="required">*</span></label>
                                    <input type="text" placeholder="Upload Profile Image" class="form-control image-preview-filename" disabled="disabled">
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
                                <div class="input-group image-preview form-group">
                                    <label>Resume: <span class="required">*</span></label>
                                    <input type="text" placeholder="Upload Your Resume" class="form-control image-preview-filename" disabled="disabled">
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
                                    <label>About yourSelf <span class="required">*</span></label>
                                    <textarea cols="6" rows="8" placeholder="" class="form-control"></textarea>
                                </div>
                            </div>

                            <div class="heading-inner first-heading">
                                <p class="title">Expected Job</p>
                            </div>
                            <div class="col-md-12 col-sm-12">
                                <div class="form-group">
                                    <label>Location <span class="required">*</span></label>
                                    <input type="location" placeholder="" class="form-control">
                                </div>
                            </div>

                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label>Skills</label>
                                    <select class="questions-category form-control" multiple="multiple">
                                        <option value="0">All Skills</option>
                                        <option value="1">Java</option>
                                        <option value="2">Android</option>
                                        <option value="3">.NET</option>
                                        <option value="4">C#</option>
                                        <option value="5">C++</option>
                                        <option value="6">Ruby</option>
                                        <option value="7">Python</option>
                                        <option value="8">Front End</option>
                                        <option value="10">Back End</option>
                                        <option value="11">Tester</option>
                                    </select>
                                </div>
                            </div>



                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label>Job Type</label>
                                    <select class="questions-category form-control">
                                        <option value="0">Full Time</option>
                                        <option value="1">Part Time</option>
                                        <option value="2">Remote</option>
                                        <option value="3">Freelancer</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label>Job Experience</label>
                                    <select class="questions-category form-control">
                                        <option value="0">Fresher</option>
                                        <option value="1">Senior</option>
                                        <option value="2">Junior</option>
                                        <option value="3">PM</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-6 col-sm-12">
                                <div class="form-group">
                                    <label>Expected Salary</label>
                                    <select class="questions-category form-control">
                                        <option value="0">Less than 10,000</option>
                                        <option value="1">10,000 +</option>
                                        <option value="2">20,000 +</option>
                                        <option value="3">30,000 +</option>
                                        <option value="4">40,000 +</option>
                                        <option value="5">50,000 +</option>
                                        <option value="6">100,000 +</option>
                                        <option value="7">Negotiable</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-12 col-sm-12">
                                <button class="btn btn-default pull-right"> Save Profile <i class="fa fa-angle-right"></i>
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>