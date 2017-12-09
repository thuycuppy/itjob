<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <!--[if IE]>
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><tiles:getAsString name="title" /></title>
    <link rel="icon" href="/img/favicon.ico" type="image/x-icon">

    <!-- BOOTSTRAPE STYLESHEET CSS FILES -->
    <link rel="stylesheet" href="/css/bootstrap.min.css">

    <!-- JQUERY SELECT -->
    <link href="/css/select2.min.css" rel="stylesheet" />

    <!-- JQUERY MENU -->
    <link rel="stylesheet" href="/css/mega_menu.min.css">

    <!-- ANIMATION -->
    <link rel="stylesheet" href="/css/animate.min.css">

    <!-- OWl  CAROUSEL-->
    <link rel="stylesheet" href="/css/owl.carousel.css">
    <link rel="stylesheet" href="/css/owl.style.css">

    <!-- TOASTER CSS -->
    <link rel="stylesheet" href="/css/toastr.min.css">

    <!-- TEMPLATE CORE CSS -->
    <link rel="stylesheet" href="/css/style.css">

    <!--  REVOLUTION STYLE SETTING -->
    <link href="/js/revolution/css/settings.css" rel="stylesheet" type="text/css" />

    <!-- FONT AWESOME -->
    <link rel="stylesheet" type="text/css" href="/css/font-awesome.min.css">
    <link rel="stylesheet" href="/css/et-line-fonts.css" type="text/css">
    <link rel="stylesheet" href="/css/slideshowstyle.css" type="text/css">

    <!-- Bootstrap Datepicker -->
    <link rel="stylesheet" href="/css/bootstrap-datepicker3.min.css" type="text/css">

    <!-- JavaScripts -->
    <script src="/js/modernizr.js"></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->

    <!-- CKEditor -->
    <script type="text/javascript" src="/ckeditor/ckeditor.js"></script>

    <!-- JQUERY  -->
    <script type="text/javascript" src="/js/jquery-3.1.1.min.js"></script>
</head>

<body>
<div class="page">
    <div id="spinner">
        <div class="spinner-img"> <img alt="Opportunities Preloader" src="/img/loader.gif" />
            <h2>Please Wait.....</h2>
        </div>
    </div>
    
	<tiles:insertAttribute name="header" />

    <tiles:insertAttribute name="body" />
    
    <tiles:insertAttribute name="footer" />

    <a href="#" class="scrollup"><i class="fa fa-chevron-up"></i></a>

    <!-- JQUERY  -->
    <script type="text/javascript" src="/js/jquery-3.1.1.min.js"></script>

    <!-- JQUERY  -->
    <script type="text/javascript" src="/js/jquery-migrate-1.2.1.min.js"></script>

    <!-- BOOTSTRAP CORE JS -->
    <script type="text/javascript" src="/js/bootstrap.min.js"></script>

    <!-- SELECT2 -->
    <script type="text/javascript" src="/js/select2.full.min.js"></script>

    <!-- MEGA MENU -->
    <script type="text/javascript" src="/js/mega_menu.min.js"></script>

    <!-- JQUERY COUNTERUP -->
    <script type="text/javascript" src="/js/counterup.js"></script>

    <!-- JQUERY WAYPOINT -->
    <script type="text/javascript" src="/js/waypoints.min.js"></script>

    <!-- Owl Carousel -->
    <script type="text/javascript" src="/js/owl-carousel.js"></script>

    <!-- TEXT ROTATOR -->
    <script type="text/javascript" src="/js/typed.js"></script>

    <!-- JQUERY REVEAL -->
    <script type="text/javascript" src="/js/footer-reveal.min.js"></script>

    <!-- jQuery REVOLUTION Slider  -->
    <script src="/js/revolution/js/jquery.themepunch.tools.min.js"></script>
    <script src="/js/revolution/js/jquery.themepunch.revolution.min.js"></script>

    <!-- Bootstrap Datepicker -->
    <script type="text/javascript" src="/js/bootstrap-datepicker.min.js"></script>

    <!-- JAVASCRIPT TEMPLATE -->
    <script type="text/javascript" src="/js/tmpl.min.js"></script>

    <!-- TOASTER JS -->
    <script type="text/javascript" src="/js/toastr.min.js"></script>

    <!-- CORE JS -->
    <script type="text/javascript" src="/js/custom.js"></script>
</div>
</body>

</html>