<%@include file="Header.jsp" %>

	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet"
		integrity="sha256-k2/8zcNbxVIh5mnQ52A0r3a6jAgMGxFJFE2707UxGCk= sha512-ZV9KawG2Legkwp3nAlxLIVFudTauWuBpC10uEafMHYL0Sarrz5A7G79kXh5+5+woxQ5HM559XX2UZjMJ36Wplg=="
		crossorigin="anonymous">

	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/StyleSheets/Payment.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/JavaScriptFiles/Payment.js"></script>


<body style="font-family: 'Open Sans', sans-serif; background-color: #f2f2f2;">

	<div style="padding-top:4%;"></div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12"></div>
			<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12" style="background-color:white; padding-bottom:1%">
				<div class="tab-content">
					<div class="centered title" style="padding-bottom:3%;">
						<h1>Welcome to our checkout.</h1>
					</div>
					<div id="stripe" class="tab-pane fade in active">
						<script src="https://js.stripe.com/v2/" type="text/javascript"></script>

						<form action="<c:url value="/receipt"/>" onsubmit="return validate()" method="post">
							<div class="container-fluid">
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">

								<br>
								
									<div class="form-group required">
										<label >Name on Card</label>
										<input class="form-control" name="uname" type="text" required>
									</div>
								
								
									<div class="form-group required">
										<label class="control-label">Card Number</label>
										<input autocomplete="off" class="form-control" name="cardNo" size="16" placeholder="16 digit Card Number" type="text">
									</div>
								
								
									<div class="form-group required">
										<label class="control-label">CVV</label>
										<input autocomplete="off" class="form-control" name="cvv" placeholder="ex. 311" type="text">
									</div>
								
								<div>
									<div class="form-group expiration required">
										<label class="control-label">Expiration</label>
										<input class="form-control" name="validMonth" placeholder="MM" size="2" type="text">
									</div>
									<div class="form-group expiration required">
										<label class="control-label">Year</label>
										<input class="form-control" name="validYear" placeholder="YYYY" size="4" type="text">
									</div>
								</div>
								
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">

								<label class="control-label"></label><!-- spacing -->

								<div class="alert alert-info">Please choose your method of payment and hit continue. You
									will then be sent down to pay using your selected payment option.
								</div>
								<div class=" btn-group-vertical btn-block required">
									<input type="radio" name="pmode" value="Debit Card" required>Debit Card
									<input type="radio" name="pmode" value="Credit Card" required>Credit Card
								</div>
								<br><br>
								<div class="jumbotron jumbotron-flat">
									<div class="center">
										<h2><i>BALANCE DUE:</i></h2>
									</div>
									<div class="paymentAmt"><i class="fa fa-inr"></i>&nbsp;${total_Amount}/-</div>
								</div>
							</div>
							</div>
							<!-- <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12"></div> -->
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div class="form-row">
									<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
										<label class="control-label"></label>
										<a href="<c:url value="/cart"/>" class="form-control btn btn-primary"> Back </a>
									</div>
									<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
										<label class="control-label"></label>
										<button class="form-control btn btn-success" type="submit" value="pay"> Continue </button>
									</div>
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
								<div align="center" class="alert alert-info">Shipping Address: ${address}</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>