<%@include file="Header.jsp" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/StyleSheets/Login.css">


	<div class="container contact-form">
		<div class="contact-image">
		    <img src="https://image.ibb.co/kUagtU/rocket_contact.png" alt="rocket_contact"/>
		</div>
		<form action="<c:url value="/perform_login"/>" method="post">
		<h3>Hello again, User</h3>
			<div class="row">
				<div class="col-md-12">
				
					<div class="form-group">
					    <input type="text" name="username" class="form-control" placeholder="Your Username *" value="" />
					</div>
					<div class="form-group">
					    <input type="password" name="password" class="form-control" placeholder="Password *" value="" />
					</div><br><br>
					<div class="form-group">
					    <input type="submit" name="btnSubmit" class="btnContact" value="SignIn" />
					</div>
					
					<div class="form-group">
					<a href="<c:url value="/register"/>"><button type="button" class="btnContact1">SignUp</button></a>
					</div>
				</div>
		    </div>
		</form>
	</div>

