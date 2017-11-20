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
                                    <input type="text" class="form-control" name="keyword" placeholder="Search Keyword" value="">
                                    <i class="icon-magnifying-glass"></i>
                                </div>
                            </div>
                            <div class="col-md-2 col-sm-2 col-xs-12 nopadding">
                                <div class="form-group form-action">
                                    <button type="button" class="btn btn-default btn-search-submit">
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
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="Heading-title black">
                        <h1>List Companies</h1>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium</p>
                    </div>
                </div>

                <div id="companies" class="col-md-12 col-sm-12 col-xs-12 nopadding"></div>

                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="load-more-btn">
                        <button id="btnLoadMoreCompany" class="btn-default" onclick="loadPage();">
                            Load More <i class="fa fa-refresh"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    var currentPage = 0;

    $(document).ready(function() {
        loadPage();
    });

    function loadPage() {
        $.ajax({
            type: 'GET',
            url: '/ajax/company',
            data: {page: currentPage},
            success: function(res) {
                if (res.content.length > 0) {
                    $("#companies").append(tmpl('tmpl-companies', res.content));
                    currentPage++;
                }
                if (res.last) {
                    $("#btnLoadMoreCompany").remove();
                }
            },
            error: function(res) {
                console.log('ERR:' + res);
            }
        });
    }
</script>

<script type="text/x-tmpl" id="tmpl-companies">
{% for (var i = 0; i < o.length; i++) { %}
    <div class="col-md-4 col-sm-6 col-xs-12">
        <a href="/company/detail/{%=o[i].id%}">
            <div class="company-list-box">
                <span class="company-list-img">
                    <img src="/{%=o[i].logo%}" class="img-responsive" alt="{%=o[i].name%}">
                </span>
                <div class="company-list-box-detail">
                    <h5>{%=o[i].name%}</h5>
                    <p>{%=o[i].address%}</p>
                    <div class="ratings">
                        <span class="badge">{%=o[i].totalJobs%} jobs</span>
                    </div>
                </div>
            </div>
        </a>
    </div>
{% } %}
</script>