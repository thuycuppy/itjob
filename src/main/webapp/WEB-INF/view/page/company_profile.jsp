<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="job-breadcrumb">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-7 co-xs-12 text-left">
                <h3>Company Profile</h3>
            </div>
            <div class="col-md-6 col-sm-5 co-xs-12 text-right">
                <div class="bread">
                    <ol class="breadcrumb">
                        <li><a href="/">Home</a> </li>
                        <li class="active">Company Profile</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="dashboard-body">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="col-md-4 col-sm-4 col-xs-12">
                    <div class="profile-nav">
                        <div class="panel">
                            <ul class="nav nav-pills nav-stacked">
                                <li class="active">
                                    <a href="/company/profile"> <i class="fa fa-user"></i> Profile</a>
                                </li>
                                <li>
                                    <a href="/company/edit-profile"> <i class="fa fa-edit"></i> Edit Profile</a>
                                </li>
                                <li>
                                    <a href="/company/post-job"> <i class="fa fa-plus-square-o"></i>Post Job </a>
                                </li>
                                <li>
                                    <a href="/company/active-jobs"> <i class="fa fa-list-alt"></i> Active Jobs</a>
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
                            <dt>Name:</dt>
                            <dd>${company.name}</dd>

                            <dt>Type of Company:</dt>
                            <dd>${company.companyType.name}</dd>

                            <dt>No. of Employees</dt>
                            <dd>${company.quantity}</dd>

                            <dt>Phone:</dt>
                            <dd>${company.phone}</dd>

                            <dt>Website:</dt>
                            <dd>${company.website}</dd>

                            <dt>City:</dt>
                            <dd>${company.location.name}</dd>

                            <dt>Address:</dt>
                            <dd>${company.address}</dd>
                        </dl>
                    </div>
                    <div class="heading-inner">
                        <p class="title">Some Line About Our Company</p>
                    </div>
                    <p>${company.description}</p>
                </div>
            </div>
        </div>
    </div>
</section>