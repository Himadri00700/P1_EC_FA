<%@include file="Header.jsp" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/StyleSheets/UpdateProdAndCatg.css">

<div class="container-fluid">
	<div style="background-color:#ff9933; padding:5px;"><h2 align="center">Update Product</h2></div>
	<div class="row" style="padding-top:5%;">
		<div class="col-lg-2 col-md-2 col-sm-1 col-xs-0"></div>
		<div class="col-lg-8 col-md-8 col-sm-10 col-xs-12">
			<div  style="background-color:white; border-radius: 10px; overflow-x:auto;">
				<form action="<c:url value="/updateProduct"/>" method="post" enctype="multipart/form-data">
					<table align="center" class="table table-border">
						<tr>
							<td class="intTab">Product Id</td>
							<td><input type="text" class="input" name="productId" readonly value="${product.productId}"/></td>
						</tr>
						<tr>
							<td class="intTab">Product Name</td>
							<td><input type="text" class="input" name="productName" value="${product.productName}"/></td>
						</tr>
						<tr>
							<td class="intTab">Product Desc</td>
							<td><input type="text" class="input" name="productDesc" value="${product.productDesc}"/></td>
						</tr>
						<tr>
							<td class="intTab">Price</td>
							<td><input type="text" class="input" name="price" value="${product.price}"/></td>
						</tr>
						<tr>
							<td class="intTab">Stock</td>
							<td><input type="text" class="input" name="stock" value="${product.stock}"/></td>
						</tr>
						<tr>
							<td class="intTab">Category</td>
							<td><input type="text" class="input" name="categoryId" value="${product.categoryId}"/></td>
						</tr>
						<tr>
							<td class="intTab">Supplier</td>
							<td><input type="text" class="input" name="supplierId" value="${product.supplierId}"/></td>
						</tr>
						<tr>
							<td class="intTab">Product Image</td>
							<td><input type="file" class="input"  name="pimage" value="${product.pimage}" style="margin-bottom: 20px;"/></td>
						</tr>
						<tr>
							<td colspan="2"><button type="submit" class="btn btn-success" style="float:right;"><i class="fa fa-upload"></i>&nbsp; Update </button></td>
						</tr>	
					</table>
				</form>
			</div>
		<div class="col-lg-2 col-md-2 col-sm-1 col-xs-0"></div>		
		</div>
	</div>
</div>
<div style="padding-top:5%;"></div>
</body>
</html>