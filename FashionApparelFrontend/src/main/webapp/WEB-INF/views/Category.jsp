<%@include file="Header.jsp" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/StyleSheets/UpdateProdAndCatg.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/StyleSheets/ManageProdAndCatg.css">

	<div class="container-fluid">
		<div style="background-color:#ff9933; padding:5px;"><h2 align="center">Manage Category</h2></div>	
		
		<div class="row"  style="padding-top:6%;">
		<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12"></div>
		<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
			<div style="padding-bottom:6%">
				<div  style="background-color:white; border-radius: 10px; overflow-x:auto;">
					<form action="insertCategory" method="post">
						<table align="center" class="table table-border">
							<tr>
								<td class="intTab">Category Name</td>
								<td><input  class="input" type="text" name="catName"/></td>
							</tr>
							<tr>
								<td class="intTab">Category Desc</td>
								<td><input  class="input"  type="text" name="catDesc"/></td>
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
						<th class="thOfTableMan">CategoryId</th>
						<th class="thOfTableMan">CategoryName </th>
						<th class="thOfTableMan">CategoryDesc </th>
						<th colspan="2" class="thOfTableMan">Operation</th>
					</tr>
					
					<c:forEach items="${categoryList}" var="category">
						<tr align="center"  class="trOfTableMan">
							<td class="tdOfTableMan">${category.categoryId}</td>
							<td class="tdOfTableMan">${category.categoryName}</td>
							<td class="tdOfTableMan">${category.categoryDesc}</td>
							<td class="tdOfTableMan">
								<a href="<c:url value="/editCategory/${category.categoryId}"/>"><button class="btn btn-primary"><i class="fa fa-cogs"></i>&nbsp; Edit</button></a>
							</td>
							<td class="thOfTableMan">
								<a href="<c:url value="/deleteCategory/${category.categoryId}"/>"><button class="btn btn-danger"><i class="fa fa-window-close-o"></i>&nbsp; Delete</button></a>
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