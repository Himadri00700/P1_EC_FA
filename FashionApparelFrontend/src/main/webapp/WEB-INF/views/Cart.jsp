<%@include file="Header.jsp" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css' integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ' crossorigin='anonymous'>

<body style="background-color: #f2f2f2;">
	<div class="container-fluid">
	<div style="background-color:#ff9933; padding:5px;"><h2 align="center">Cart Details</h2></div>
	</div>

	<div class="container-fluid">
	    <div class="row" style="padding-top:5%;">
	    	<div class="col-lg-2 col-mid-2 col-sm-12 col-xs-0"></div>
	        <div class="col-lg-8 col-mid-8 col-sm-12 col-xs-12" style="background-color:white; overflow-x: auto;">
	            <table class="table table-border">
                  	<thead>
	                    <tr>
	                        <th>Product</th>
	                        <th>Quantity</th>
	                        <th class="text-center">Price</th>
	                        <th class="text-center">Total</th>
	                        <th colspan="2"> </th>
	                    </tr>
	                </thead>
	                <tbody>
	                	<c:forEach items="${listCartItems}" var="cartItem">
	                		<form action="<c:url value="/updateCartItem/${cartItem.cartItemId}"/>" method="get">
								<tr>
			                        <td class="col-lg-4 col-sm-5 col-md-5 col-xs-7">
										<div class="media">
											<a class="thumbnail pull-left" href="#"> <img class="media-object" src="<c:url value="/resources/images/${cartItem.productId}.jpg"/>" style="width:100px;"> </a>&nbsp;&nbsp;
											<div class="media-body">
											    <h4 class="media-heading"><a href="#">${cartItem.productName}</a></h4>
											    <span>Status: </span><span class="text-success"><strong>In Stock</strong></span>
											</div>
										</div>
									</td>
									<td class="col-lg-1 col-sm-1 col-md-1 col-xs-1" style="text-align: center">
									<input type="text" class="form-control" id="quantity" name="quantity" value="${cartItem.quantity}"></td>
									<td class="col-lg-1 col-sm-1 col-md-1 col-xs-1 text-center"><strong>${cartItem.price}</strong></td>
									<td class="col-lg-1 col-sm-1 col-md-1 col-xs-1 text-center"><strong>${cartItem.price*cartItem.quantity}</strong></td>
									<td class="col-lg-2 col-sm-2 col-md-2 col-xs-1">
										<button type="submit" class="btn btn-primary" style="float:right;"><i class="fa fa-upload"></i>&nbsp; Update </button>
									</td>
									<td class="col-lg-2 col-sm-2 col-md-2 col-xs-1">
										<a href="<c:url value="/deleteCartItem/${cartItem.cartItemId}"/>" class="btn btn-danger" style="float:right;"><i class="fa fa-remove"></i>&nbsp; Remove </a>	
									</td>
								</tr>
							</form>
	                    </c:forEach>
	                    <tr>
	                        <td>   </td>
	                        <td>   </td>
	                        <td>   </td>
	                        <td>   </td>
	                        <td><h5>Sub-total</h5></td>
	                        <td class="text-right"><h5><strong><i class="fa fa-inr"></i>&nbsp;${total_Amount}/-</strong></h5></td>
	                    </tr>
	                    <tr>
	                        <td>   </td>
	                        <td>   </td>
	                        <td>   </td>
	                        <td>   </td>
	                        <td><h5>Estimated shipping</h5></td>
	                        <td class="text-right"><h5><strong><i class="fa fa-inr"></i>&nbsp;0/-</strong></h5></td>
	                    </tr>
	                    <tr>
	                        <td>   </td>
	                        <td>   </td>
	                        <td>   </td>
	                        <td>   </td>
	                        <td><h3>Total</h3></td>
	                        <td class="text-right"><h3><strong><i class="fa fa-inr"></i>&nbsp;${total_Amount+0}/-</strong></h3></td>
	                    </tr>
	                    <tr>
	                        <td>   </td>
	                        <td>   </td>
	                        <td>   </td>
	                        <td>   </td>
	                        <td><a href="<c:url value="/productDisplay"/>" class="btn btn-info"><i class='far fa-thumbs-up'></i>&nbsp; Continue Shopping </a></td>
	                        <td><a href="<c:url value="/confirmOrder"/>" class="btn btn-success"><i class='fas fa-cart-arrow-down'></i>&nbsp; Checkout </a></td>
	                    </tr>
	                </tbody>
	            </table>
	        </div>
	        <div class="col-lg-2 col-mid-2 col-sm-12 col-xs-0"></div>
	    </div>
	</div>
</body>