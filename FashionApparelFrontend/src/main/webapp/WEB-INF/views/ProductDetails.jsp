<%@include file="Header.jsp" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/StyleSheets/ProductDetails.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/JavaScriptFiles/ProductDetails.js"></script>

	<div class="container-fluid">
		<div style="background-color:#ff9933; padding:5px;"><h2 align="center">Product Details</h2></div>
	</div>
	
	
	<div class="container">
		<div class="row" style="padding-top:3%; padding-bottom:3%;">
			<div class="col-lg-1 col-md-1"></div>
			<div class="col-lg-10 col-md-10 col-sm-12 col-xs-12">
				<div class="card mb-10">
					<div class="card-header">
					<nav class="header-navigation">
					<a href="<c:url value="/userHome"/>" class="btn btn-link">Back to Home</a>
					
					
					</nav>
					</div>
					<div class="card-body store-body">
						<div class="product-info">
							<div class="product-gallery">
								<div class="product-gallery-thumbnails">
									<ol class="thumbnails-list list-unstyled">
										<li><img src="<c:url value="/resources/images/${product.productId}.jpg"/>" alt=""></li>
										<li><img src="<c:url value="/resources/images/${product.productId}a.jpg"/>" alt=""></li>
										<li><img src="<c:url value="/resources/images/${product.productId}b.jpg"/>" alt=""></li>
										<li><img src="<c:url value="/resources/images/${product.productId}c.jpg"/>" alt=""></li>
										<li><img src="<c:url value="/resources/images/${product.productId}d.jpg"/>" alt=""></li>
									</ol>
								</div>
								<div class="product-gallery-featured">
									<img id="item-display" src="<c:url value="/resources/images/${product.productId}.jpg"/>" alt=""></img>
								</div>
							</div><br><br><br><br>
							<form action="<c:url value="/addToCart/${product.productId}"/>" method="get">
								<div class="col-lg-8 col-md-10 col-sm-12 col-xs-12">
									<div> <h4 class="product-title mb-2">${product.productName} - ${product.productDesc}</h4></div>
										<br><br>
										<h2 class="mb-5">Features</h2>
											
										<h2 class="mb-5">Description</h2>
										<p>====Product Description====</p>
										<p>====Product Description====</p>
									                
									<div class="product-payment-details">
										<h2 class="product-price display-5"><i class="fa fa-inr"></i>${product.price}/-</h2>
										<p class="text-success"><i class="fa fa-cart-plus"></i>Stock: ${product.stock}</p>
										<p class="mb-0"><i class="fa fa-truck"></i> Delivery in all territory</p>
										<div class="text-muted mb-2"><small>know more about delivery time and shipping forms</small></div>
										<label for="quant">Quantity</label>
										<input type="number" name="quantity" value="1" min="1" id="quant" class="form-control mb-5 input-sm" placeholder="Choose the quantity">
									</div>
									<div class="form-row">
									<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
									<div>
										<label class="control-label"></label>
										<a href="<c:url value="/productDisplay"/>" class="form-control fa fa-undo btn btn-primary"> Back </a>
									</div>
									</div>
									<div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-6">
									<div>
										<label class="control-label"></label>
										<button type="submit" class="form-control fa fa-cart-arrow-down btn btn-success"> Add to Cart</button>
									</div>
									</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-1 col-md-1"></div>
		</div>
	</div>
</body>