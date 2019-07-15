<%@ page language="java" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/JavaScriptFiles/Header.js"></script>

	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/StyleSheets/Header.css">
	
	<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>
		
</head>


<body>
	
		<nav class="navbar navbar-expand-lg navbar-expand-md navbar-expand-sm navbar-expand-xs navbar-light bg-light">
			<div class="container-fluid">
				<div class="col-lg-2 col-md-3 col-sm-3 col-xs-12"  style="text-align: left;">
					<a class="navbar-brand" href="#">Fashion Apparel</a>
				</div>
				
				<div class="col-lg-8 col-md-7 col-sm-7 col-xs-12">
					<ul class="navbar-nav">	
						
						<c:if test="${!sessionScope.loggedIn}">
							<li class="nav-item"><a class="nav-link" href="<c:url value="/index.jsp"/>">Home <span class="sr-only">(current)</span></a></li>
							<li class="nav-item"><a class="nav-link" href="<c:url value="/login"/>">Login</a></li>
							<li class="nav-item"><a class="nav-link" href="<c:url value="/register"/>">SignUp</a></li>
							<li class="nav-item"><a class="nav-link" href="<c:url value="/contactUs"/>">Contact Us<span class="sr-only">(current)</span></a></li>
							<li class="nav-item"><a class="nav-link" href="<c:url value="/aboutUs"/>">About Us</a></li>
						</c:if>
						
						<c:if test="${sessionScope.loggedIn}">
							<c:if test="${sessionScope.role=='ROLE_USER'}">
								<li class="nav-item"><a class="nav-link" href="<c:url value="/userHome"/>">Home</a></li>
								<li class="nav-item dropdown dmenu">
									<a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">Category</a>
									<div class="dropdown-menu sm-menu">
										<c:forEach items="${sessionScope.categoryList}" var="category">
											<a class="dropdown-item" href="<c:url value="/categoryWise/${category.categoryId}"/>">${category.categoryName}</a>
										</c:forEach>
									</div>
								</li>
								<li class="nav-item"><a class="nav-link" href="<c:url value="/productDisplay"/>">Product Gallery</a></li>
								<li class="nav-item"><a class="nav-link" href="<c:url value="/contactUs"/>">Contact Us<span class="sr-only">(current)</span></a></li>
								<li class="nav-item"><a class="nav-link" href="<c:url value="/aboutUs"/>">About Us</a></li>
							</c:if>
							
							<c:if test="${sessionScope.role=='ROLE_ADMIN'}">
							<li class="nav-item"><a class="nav-link" href="<c:url value="/adminHome"/>">Home</a></li>
								<li class="nav-item"><a class="nav-link" href="<c:url value="/category"/>">Manage Category<span class="sr-only">(current)</span></a></li>
								<li class="nav-item"><a class="nav-link" href="<c:url value="/product"/>">Manage Product</a></li>
								<li class="nav-item"><a class="nav-link" href="<c:url value="/supplier"/>">Manage Supplier</a></li>
							</c:if>
						</c:if>
						
					</ul>
				</div>
			
				<div class="nav navbar-nav navbar-right col-lg-2 col-md-2 col-sm-2 col-xs-12">
					<c:if test="${sessionScope.loggedIn}">
						<div id="userdetail" style="float:right;">
							<font face="verdana" color="#e8e82e">&nbsp; Welcome, ${sessionScope.username}</font>&nbsp;&nbsp;
							<a href="<c:url value="/perform_logout"/>"><i class='fas fa-sign-out-alt' style='font-size:24px;color:#ff9933'></i></a>
						</div>
					</c:if>
				</div>
			</div>
		</nav>


