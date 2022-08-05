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
	($(ulTotal).children()[0]).innerHTML = "<li>Before Discount<span class = 'subTotal'>₩ " + originTotal + "</span> </li>";
	($(ulTotal).children()[1]).innerHTML = "<li>Actual Payment<span class = 'subTotal'>₩ "  + totalPrice + "</span> </li>";
}

//<> 버튼 누를 시 해당 상품 갯수 수정
function operationCount(thisNum, inc = null) {
	var inputValue = $(arrProduct[thisNum][2]);
	var productNum = arrProduct[thisNum][1];

	var curValue = Number(inputValue.val());
	var newValue = 1;
	if (inc !== null) {
		newValue = curValue + 1;
	} else {
		if (curValue > 1) {
			newValue = curValue - 1;
		}
	}

	inputValue.val(newValue);

	changeSubTotal($(arrProduct[thisNum][5]), arrProduct[thisNum][4], newValue);
	updateCartProductCount(productNum, newValue);
	cartTotal();
}

//각 상품별 소계
function changeSubTotal(thisNum, price, count) {
	thisNum.text((price * count).toLocaleString("ko-KR") + "원");

	//여기도 마찬가지로 요청할때는 session을 이용해서 하면 됨.
	//지금 당장은 테스트로 1
}
//장바구니 총 금액
function cartTotal(discount = 1) {
	var arrPrice = $("#productTable").closest("tbody").find("tr").length;
	let totalPrice = 0;
	let originTotal = 0;
	for (let price of $(".cart__price")) {
		totalPrice += Number(removeCandWon(price.innerText));
	}
	originTotal = totalPrice;
	totalPrice = totalPrice * discount;

	totalPrice = totalPrice.toLocaleString("ko-KR");
	originTotal = originTotal.toLocaleString("ko-KR");
	$("#beforeDiscount").text(originTotal + "원");
	$("#actualPayment").text(totalPrice + "원");
}

//상품 개수 정보 수정
function updateCartProductCount(productNum, count) {
	updateRequest.open("get", "./ywsemi/updatePC.do?productNum=" + eURI(productNum) + "&count=" + eURI(count), true);
	////	updateRequest.onreadystatechange = successConnect;
	updateRequest.send(null);
}

//상품 삭제
function deleteCartProduct(arg, productNum) {
	deleteRequest.open("Post", "./ywsemi/deleteCart.do?productNum=" + eURI(productNum), true);
	//	deleteRequest.onreadystatechange = successConnect;
	deleteRequest.send(null);
	$(arg).closest("tr").remove();
	cartTotal();
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

window.onload = function () {
	registerFunction();
};

function eURI(component) {
	return encodeURIComponent(component);
}