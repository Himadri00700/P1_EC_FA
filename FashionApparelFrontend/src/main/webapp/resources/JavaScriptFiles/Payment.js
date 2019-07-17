function validate() {
	let result=true;
    const input= document.querySelectorAll(".form-control");
	const nameOnCard= input[0].value;
	const cardNumber= input[1].value;
	const cVV= input[2].value;
	const month= input[3].value;
	const year= input[4].value;

	if(nameOnCard.length>40 || nameOnCard.length<3) {
		result=false;
		alert("your full name isn't correct. Either too small(<3) or too large(<40) ez. xyz abc");
	}
	else if(cardNumber.length!=16) {
        result=false;
        alert("Card Number must contain 16 digists");
    }
	else if(cVV.length!=3) {
        result=false;
        alert("CVV must contain 3 digists");
    }
	else if(month.length<1 || month.length>2 || month>12 || month<1) {
        result=false;
        alert("Check expiration Month");
    }
	else if(year.length!=4 || year>2030 || year<=2019) {
		result=false;
        alert("Check expiration Year");
	}
	return(result);
}
