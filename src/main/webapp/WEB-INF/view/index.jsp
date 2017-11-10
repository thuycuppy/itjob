<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
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
    <title>Opportunities A Mega Job Board Template</title>
    <link rel="icon" href="img/favicon.ico" type="image/x-icon">

    <!-- BOOTSTRAPE STYLESHEET CSS FILES -->
    <link rel="stylesheet" href="css/bootstrap.min.css">

    <!-- JQUERY SELECT -->
    <link href="css/select2.min.css" rel="stylesheet" />

    <!-- JQUERY MENU -->
    <link rel="stylesheet" href="css/mega_menu.min.css">

    <!-- ANIMATION -->
    <link rel="stylesheet" href="css/animate.min.css">

    <!-- OWl  CAROUSEL-->
    <link rel="stylesheet" href="css/owl.carousel.css">
    <link rel="stylesheet" href="css/owl.style.css">

    <!-- TEMPLATE CORE CSS -->
    <link rel="stylesheet" href="css/style.css">

    <!--  REVOLUTION STYLE SETTING -->
    <link href="js/revolution/css/settings.css" rel="stylesheet" type="text/css" />

    <!-- FONT AWESOME -->
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/et-line-fonts.css" type="text/css">
    <link rel="stylesheet" href="css/slideshowstyle.css" type="text/css">

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
    <div class="page">
        <div id="spinner">
            <div class="spinner-img"> <img alt="Opportunities Preloader" src="img/loader.gif" />
                <h2>Please Wait.....</h2>
            </div>
        </div>
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
                        <li><a href="#">All Jobs</a></li>
                        <li><a href="#">All Companies</a></li>
                        <sec:authorize access="isAnonymous()">
	                        <li class="no-bg">
	                            <a href="login" class="p-job">
	                                <i class="fa fa-user"></i> Login
	                            </a>
	                        </li>
                        </sec:authorize>
                        <sec:authorize access="isAuthenticated()">
                        	<sec:authentication var="principal" property="principal" />
                        	<c:set var="user" value="${principal.getUser()}" />
                        	<li class="profile-pic">
		                         <a href="javascript:void(0)"> 
		                         	<img src="${user.avatar}" alt="user-img" class="img-circle" width="36">
		                         	<span class="hidden-xs hidden-sm">${user.name} </span>
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

        <section class="slidershow-bg parallex">
            <div class="container">
                <div class="row">
                    <ul class="cb-slideshow">
                        <li><span>Image 01</span></li>
                        <li><span>Image 02</span></li>
                        <li><span>Image 03</span></li>
                        <li><span>Image 04</span></li>
                    </ul>
                    <div class="col-md-10 col-sm-12 col-md-offset-1 col-xs-12 nopadding">
                        <div class="search-form-contaner">
                            <h1 class="search-main-title"> One million success stories. Start yours today </h1>
                            <form class="form-inline">
                                <div class="col-md-7 col-sm-7 col-xs-12 nopadding">
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="keyword" placeholder="Search Keyword" value="">
                                        <i class="icon-magnifying-glass"></i>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-3 col-xs-12 nopadding">
                                    <div class="form-group">
                                        <select class="select-location form-control">
                                            <option value="0">Ha Noi</option>
                                            <option value="1">Da Nang</option>
                                            <option value="2">Thanh pho Ho Chi Minh</option>
                                            <option value="3">Hai Phong</option>
                                            <option value="4">Thanh Hoa</option>
                                           
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-2 col-sm-2 col-xs-12 nopadding">
                                    <div class="form-group form-action">
                                        <button type="button" class="btn btn-default btn-search-submit">Search <i class="fa fa-angle-right"></i></button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="light-grey">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="Heading-title black">
                            <h1>Latest Jobs</h1>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium</p>
                        </div>
                    </div>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="all-jobs-list-box2">
                            <div class="job-box job-box-2">
                                <div class="col-md-2 col-sm-2 col-xs-12 hidden-sm">
                                    <div class="comp-logo">
                                        <a href="#"><img src="img/company/5.png" class="img-responsive" alt="scriptsbundle"> </a>
                                    </div>
                                </div>
                                <div class="col-md-10 col-sm-10 col-xs-12">
                                    <div class="job-title-box">
                                        <a href="#">
                                            <div class="job-title"> Technical Documentation Specialist</div>
                                        </a> <a href="#"><span class="comp-name">conversi Pvt. Ltd. United States </span></a>
                                        <a href="#" class="job-type jt-full-time-color"> <i class="fa fa-clock-o"></i> Full time </a>
                                    </div>
                                    <p>Prompta numquam mel ad, tempor definiebas id usu, cum cu feugiat bonorum. Eu pri labores maiorum patrioque, sea an tation utinam. Idque albucius prodesset ei est, sea te vide contentiones consectetuer.......<a href="#">Read More</a> </p>
                                </div>
                                <div class="job-salary"> <i class="fa fa-money"></i> $400 - $500 </div>
                            </div>
                            <div class="job-box job-box-2">
                                <div class="col-md-2 col-sm-2 col-xs-12  hidden-xs hidden-sm">
                                    <div class="comp-logo">
                                        <a href="#"><img src="img/company/1.png" class="img-responsive" alt="scriptsbundle"> </a>
                                    </div>
                                </div>
                                <div class="col-md-10 col-sm-10 col-xs-12">
                                    <div class="job-title-box">
                                        <a href="#">
                                            <div class="job-title"> Assistant Engineer (IT/Networks)</div>
                                        </a> <a href="#"><span class="comp-name">conversi Pvt. Ltd. Malaysia</span></a>
                                        <a href="#" class="job-type jt-part-time-color"> <i class="fa fa-clock-o"></i> Part Time </a>
                                    </div>
                                    <p>Prompta numquam mel ad, tempor definiebas id usu, cum cu feugiat bonorum. Eu pri labores maiorum patrioque, sea an tation utinam. Idque albucius prodesset ei est, sea te vide contentiones consectetuer.......<a href="#">Read More</a> </p>
                                </div>
                                <div class="job-salary"> <i class="fa fa-money"></i> $200 - $300 </div>
                            </div>
                            <div class="job-box job-box-2">
                                <div class="col-md-2 col-sm-2 col-xs-12  hidden-xs hidden-sm">
                                    <div class="comp-logo">
                                        <a href="#"><img src="img/company/5.png" class="img-responsive" alt="scriptsbundle"> </a>
                                    </div>
                                </div>
                                <div class="col-md-10 col-sm-10 col-xs-12">
                                    <div class="job-title-box">
                                        <a href="#">
                                            <div class="job-title"> Technical Network Director (IT/Networks)</div>
                                        </a> <a href="#"><span class="comp-name">conversi Pvt. Ltd. United States</span></a>
                                        <a href="#" class="job-type jt-remote-color"> <i class="fa fa-clock-o"></i> Remote </a>
                                    </div>
                                    <p>Prompta numquam mel ad, tempor definiebas id usu, cum cu feugiat bonorum. Eu pri labores maiorum patrioque, sea an tation utinam. Idque albucius prodesset ei est, sea te vide contentiones consectetuer.......<a href="#">Read More</a> </p>
                                </div>
                                <div class="job-salary"> <i class="fa fa-money"></i> $200 - $250 </div>
                            </div>
                            <div class="job-box job-box-2">
                                <div class="col-md-2 col-sm-2 col-xs-12  hidden-xs hidden-sm">
                                    <div class="comp-logo">
                                        <a href="#"><img src="img/company/5.png" class="img-responsive" alt="scriptsbundle"> </a>
                                    </div>
                                </div>
                                <div class="col-md-10 col-sm-10 col-xs-12">
                                    <div class="job-title-box">
                                        <a href="#">
                                            <div class="job-title"> Technical Documentation Specialist</div>
                                        </a> <a href="#"><span class="comp-name">conversi Pvt. Ltd. United States</span></a>
                                        <a href="#" class="job-type jt-intern-color"> <i class="fa fa-clock-o"></i> Internship </a>
                                    </div>
                                    <p>Prompta numquam mel ad, tempor definiebas id usu, cum cu feugiat bonorum. Eu pri labores maiorum patrioque, sea an tation utinam. Idque albucius prodesset ei est, sea te vide contentiones consectetuer.......<a href="#">Read More</a> </p>
                                </div>
                                <div class="job-salary"> <i class="fa fa-money"></i> $100 - $150 </div>
                            </div>
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="load-more-btn">
                                    <button class="btn-default"> View All <i class="fa fa-angle-right"></i> </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="featured-jobs">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="Heading-title black">
                                <h1>Top Companies</h1>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium</p>
                            </div>
                        </div>
                         <div class="col-md-4 col-sm-6 col-xs-12">
                                    <a href="#">
                                        <div class="company-list-box">
                                            <span class="company-list-img">
                                    <img src="img/company-logo/2.png" class="img-responsive" alt="">
                                </span>
                                            <div class="company-list-box-detail">
                                                <h5> Creative Chaos (Pvt) Ltd </h5>
                                                <p>22 Hollow Streen, Free town, London </p>
                                                <div class="ratings"> <i class="fa fa-star color"></i> <i class="fa fa-star color"></i> <i class="fa fa-star color"></i> <i class="fa fa-star color"></i> <i class="fa fa-star-o"></i><span class="badge"> 4</span> </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-md-4 col-sm-6 col-xs-12">
                                    <a href="#">
                                        <div class="company-list-box">
                                            <span class="company-list-img">
                                    <img src="img/company-logo/3.png" class="img-responsive" alt="">
                                </span>
                                            <div class="company-list-box-detail">
                                                <h5> ICMS Education System  </h5>
                                                <p>36 Hollow Streen, Free town, Bangkok </p>
                                                <div class="ratings"> <i class="fa fa-star color"></i> <i class="fa fa-star color"></i> <i class="fa fa-star color"></i> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i><span class="badge"> 3</span> </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-md-4 col-sm-6 col-xs-12">
                                    <a href="#">
                                        <div class="company-list-box">
                                            <span class="company-list-img">
                                    <img src="img/company-logo/4.png" class="img-responsive" alt="">
                                </span>
                                            <div class="company-list-box-detail">
                                                <h5> Ovex Technologies Pvt. Ltd.  </h5>
                                                <p>602 Hollow Streen, Free town, Paris </p>
                                                <div class="ratings"> <i class="fa fa-star color-red"></i> <i class="fa fa-star color-red"></i> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i><span class="badge"> 2</span> </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-md-4 col-sm-6 col-xs-12">
                                    <a href="#">
                                        <div class="company-list-box">
                                            <span class="company-list-img">
                                    <img src="img/company-logo/5.png" class="img-responsive" alt="">
                                </span>
                                            <div class="company-list-box-detail">
                                                <h5> Medecins Sans Frontieres  </h5>
                                                <p>101 Hollow Streen, Free town, sydney </p>
                                                <div class="ratings"> <i class="fa fa-star color-red"></i> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i> <i class="fa fa-star-o"></i><span class="badge"> 1</span> </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-md-4 col-sm-6 col-xs-12">
                                    <a href="#">
                                        <div class="company-list-box">
                                            <span class="company-list-img">
                                    <img src="img/company-logo/6.png" class="img-responsive" alt="">
                                </span>
                                            <div class="company-list-box-detail">
                                                <h5> Chase Up Shopping City </h5>
                                                <p>66 Hollow Streen, Free town, Dubai </p>
                                                <div class="ratings"> <i class="fa fa-star color"></i> <i class="fa fa-star color"></i> <i class="fa fa-star color"></i> <i class="fa fa-star color"></i> <i class="fa fa-star color"></i><span class="badge"> 5</span> </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-md-4 col-sm-6 col-xs-12">
                                    <a href="#">
                                        <div class="company-list-box">
                                            <span class="company-list-img">
                                    <img src="img/company-logo/1.png" class="img-responsive" alt="">
                                </span>
                                            <div class="company-list-box-detail">
                                                <h5> Master Group of Industries  </h5>
                                                <p>85 Hollow Streen, Free town, Istanbul </p>
                                                <div class="ratings"> <i class="fa fa-star color"></i> <i class="fa fa-star color"></i> <i class="fa fa-star color"></i> <i class="fa fa-star-half-full color"></i> <i class="fa fa-star-o"></i><span class="badge"> 4.5</span> </div>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="load-more-btn">
                                <button class="btn-default"> View All <i class="fa fa-angle-right"></i> </button>
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
                                            <p>Copyright ©2017 - IT Jobs - All rights Reserved. Made By <a href="../../../themeforest.net/user/scriptsbundle.html"> ThuyLT </a></p>
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

        <!-- Owl Carousel -->
        <script type="text/javascript" src="js/owl-carousel.js"></script>

        <!-- TEXT ROTATOR -->
        <script type="text/javascript" src="js/typed.js"></script>

        <!-- JQUERY REVEAL -->
        <script type="text/javascript" src="js/footer-reveal.min.js"></script>

        <!-- jQuery REVOLUTION Slider  -->
        <script src="js/revolution/js/jquery.themepunch.tools.min.js"></script>
        <script src="js/revolution/js/jquery.themepunch.revolution.min.js"></script>
        
        <!-- CORE JS -->
        <script type="text/javascript" src="js/custom.js"></script>
    </div>
</body>

</html>