
function validate() {
	let result=true;
	const input= document.querySelectorAll(".form-control");
	const customerName= input[0].value;
	const username= input[1].value;
	const password= input[2].value;
	const emailId= input[3].value;
	const address= input[4].value;
	const confirmPassword= input[5].value;
	
	
	if(customerName.length>40 || customerName.length<4 || customerName.indexOf(' ')==-1 || customerName.indexOf(' ')==0 || customerName.indexOf(' ')==(customerName.length-1)) {
		result=false;
		alert("Entered customerName is Wrong. You cann't enter more than 40 or less than 4 characters. And must contain a space. And you cann't use space at the beginning or end of customerName. ez. 'xyz abc'");
	}
	else if(username.length>20 || username.length<4 || username.indexOf(' ')!=-1) {
		result=false;
		alert("Entered username is Wrong. You cann't enter more than 20 or less than 4 characters. And you cann't use spacei n username. ez. 'abcxyz'");
	}
	else if(password===username || password.length>20 || password.length<8 || password.indexOf(' ')!=-1 || password.match(/[A-Z]/g)==null || password.match(/[a-z]/g)==null || password.match(/[0-9]/g)==null) {
		result=false;
		alert("Entered password is Wrong. Your entered password is not same as your user name. You cann't enter more than 40 or less than 8 characters. And you cann't use space in password. And must contain a 'upper-case', a 'lower-case' and a 'number'. ez. 'pQr9t'");
	}
	else if(confirmPassword!==password) {
		result=false;
		alert("Entered confirmPassword doesn't match the password!! Please check it properly.")
	}
	return(result);
}
