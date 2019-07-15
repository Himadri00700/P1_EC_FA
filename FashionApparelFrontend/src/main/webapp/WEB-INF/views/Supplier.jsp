<%@include file="Header.jsp" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/StyleSheets/UpdateProdAndCatg.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/StyleSheets/ManageProdAndCatg.css">

	<div class="container-fluid">
		<div style="background-color:#ff9933; padding:5px;"><h2 align="center">Manage Supplier</h2></div>	
		
		<div class="row"  style="padding-top:6%;">
		<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12"></div>
		<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
			<div style="padding-bottom:6%">
				<div  style="background-color:white; border-radius: 10px; overflow-x:auto;">
					<form action="insertSupplier" method="post">
						<table align="center" class="table table-border">
							<tr>
								<td class="intTab">Supplier Name</td>
								<td><input  class="input" type="text" name="supplierName"/></td>
							</tr>
							<tr>
								<td class="intTab">Supplier Address</td>
								<td><input  class="input"  type="text" name="supplierAddr"/></td>
							</tr>
							<tr>
								<td colspan="2"><button type="submit" class="btn btn-success" style="float:right;"><i class="fa fa-check-square-o"></i>&nbsp; Insert </button></td>
							</tr>				
						</table>			
					</form>
				</div>
			</div>
			<div  class="tableManDiv">
				<table id="tableMan" class="table table-border table-condensed">
					<tr class="trOfTableMan">
						<th class="thOfTableMan">SupplierId</th>
						<th class="thOfTableMan">SupplierName</th>
						<th class="thOfTableMan">SupplierAddress</th>
						<th colspan="2" class="thOfTableMan">Operation</th>
					</tr>
					
					<c:forEach items="${supplierList}" var="supplier">
						<tr align="center"  class="trOfTableMan">
							<td class="tdOfTableMan">${supplier.supplierId}</td>
							<td class="tdOfTableMan">${supplier.supplierName}</td>
							<td class="tdOfTableMan">${supplier.supplierAddr}</td>
							<td class="tdOfTableMan">
								<a href="<c:url value="/editSupplier/${supplier.supplierId}"/>"><button class="btn btn-primary"><i class="fa fa-cogs"></i>&nbsp; Edit</button></a>
							</td>
							<td class="thOfTableMan">
								<a href="<c:url value="/deleteSupplier/${supplier.supplierId}"/>"><button class="btn btn-danger"><i class="fa fa-window-close-o"></i>&nbsp; Delete</button></a>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>		
		<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12"></div>
		</div>
	</div>
</body>