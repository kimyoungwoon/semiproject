var connectRequest = new XMLHttpRequest();
var updateRequest = new XMLHttpRequest();
var deleteRequest = new XMLHttpRequest();
var arrProduct = [];

function registerFunction() {
//	여기도 마찬가지로 요청할때는 session을 이용해서 하면 됨.
//	지금 당장은 테스트로 1
	console.log("결제페이지 요청")
	connectRequest.open("Post", "./order/paymentList.do?memberNum=" + eURI("1"), true);
	connectRequest.onreadystatechange = successConnect;
	connectRequest.send(null);
	successConnect();
}

function successConnect() {

	ulList = document.getElementsByClassName("checkout__total__products");
	ulTotal = document.getElementsByClassName("checkout__total__all");
	ulList.innerHTML = "";
	ulTotal.innerHTML = "";

	let totalPrice = 0;
	let originTotal = 0;

	if (connectRequest.readyState == 4 && connectRequest.status == 200) {
		console.log("성공")
		var object = eval("(" + connectRequest.responseText + ")");
		var result = object.result;
		let subTotal = 0;
		//멤버, 제품, 갯수, 이름, 가격
		for (var i = 0; i < result.length; i++) {
			subTotal = Number(result[i][4].value) * Number(result[i][2].value);
			originTotal += subTotal;
			$(ulList).append("<li>" + (i + 1) + ". " + result[i][3].value + "&nbsp; x" + result[i][2].value
					+ "<span class = 'subTotal'>"+ subTotal.toLocaleString("ko-KR") +"</span> </li>");

		}
//		cartTotal();
	}
	totalPrice = originTotal;
	totalPrice = totalPrice.toLocaleString("ko-KR");
	originTotal = originTotal.toLocaleString("ko-KR");
	($(ulTotal).children()[0]).innerHTML = "<li>Before Discount<span class = 'subTotal'> " + "&#8361;" + originTotal + "</span> </li>";
	($(ulTotal).children()[1]).innerHTML = "<li>Actual Payment<span class = 'subTotal'>"+ "&#8361;" + totalPrice + "</span> </li>";
}

function useCoupon(apply) {
	var code = $(apply).parent().children('input').val();
	if(code == "itwill"){
		alert("10% 할인이 되었습니다.");
		cartTotal(0.9);
		return;
	}
	alert("사용할 수 없는 코드입니다.");
}

function removeCandWon(str) {
	return str.slice(0, -1).replaceAll(",", "");
}

window.addEventListener("load", function () {
	registerFunction();
});

function eURI(component) {
	return encodeURIComponent(component);
}