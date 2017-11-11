<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
	<head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <!--[if IE]>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
<![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ScriptsBundle">
    <title>IT Job</title>
    <link rel="icon" href="img/favicon.ico" type="image/x-icon">

    <!-- BOOTSTRAPE STYLESHEET CSS FILES -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- JQUERY MENU -->
    <link rel="stylesheet" href="css/mega_menu.min.css">

    <!-- ANIMATION -->
    <link rel="stylesheet" href="css/animate.min.css">

    <!-- OWl  CAROUSEL-->
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/owl.style.css">

    <!-- TEMPLATE CORE CSS -->
    <link rel="stylesheet" href="css/style.css">

    <!-- FOR THIS PAGE ONLY -->
    <link href="css/select2.min.css" rel="stylesheet" />

    <!-- FONT AWESOME -->
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/et-line-fonts.css" type="text/css">
	
    <!-- JavaScripts -->
    <script src="js/modernizr.js"></script>
	
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>

<body>
    <div class="page category-page">
        <div id="spinner">
            <div class="spinner-img"> <img alt="Opportunities Preloader" src="img/loader.gif" />
                <h2>Please Wait.....</h2>
            </div>
        </div>

        <nav id="menu-1" class="mega-menu fa-change-black" data-color=""> 
            <section class="menu-list-items container"> 
                <ul class="menu-logo">
                    <li>
                        <a href="#"> <img src="img/logo.png" alt="logo" class="img-responsive"> </a>
                    </li>
                </ul>
                <ul class="menu-links pull-right">
                    <li><a href="/">Home</a></li>
                    <li><a href="#">All Jobs</a></li>
                    <li><a href="#">All Companies</a></li>
                    <li><a href="javascript:void(0)"> Candidate <i class="fa fa-angle-down fa-indicator"></i></a>
                        <ul class="drop-down-multilevel">
                            <li><a href="users.html">Test</a></li>
                        </ul>
                    </li>
                    <li><a href="javascript:void(0)"> Company <i class="fa fa-angle-down fa-indicator"></i></a>
                        <ul class="drop-down-multilevel">
                            <li><a href="users.html">Test</a></li>
                        </ul>
                    </li>
                    <li class="no-bg">
                        <a href="#" class="p-job">
                            <i class="fa fa-user"></i> Login
                        </a>
                    </li>
                </ul>
            </section>
        </nav>
        <div class="clearfix"></div>
        
        <section class="job-breadcrumb">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-sm-7 co-xs-12 text-left">
                        <h3>Registration Page</h3>
                    </div>
                    <div class="col-md-6 col-sm-5 co-xs-12 text-right">
                        <div class="bread">
                            <ol class="breadcrumb">
                                <li><a href="/">Home</a> </li>
                                <li class="active">Registeration</li>
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
                        <div class="login-container">
                            <div class="loginbox">
                                <div class="loginbox-title">Sign Up using social accounts</div>
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
                                <c:url value="/register" var="action" />
                	 			<form:form action="${action}" method="POST" modelAttribute="registerDto">
                                <div class="form-group">
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
                                <div class="form-group">
                                    <label>Email: <span class="required">*</span></label>
                                    <form:input path="email" cssClass="form-control" />
									<c:set var="emailErrors"><form:errors path="email"/></c:set>
									<c:if test="${not empty emailErrors}">
									  <div class="field-error">
									    <i class="fa fa-exclamation-circle"></i> 
									    <form:errors path="email" delimiter="<br><i class='fa fa-exclamation-circle'></i> " />
									  </div>
									</c:if>
                                </div>
                                <div class="form-group">
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
                                <div class="form-group">
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
                                <div class="form-group">
                                    <label>Role: <span class="required">*</span></label>
                                   	<div class="radio">
                                      	<label>
                                      		<form:radiobutton path="role" value="ROLE_COMPANY" checked="checked" />Company
                                      </label>
                                    </div>
                                    <div class="radio">
                                      	<label>
                                          <form:radiobutton path="role" value="ROLE_CANDIDATE" />Candidate
                                    	</label>
                                    </div>
                                </div>
                                <div class="loginbox-forgot">
                                    <input type="checkbox"> I accept <a href="#">Term and consitions?</a>
                                </div>
                                <div class="loginbox-submit">
                                    <input type="submit" class="btn btn-default btn-block" value="Register">
                                </div>
                                </form:form>
                                <div class="loginbox-signup"> Already have account? <a href="login">Sign in</a> </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        
 		<div class="fixed-footer-1">
            <footer class="footer">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6 col-md-4 col-xs-12">
                            <div class="footer_block">
                                <a href="index-2.html" class="f_logo"><img src="img/logo.png" class="img-responsive" alt="logo"></a>
                                <p>Aoluptas sit aspernatur aut odit aut fugit, sed elits quias horisa hinoe magni  magni dolores eos qui ratione volust luptatem sequised .</p>
                                <div class="social-bar">
                                    <ul>
                                        <li>
                                            <a class="fa fa-twitter" href="#"></a>
                                        </li>
                                        <li>
                                            <a class="fa fa-pinterest" href="#"></a>
                                        </li>
                                        <li>
                                            <a class="fa fa-facebook" href="#"></a>
                                        </li>
                                        <li>
                                            <a class="fa fa-behance" href="#"></a>
                                        </li>
                                        <li>
                                            <a class="fa fa-instagram" href="#"></a>
                                        </li>
                                        <li>
                                            <a class="fa fa-linkedin" href="#"></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4 col-xs-12">
                            <div class="footer_block">
                                <h4>Hot Links</h4>
                                <ul class="footer-links">
                                    <li> <a href="#">Home</a> </li>
                                    <li> <a href="#">Jobs</a> </li>
                                    <li> <a href="#">Companies</a> </li>
                                    <li> <a href="#">Contact Us</a> </li>
                            
                                </ul>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-4 col-xs-12">
                            <div class="footer_block">
                                <h4>Contact Information</h4>
                                <ul class="personal-info">
                                    <li><i class="fa fa-map-marker"></i> 3rd Floor,Link Arcade Model Town, BBL, USA.</li>
                                    <li><i class="fa fa-envelope"></i> Support@domain.com</li>
                                    <li><i class="fa fa-phone"></i> (084)+ 123 45 67 890 </li>
                                    <li><i class="fa fa-clock-o"></i> Mon - Sun: 8:00 - 16:00</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
            <section class="footer-bottom-section">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="footer-bottom">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                            <p>Copyright �2017 - IT Jobs - All rights Reserved. Made By <a href="../../../themeforest.net/user/scriptsbundle.html"> ThuyLT </a></p>
                                            <p>Reproduction of material from ThuyLT without permission is strictly prohibited. </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>


        <a href="#" class="scrollup"><i class="fa fa-chevron-up"></i></a>

        <!-- JAVASCRIPT JS  -->
        <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
    
        <!-- JAVASCRIPT JS  --> 
        <script type="text/javascript" src="js/jquery-migrate-1.2.1.min.js"></script>

        <!-- BOOTSTRAP CORE JS -->
        <script type="text/javascript" src="js/bootstrap.min.js"></script>

        <!-- JQUERY SELECT -->
        <script type="text/javascript" src="js/select2.min.js"></script>

        <!-- MEGA MENU -->
        <script type="text/javascript" src="js/mega_menu.min.js"></script>

         

        <!-- JQUERY COUNTERUP -->
        <script type="text/javascript" src="js/counterup.js"></script>

        <!-- JQUERY WAYPOINT -->
        <script type="text/javascript" src="js/waypoints.min.js"></script>

        <!-- JQUERY REVEAL -->
        <script type="text/javascript" src="js/footer-reveal.min.js"></script>

        <!-- Owl Carousel -->
        <script type="text/javascript" src="js/owl-carousel.js"></script>

        <!-- CORE JS -->
        <script type="text/javascript" src="js/custom.js"></script>
    </div>
</body>

</html>