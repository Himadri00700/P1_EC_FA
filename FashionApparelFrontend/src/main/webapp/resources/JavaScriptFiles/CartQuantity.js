function validate() {
	let result=true;
	const quantity=document.getElementById("quantity").value;
	
	if(quantity<1) {
		result=false;
		alert("qyantiry must not '0' or negative value!!");
	}
	return (result);
}