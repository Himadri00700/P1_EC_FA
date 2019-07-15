<%@include file="Header.jsp" %>
 
    
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/StyleSheets/ProductDisplay.css">

<body style="background-color: #f2f2f2;">	
	<div class="container-fluid">
		<div style="background-color:#ff9933; padding:5px;"><h2 align="center">Product Gallery</h2></div>
	</div>
	<div style="padding-top:2%;"></div>
    <div class="container" style="background-color:white;">
    <div class="row text-center text-lg-left" style="padding-top:3%;">
       <c:forEach items="${productList}" var="product">	        
            <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
                <div class="product-grid8">
                    <div class="product-image8">
                        
                            <img class="img-fluid img-thumbnail" src="<c:url value="/resources/images/${product.productId}.jpg"/>">
							<img class="pic-2" src="<c:url value="/resources/images/${product.productId}a.jpg"/>">
                        
                        <ul class="social">
                        	<li><a href="<c:url value="/userHome"/>" class="fa fa-home"></a></li>
                        	<li><a href="<c:url value="/addToCart/${product.productId}?quantity=1"/>" class="fa fa-shopping-bag"></a></li>
                            <li><a href="<c:url value="productDetails/${product.productId}"/>" class="fa fa-shopping-cart"></a></li>
                        </ul>
                        <span class="product-discount-label">-20%</span>
                    </div>
                    <div class="product-content">
                    	<div class="price"><h6>Price: ${product.price*100/80}</h6></div>
                        <div class="Offered price"><h6>Offered Price: ${product.price}</h6></div>
                        <div class="stock"><h6>Stock: ${product.stock}</h6></div>
                        <span class="product-shipping">Free Shipping</span>
                        <h3 class="title"><a href="<c:url value="/productDetails/${product.productId}"/>" class="d-block mb-4 h-100">${product.productName}</a></h3>
                    </div>
                </div>	            
	        </div>
        </c:forEach>
    </div>
    </div>
    <div style="padding-top:2%;"></div>
</body>