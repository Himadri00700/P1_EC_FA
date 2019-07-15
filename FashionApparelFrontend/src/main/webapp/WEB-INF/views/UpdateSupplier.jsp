<%@include file="Header.jsp" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/StyleSheets/UpdateProdAndCatg.css">

<div class="container-fluid">
	<div style="background-color:#ff9933; padding:5px;"><h2 align="center">Update Supplier</h2></div>
	<div class="row" style="padding-top:12%;">
		<div class="col-lg-2 col-md-2 col-sm-1 col-xs-12"></div>
		<div class="col-lg-8 col-md-8 col-sm-10 col-xs-12" style="background-color:white; border-radius: 10px;  overflow-x: auto;">
			<form action="<c:url value="/updateSupplier"/>" method="post">
				<table align="center" class="table table-border">
					<tr>
						<td class="intTab">Supplier Id:</td>
						<td><input type="text" class="input" name="supplierId" readonly value="${supplier.supplierId}"/></td>
					</tr>
					<tr>
						<td class="intTab">Supplier Name:</td>
						<td><input type="text" class="input" name="supplierName" value="${supplier.supplierName}"/></td>
					</tr>
					<tr>
						<td class="intTab">Supplier Address:</td>
						<td><input type="text" class="input" name="supplierAddr" value="${supplier.supplierAddr}"/></td>
					</tr>
					<tr>
						<td colspan="2"><button type="submit" class="btn btn-success" style="float:right;"><i class="fa fa-upload"></i>&nbsp; Update </button></td>
					</tr>				
				</table>			
			</form>
		</div>
		<div class="col-lg-2 col-md-2 col-sm-1 col-xs-12"></div>
	</div>
</div>
</body>