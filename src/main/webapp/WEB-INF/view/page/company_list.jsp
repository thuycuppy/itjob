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

                <div class="col-md-12 col-sm-12 col-xs-12 nopadding">
                    <div id="cats-masonry">
                        <c:forEach var="company" items="${companies.content}">
                        <div class="col-md-4 col-sm-6 col-xs-12">
                            <a href="#">
                                <div class="company-list-box">
                                    <span class="company-list-img">
                                	    <img src="${company.logo}" class="img-responsive" alt="${company.name}">
                                    </span>
                                    <div class="company-list-box-detail">
                                        <h5>${company.name}</h5>
                                        <p>${company.address}</p>
                                        <div class="ratings">
                                            <span class="badge">${company.totalJobs} jobs</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                        </c:forEach>
                    </div>
                </div>

                <div class="col-md-12 col-sm-12 col-xs-12 nopadding">
                    <div class="pagination-box clearfix">
                        <ul class="pagination">
                            <c:choose>
                                <c:when test="${pagination.currentIndex == 1}">
                                    <li class="disabled"><a href="#"><span aria-hidden="true">«</span></a></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="/company?page=1"><span aria-hidden="true">«</span></a></li>
                                </c:otherwise>
                            </c:choose>
                            <c:forEach var="page" begin="${pagination.beginIndex}" end="${pagination.endIndex}">
                                <c:choose>
                                    <c:when test="${page == pagination.currentIndex}">
                                        <li class="active"><a href="/company?page=${page}">${page}</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li><a href="/company?page=${page}">${page}</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <c:choose>
                                <c:when test="${pagination.currentIndex == companies.totalPages}">
                                    <li class="disabled"><a href="#"><span aria-hidden="true">»</span></a></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="/company?page=${companies.totalPages}"><span aria-hidden="true">»</span></a></li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>