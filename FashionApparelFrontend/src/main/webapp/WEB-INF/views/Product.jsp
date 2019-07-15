<%@include file="Header.jsp" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/StyleSheets/UpdateProdAndCatg.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/StyleSheets/ManageProdAndCatg.css">

	<div class="container-fluid">
		<div style="background-color:#ff9933; padding:5px;"><h2 align="center">Manage Products</h2></div>
		
		<div class="row"   style="padding-top:2%; padding-bottom:3%;">
			<div class="col-lg-2 col-md-8 col-sm-12 col-xs-12"></div>
			<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
				<div style="padding-bottom:2%">
					<div  style="background-color:white; border-radius: 10px; overflow-x:auto;">
						<form:form action="insertProduct" modelAttribute="product" method="post" enctype="multipart/form-data">
							<table align="center" class="table table-border">
								<tr>
									<td class="intTab">Product Name</td>
									<td><form:input path="productName" class="input"/></td>
								</tr>
								<tr>
									<td class="intTab">Product Desc</td>
									<td><form:input path="productDesc" class="input"/></td>
								</tr>
								<tr>
									<td class="intTab">Price</td>
									<td><form:input path="price" class="input"/></td>
								</tr>
								<tr>
									<td class="intTab">Stock</td>
									<td><form:input path="stock" class="input"/></td>
								</tr>
								<tr>
									<td class="intTab">Category</td>
									<td>
										<form:select path="categoryId"  style="float:right; margin-bottom: 20px;">
											<form:option value="0" label="---Select List---"/>
											<form:options items="${categoryList}"/>
										</form:select>
									</td>
								</tr>
								<tr>
									<td class="intTab">Supplier</td>
									<td><form:select path="supplierId"  style="float:right; margin-bottom: 20px;">
											<form:option value="0" label="---Select List---"/>
											<form:options items="${supplierList}"/>
										</form:select>
									</td>
								</tr>
								<tr>
									<td class="intTab">Product Image</td>
									<td><form:input type="file" path="pimage"  style="margin-bottom: 20px;"/></td>
								</tr>
								<tr>
									<td colspan="2"><button type="submit" class="btn btn-success" style="float:right;"><i class="fa fa-check-square-o"></i>&nbsp; Insert </button></td>
								</tr>
							
							</table>
						
						</form:form>
					</div>
				</div>
				<div  class="tableManDiv">
					<table id="tableMan" class="table table-border table-condensed">
						<tr class="trOfTableMan">
							<th class="thOfTableMan">ProductId</th>
							<th class="thOfTableMan">ProductName </th>
							<th class="thOfTableMan">ProductDesc </th>
							<th class="thOfTableMan">Price </th>
							<th class="thOfTableMan">Stock </th>
							<th class="thOfTableMan">CategoryId </th>
							<th class="thOfTableMan">SupplierId </th>
							<th colspan="2" class="thOfTableMan">Operation</th>
						</tr>
						
						<c:forEach items="${productList}" var="product">
							<tr class="trOfTableMan" align="center">
								<td class="thOfTableMan">${product.productId}</td>
								<td class="thOfTableMan">${product.productName}</td>
								<td class="thOfTableMan">${product.productDesc}</td>
								<td class="thOfTableMan">${product.price}</td>
								<td class="thOfTableMan">${product.stock}</td>
								<td class="thOfTableMan">${product.categoryId}</td>
								<td class="thOfTableMan">${product.supplierId}</td>
								<td class="thOfTableMan">
									<a href="<c:url value="/editProduct/${product.productId}"/>"><button class="btn btn-primary"><i class="fa fa-cogs"></i>&nbsp; Edit</button></a>
								</td>
								<td class="thOfTableMan">
									<a href="<c:url value="/deleteProduct/${product.productId}"/>"><button class="btn btn-danger"><i class="fa fa-window-close-o"></i>&nbsp; Delete</button></a>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12"></div>
		</div>
	</div>
</body>
</html>