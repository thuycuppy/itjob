<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="breadcrumb-search parallex">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12 nopadding">
                <div class="col-md-8 col-sm-12 col-md-offset-2 col-xs-12 nopadding">
                    <div class="search-form-contaner">
                        <form class="form-inline">
                            <div class="col-md-10 col-sm-10 col-xs-12 nopadding">
                                <div class="form-group">
                                    <select id="select2-search-job" class="form-control"></select>
                                </div>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-12 nopadding">
                                <div class="form-group form-action">
                                    <button type="button" id="btnSearch" class="btn btn-default btn-search-submit">
                                        Search <i class="fa fa-angle-right"></i>
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="categories-list-page light-grey">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12 nopadding">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="Heading-title black">
                        <h1>List Jobs</h1>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium</p>
                    </div>
                </div>

                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div id="jobs" class="all-jobs-list-box2"></div>
                    <div class="load-more-btn">
                        <button id="btnLoadMoreJob" class="btn-default" onclick="loadPage();">
                            Load More <i class="fa fa-refresh"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script type="text/x-tmpl" id="tmpl-jobs">
{% for (var i = 0; i < o.length; i++) { %}
    <div class="job-box job-box-2">
        <div class="col-md-2 col-sm-2 col-xs-12 hidden-sm hidden-xs">
            <div class="comp-logo">
                <a href="/company/{%=o[i].companyId%}">
                    <img src="{%=o[i].companyLogo%}" class="img-responsive" alt="{%=o[i].companyName%}">
                </a>
            </div>
        </div>
        <div class="col-md-10 col-sm-10 col-xs-12">
            <div class="job-title-box">
                <a href="/job/{%=o[i].id%}">
                    <div class="job-title">{%=o[i].title%}</div>
                </a>
                <a href="/company/{%=o[i].companyId%}"><span class="comp-name">{%=o[i].companyName%}</span></a>
                <span class="job-type jt-remote-color">
                    <i class="fa fa-clock-o"></i> {%=o[i].jobType%}
                </span>
            </div>
            <p>{%=o[i].description%}<a href="/job/{%=o[i].id%}">Read More</a> </p>
        </div>
        <div class="job-salary">
            <i class="fa fa-money"></i> &dollar;{%=o[i].salary%}
        </div>
    </div>
{% } %}
</script>

<script src="/js/app/job_list.js"></script>