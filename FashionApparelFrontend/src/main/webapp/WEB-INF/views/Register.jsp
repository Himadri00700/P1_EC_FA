<%@include file="Header.jsp" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/JavaScriptFiles/Register.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/StyleSheets/Register.css">


<div class="container register">
	<div class="row">
		<div class="col-md-3 register-left">
			<img src="https://image.ibb.co/n7oTvU/logo_white.png" alt=""/>
			<h3>Welcome</h3>
			<p>If you already have an account, then please LogIn!!</p>
			<a href="<c:url value="/login"/>"><input type="submit" name="login" value="LogIn"></a><br>
		</div>
		
		<div class="col-md-9 register-right">
			<form action="<c:url value="/registerUser"/>" onsubmit="return validate()" method="post">
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
						<h3 class="register-heading">Hello User</h3>
						<div class="row register-form">
							<div class="col-lg-6 col-md-6">
								<div class="form-group">
									<input type="text" name="customerName" class="form-control" placeholder="Your Name *" value="" required/>
								</div><br>
								<div class="form-group">
									<input type="text" name="username" class="form-control" placeholder="User Name *" value="" required/>
								</div><br>
								<div class="form-group">
									<input type="password" name="password" class="form-control" placeholder="Password *" value="" required/>
								</div><br>
								<div class="form-group">
									<a href="<c:url value="/resources/Instructions/Instructions.jsp"/>" target="_blank">&nbsp;<i class="fa fa-book"></i>&nbsp;Instructions!!</a>
								</div>
							</div>
							<div class="col-lg-6 col-md-6">
								<div class="form-group">
									<input type="email" name="emailId" class="form-control" placeholder="Your Email *" value="" required/>
								</div><br>
								<div class="form-group">
									<input type="text" name="address" class="form-control" placeholder="Your Address *" value="" required/>
								</div><br>
								<div class="form-group">
									<input type="password" class="form-control"  placeholder="Confirm Password *" value="" required/>
								</div>
								<input type="submit" class="btnRegister"  value="Register"/>
							</div>
						</div>
					</div>  
				</div>
			</form>
		</div>
	</div>
</div>
