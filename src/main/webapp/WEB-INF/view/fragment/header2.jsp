<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<header id="header2" class="navbar transparent-header fa-change-white">
     <nav id="menu-1" class="mega-menu" data-color="">
         <section class="menu-list-items container">
            <ul class="menu-logo">
                <li>
                    <a href="#"> <img src="img/logo.png" alt="logo" class="img-responsive"> </a>
                </li>
            </ul>
            <ul class="menu-links pull-right">
                <li><a href="/">Home</a></li>
                <li><a href="/job">All Jobs</a></li>
                <li><a href="/company">All Companies</a></li>
                <sec:authorize access="isAnonymous()">
                 <li class="no-bg">
                 	<a href="login" class="p-job">
                    	<i class="fa fa-user"></i> Login
                    </a>
                 </li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                	<sec:authentication var="principal" property="principal" />
                	<c:set var="account" value="${principal.getAccount()}" />
                	<li class="profile-pic">
	                   <a href="javascript:void(0)"> 
	                   	<img src="${account.avatar}" alt="user-img" class="img-circle" width="36">
	                   	<span class="hidden-xs hidden-sm">${account.name} </span>
	                   	<i class="fa fa-angle-down fa-indicator"></i> 
	                   </a>
	                   <ul class="drop-down-multilevel left-side">
                   	    <li><a href="candidate.html"><i class="fa fa-user"></i> My Profile</a></li>
             	        <li><a href="candidate-edit-profile"><i class="fa fa-gear"></i> Account Setting</a></li>
	                    <li><a href="logout"><i class="fa fa-power-off"></i> Logout</a></li>
	                   </ul>
              		</li>
                </sec:authorize>
            </ul>
        </section>
    </nav>
</header>