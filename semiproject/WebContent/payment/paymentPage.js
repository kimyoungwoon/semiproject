var paymentRequest = new XMLHttpRequest();
var actualRequest = new XMLHttpRequest();
var billingDetailRequest = new XMLHttpRequest();

function registerFunction() {
//	여기도 마찬가지로 요청할때는 session을 이용해서 하면 됨.
//	지금 당장은 테스트로 1
	//console.log("결제페이지 요청")
	paymentRequest.open("Post", "./order/paymentList.do?memberNum=" + eURI("1"), true);
	paymentRequest.onreadystatechange = successConnect;
	paymentRequest.send(null);

	actualRequest.open("Post", "./order/actualPayment.do", true);
	actualRequest.onreadystatechange = actualPayment;
	actualRequest.send(null);
	
	billingDetailRequest.open("Post", "./order/billingDetail.do", true);
	billingDetailRequest.onreadystatechange = setbillingDetail;
	billingDetailRequest.send(null);
	
}

function successConnect() {

	ulList = document.getElementsByClassName("checkout__total__products");
	ulTotal = document.getElementsByClassName("checkout__total__all");
	ulList.innerHTML = "";
	ulTotal.innerHTML = "";

	let originTotal = 0;

	if (paymentRequest.readyState == 4 && paymentRequest.status == 200) {
		console.log("성공")
		var object = eval("(" + paymentRequest.responseText + ")");
		var result = object.result;
		let subTotal = 0;
		//멤버, 제품, 갯수, 이름, 가격
		for (var i = 0; i < result.length; i++) {
			subTotal = Number(result[i][4].value) * Number(result[i][2].value);
			originTotal += subTotal;
			$(ulList).append("<li>" + (i + 1) + ". " + result[i][3].value + "&nbsp; x" + result[i][2].value
					+ "<span class = 'subTotal'>"+ subTotal.toLocaleString("ko-KR") +"</span> </li>");
		}
	}
	originTotal = originTotal.toLocaleString("ko-KR");
	($(ulTotal).children()[0]).innerHTML = "<li>Before Discount<span class = 'subTotal'> " + "&#8361;" + originTotal + "</span> </li>";
	
}

function actualPayment() {
	if (actualRequest.readyState == 4 && actualRequest.status == 200) {
		//console.log("액츄얼")
		var object = eval("(" + actualRequest.responseText + ")");
		var result = object.result;
		result = Number(result).toLocaleString("ko-KR");
		($(document.getElementsByClassName("checkout__total__all")).children()[1]).innerHTML = "<li>Actual Payment<span class = 'subTotal'>"+ "&#8361;" + result + "</span> </li>";
	}
}

function setbillingDetail() {
	if (billingDetailRequest.readyState == 4 && billingDetailRequest.status == 200) {
		//console.log("빌링")
		var object = eval("(" + billingDetailRequest.responseText + ")");
		var result = object.result;
		
		 $("input[name=name]").val(result[0].value);
		 $("input[name=tel]").val(barTel(result[1].value));
		 $("input[name=email]").val(result[2].value);
		 $("input[name=addr1]").val(result[3].value);
		 $("input[name=addr2]").val(result[3].value);
		
//		checkout__input
		//($(document.getElementsByClassName("checkout__total__all")).children()[1]).innerHTML = "<li>Actual Payment<span class = 'subTotal'>"+ "&#8361;" + result + "</span> </li>";
	}
}

function removeCandWon(str) {
	return str.slice(0, -1).replaceAll(",", "");
}

function barTel(pNumber) {
	return (pNumber.slice(0, 3) + "-" + pNumber.slice(3, 7) + "-" + pNumber.slice(7, 11));
}

function eURI(component) {
	return encodeURIComponent(component);
}

window.addEventListener("load", function () {
	registerFunction();
});
