<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="job-breadcrumb">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-7 co-xs-12 text-left">
                <h3>Company Detail</h3>
            </div>
            <div class="col-md-6 col-sm-5 co-xs-12 text-right">
                <div class="bread">
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a> </li>
                        <li class="active">Company Detail</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="single-job-section single-job-section-2">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="single-job-detail-box">
                    <div class="col-md-9 col-sm-12 col-xs-12">
                        <div class="company-img">
                            <img src="${company.logo}" alt="${company.name}">
                        </div>
                        <div class="job-detail-2">
                            <h2>${company.name}</h2>
                            <div class="job-detail-meta">
                                <ul>
                                    <li><i class="fa fa-map-marker"></i> ${company.location}</li>
                                    <li><i class="fa fa-dollar"></i> ${company.companyType}</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="col-md-8 col-sm-12 col-xs-12">
                    <div class="single-job-page-2 job-short-detail">
                        <div class="heading-inner">
                            <p class="title">Company Introduction</p>
                        </div>
                        <div class="job-desc job-detail-boxes">
                            <p>${company.description}</p>
                        </div>
                        <div class="heading-inner">
                            <p class="title">Jobs Posted</p>
                        </div>
                        <div id="jobs" class="all-jobs-list-box2"></div>
                        <div class="load-more-btn">
                            <button id="btnLoadMoreJob" class="btn-default" onclick="loadPage();">
                                Load More <i class="fa fa-refresh"></i>
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12 col-xs-12">
                    <aside>
                        <div class="company-detail widget">
                            <div class="widget-heading"><span class="title">Company Detail</span></div>
                            <div class="company-contact-detail">
                                <table>
                                    <tr>
                                        <th>Name:</th>
                                        <td>${company.name}</td>
                                    </tr>
                                    <tr>
                                        <th>Quantity:</th>
                                        <td>${company.quantity}</td>
                                    </tr>
                                    <tr>
                                        <th>Website:</th>
                                        <td><a href="${company.website}">${company.website}</a></td>
                                    </tr>
                                    <tr>
                                        <th>Phone:</th>
                                        <td>${company.phone}</td>
                                    </tr>
                                    <tr>
                                        <th>Address:</th>
                                        <td>${company.address}</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </aside>
                </div>
            </div>
        </div>
    </div>
</section>

<script>

</script>

<script type="text/x-tmpl" id="tmpl-jobs">
{% for (var i = 0; i < o.length; i++) { %}
<div class="job-box job-box-2">
    <div class="col-md-2 col-sm-2 col-xs-12 hidden-sm">
        <div class="comp-logo">
            <a href="/company/{%=o[i].companyId%}"><img src="/{%=o[i].companyLogo%}" class="img-responsive" alt="{%=o[i].companyName%}"> </a>
        </div>
    </div>
    <div class="col-md-10 col-sm-10 col-xs-12">
        <div class="job-title-box">
            <a href="/job/{%=o[i].id%}">
                <div class="job-title">{%=o[i].title%}</div>
            </a>
            <a href="/job/{%=o[i].id%}">
                <span class="comp-name">{%=o[i].companyName%}</span>
            </a>
            <a href="/job/{%=o[i].id%}" class="job-type jt-remote-color"><i class="fa fa-clock-o"></i> {%=o[i].jobType%}</a>
        </div>
        <p>{%=o[i].description%}<a href="/job/{%=o[i].id%}">Read More</a> </p>
    </div>
    <div class="job-salary"><i class="fa fa-money"></i> {%=o[i].salary%}</div>
</div>
{% } %}
</script>

<script src="/js/app/company_detail.js"></script>