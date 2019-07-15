<%@include file="Header.jsp" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/StyleSheets/Receipt.css">

<body style="background-color: #f2f2f2; margin-top: 0px; margin-bottom: 120px;">
	<div class="container-fluid">
		<div style="background-color:#ff9933; padding:5px;"><h2 align="center">Cart Details</h2></div>
	</div>

	<div class="container">
	    <div class="row" style="overflow-x:auto;">
	        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	            <div class="card">
	                <div class="card-body p-0">
	                    <div class="row p-5">
	                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12" style="overflow-x:auto">
	                            <img src="http://via.placeholder.com/400x90?text=logo">
	                        </div>
	
	                        <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 text-right">
	                            <p class="font-weight-bold mb-1">Invoice #${order.orderId}</p>
	                            <p class="text-muted">Due to: ${order.orderDate}</p>
	                        </div>
	                    </div>
	
	                    <hr class="my-5">
	
	                    <div class="row pb-5 p-5">
	                        <div class="col-md-6">
	                            <p class="font-weight-bold mb-4">Client Information</p>
	                            <p class="mb-1">${order.username}</p>
	                            <p class="mb-1"><span class="text-muted">Address: </span> ${address}</p>
	                            <p class="mb-1"><span class="text-muted">Email Id: </span> </p>
	                        </div>
	
	                        <div class="col-md-6 text-right">
	                            <p class="font-weight-bold mb-4">Payment Details</p>
	                            <p class="mb-1"><span class="text-muted">VAT: </span> 1425782</p>
	                            <p class="mb-1"><span class="text-muted">VAT ID: </span> 10253642</p>
	                            <p class="mb-1"><span class="text-muted">Payment Type: </span> ${order.pmode}</p>
	                            <p class="mb-1"><span class="text-muted">Name: </span> ${order.username}</p>
	                        </div>
	                    </div>
	
	                    <div class="row p-5">
	                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	                        	<div style="overflow-x:auto">
	                            <table class="table">
	                                <thead>
	                                    <tr>
	                                        <th class="border-0 text-uppercase small font-weight-bold">ID</th>
	                                        <th class="border-0 text-uppercase small font-weight-bold">Item</th>
	                                        <th class="border-0 text-uppercase small font-weight-bold">Description</th>
	                                        <th class="border-0 text-uppercase small font-weight-bold">Quantity</th>
	                                        <th class="border-0 text-uppercase small font-weight-bold">Unit Cost</th>
	                                        <th class="border-0 text-uppercase small font-weight-bold">Total</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                	<c:forEach items="${listCartItems}" var="cartItem">
		                                    <tr>
		                                        <td>${cartItem.productId}</td>
		                                        <td>${cartItem.productName}</td>
		                                        <td>LTS Versions</td>
		                                        <td>${cartItem.quantity}</td>
		                                        <td>${cartItem.price}</td>
		                                        <td>${cartItem.price*cartItem.quantity}</td>
		                                    </tr>
	                                    </c:forEach>
	                                </tbody>
	                            </table>
	                            </div>
	                        </div>
	                    </div>
	
	                    <div class="d-flex flex-row-reverse bg-dark text-white p-4" style="overflow-x:auto">
	                        <div class="py-3 px-5 text-right">
	                            <div class="mb-2">Grand Total</div>
	                            <div class="h2 font-weight-light"><i class="fa fa-inr"></i>&nbsp;${total_Amount}</div>
	                        </div>
	
	                        <div class="py-3 px-5 text-right">
	                            <div class="mb-2">Discount</div>
	                            <div class="h2 font-weight-light">0%</div>
	                        </div>
	
	                        <div class="py-3 px-5 text-right">
	                            <div class="mb-2">Sub - Total amount</div>
	                            <div class="h2 font-weight-light"><i class="fa fa-inr"></i>&nbsp;${total_Amount*0}</div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <div class="text-light mt-5 mb-5 text-center small"><span style="color:black;">by: </span><a class="text-light" target="_blank" href="<c:url value="/userHome"/>" ><span style="color:black;"><u>Fashion_Appareal</u></span></a></div>
	</div>
</body>