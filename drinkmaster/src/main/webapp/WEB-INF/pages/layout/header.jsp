<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>飲君子後臺系統</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">



<link href="<c:url value="/css/lib/themify-icons.css"/>"
	rel="stylesheet">
<link href="<c:url value="/css/lib/menubar/sidebar.css"/>"
	rel="stylesheet">
<link href="<c:url value="/css/lib/bootstrap.min.css"/>"
	rel="stylesheet">
<link href="<c:url value="/css/style.css"/>" rel="stylesheet">

<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" />



<style>
li {
	font-size: large;
}
</style>
</head>


<div
	class="sidebar sidebar-hide-to-small sidebar-shrink sidebar-gestures">
	<div class="nano">
		<div class="nano-content">



			<ul>
				<div class="logo">
					<a href="${contextRoot}/backend/"> <!-- <img src="assets/images/logo.png" alt="" /> -->
						<span>飲君子後台</span>
					</a>
				</div>
				<li><a class="sidebar-sub-toggle"><i
						class="large material-icons md-48">account_circle</i> 會員管理<span
						class="sidebar-collapse-icon ti-angle-down"></span></a>
					<ul>
						<li><a href="${contextRoot}/backend/user/insert">新增</a></li>
						<li><a href="${contextRoot}/backend/user/update">修改</a></li>

						<li><a href="#">刪除</a></li>
						<li><a href="${contextRoot}/backend/user/all">查詢</a></li>
					</ul></li>
				<li><a class="sidebar-sub-toggle"><i
						class="large material-icons">business</i> 廠商管理 <span
						class="sidebar-collapse-icon ti-angle-down"></span></a>
					<ul>
						<li><a href="<c:url value="/backend/firm/all"/>">所有廠商</a></li>
						<li><a href="#">修改</a></li>

						<li><a href="#">刪除</a></li>
						<li><a href="#">查詢</a></li>
					</ul></li>
				<li><a class="sidebar-sub-toggle"><i
						class="large material-icons">store</i> 店家管理 <span
						class="sidebar-collapse-icon ti-angle-down"></span></a>
					<ul>
						<li><a href="<c:url value="/backend/store/all"/>">所有店家</a></li>
						<li><a href="#">修改</a></li>

						<li><a href="#">刪除</a></li>
						<li><a href="#">查詢</a></li>
					</ul></li>
				<li><a class="sidebar-sub-toggle"><i
						class="large material-icons">local_cafe</i> 商品管理 <span
						class="sidebar-collapse-icon ti-angle-down"></span></a>
					<ul>
						<li><a href="${contextRoot}/backend/product/all">商品列表</a></li>
						<li><a href="${contextRoot}/backend/product/insertview">新增商品</a></li>
						<li><a href="${contextRoot}/backend/category/all">種類列表</a></li>

						<li><a href="${contextRoot}/backend/productanalyze">銷量圖表</a></li>

					</ul></li>
				<li><a class="sidebar-sub-toggle"><i
						class="large material-icons">list</i> 訂單管理 <span
						class="sidebar-collapse-icon ti-angle-down"></span></a>
					<ul>
						<li><a href="<c:url value="/backend/order/findAll"/>">訂單列表</a></li>
						<li><a href="<c:url value="/backend/order/detail"/>">修改</a></li>

						<li><a href="#">刪除</a></li>
						<li><a href="#">查詢</a></li>
					</ul></li>
				<li><a class="sidebar-sub-toggle"><i
						class="large material-icons">message</i> 評論管理 <span
						class="sidebar-collapse-icon ti-angle-down"></span></a>
					<ul>
						<li><a href="${contextRoot}/backend/comment">新增</a></li>
						<li><a href="#">修改</a></li>
						<li><a href="#">刪除</a></li>
						<li><a href="${contextRoot}/backend/comment/all">查詢</a></li>
					</ul></li>
				<li><a class="sidebar-sub-toggle"><i
						class="large material-icons">room_service</i> 客服管理 <span
						class="sidebar-collapse-icon ti-angle-down"></span></a>
					<ul>
						<li><a href="${contextRoot}/backend/service/reply">意見回覆</a></li>
						<li><a href="${contextRoot}/backend/service/viewall">意見總覽</a></li>
						<li><a href="${contextRoot}/backend/service/add">新增意見</a></li>


					</ul></li>
				<li><a><i class="ti-close"></i> Logout</a></li>
			</ul>
		</div>
	</div>
</div>
<!-- /# sidebar -->

<div class="header">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-12">
				<div class="float-left">
					<div class="hamburger sidebar-toggle">
						<span class="line"></span> <span class="line"></span> <span
							class="line"></span>
					</div>
				</div>
				<div class="float-right">


					<div class="dropdown dib">
						<div class="header-icon" data-toggle="dropdown">
							<span class="user-avatar"><a>Logout</a>
								</li> </span>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="content-wrap">
	<div class="main">
		<div class="container-fluid">


			<!-- jquery vendor -->
			<script src="<c:url value="/js/lib/jquery.min.js"/>"></script>
			<script src="<c:url value="/js/lib/jquery.nanoscroller.min.js"/>"></script>
			<!-- nano scroller -->
			<script src="<c:url value="/js/lib/menubar/sidebar.js"/>"></script>
			<script src="<c:url value="/js/lib/preloader/pace.min.js"/>"></script>
			<!-- sidebar -->
			<script src="<c:url value="/js/lib/bootstrap.bundle.min.js"/>"></script>
			<script src="<c:url value="/js/scripts.js"/>"></script>
			<!-- bootstrap -->