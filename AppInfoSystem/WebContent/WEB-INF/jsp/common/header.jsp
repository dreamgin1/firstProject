<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <title>App开发者平台</title>

  <!-- Bootstrap -->
  <link href="${pageContext.request.contextPath }/statics/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome -->
  <link href="${pageContext.request.contextPath }/statics/css/font-awesome.min.css" rel="stylesheet">
  <!-- NProgress -->
  <link href="${pageContext.request.contextPath }/statics/css/nprogress.css" rel="stylesheet">
  <!-- iCheck -->
  <link href="${pageContext.request.contextPath }/statics/css/green.css" rel="stylesheet">
  <!-- bootstrap-progressbar -->
  <link href="${pageContext.request.contextPath }/statics/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
  <!-- JQVMap -->
  <link href="${pageContext.request.contextPath }/statics/css/jqvmap.min.css" rel="stylesheet"/>

  <!-- Custom Theme Style -->
  <link href="${pageContext.request.contextPath }/statics/css/custom.min.css" rel="stylesheet">
</head>

<body class="nav-md">
<div class="container body">
  <div class="main_container">
    <div class="col-md-3 left_col">
      <div class="left_col scroll-view">
        <div class="navbar nav_title" style="border: 0;">
          <a href="index.html" class="site_title"><i class="fa fa-paw"></i> <span>APP BMS</span></a>
        </div>

        <div class="clearfix"></div>

        <!-- menu profile quick info -->
        <div class="profile">
          <div class="profile_pic">
            <img src="${pageContext.request.contextPath }/statics/images/img1.jpg" alt="..." class="img-circle profile_img">
          </div>
          <div class="profile_info">
            <span>Welcome,</span>
            <h2>${userSession.devCode}</h2>
          </div>
        </div>
        <!-- /menu profile quick info -->

        <br />

        <!-- sidebar menu -->
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
          <div class="menu_section">
            <h3>${userSession.devName}</h3>
            <ul class="nav side-menu">
              <li><a><i class="fa fa-home"></i>APP账户管理<span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                  <li><a href="index.html">APP开发者账户申请</a></li>
                  <li><a href="index.html">个人账户信息维护</a></li>

                </ul>
              </li>
              <li><a><i class="fa fa-edit"></i>APP应用管理 <span class="fa fa-chevron-down"></span></a>
                <ul class="nav child_menu">
                  <li><a href="form.html">APP维护</a></li>

                </ul>
              </li>
                </ul>
              </li>
            </ul>
          </div>

        </div>
        <!-- /sidebar menu -->
		
      </div>
    </div>
		<!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Logout"  href="login.html">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- /menu footer buttons -->
    <!-- top navigation -->
    <div class="top_nav">
      <div class="nav_menu">
        <nav>
         <div class="nav toggle">
            <a id="menu_toggle"><i class="fa fa-bars"></i></a>
          </div>

  <ul class="nav navbar-nav navbar-right">
                <li class="">
                  <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                    <img src="${pageContext.request.contextPath }/statics/images/img1.jpg" alt="">${userSession.devName}
                    <span class=" fa fa-angle-down"></span>
                  </a>
                  <ul class="dropdown-menu dropdown-usermenu pull-right">
  
                    <li><a href="${pageContext.request.contextPath }/login"><i class="fa fa-sign-out pull-right"></i>注销</a></li>
                  </ul>
                </li>

          </ul>
        </nav>
      </div>
    </div>
    <!-- /top navigation -->
        