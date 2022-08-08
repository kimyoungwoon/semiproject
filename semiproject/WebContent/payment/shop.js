var connectRequest = new XMLHttpRequest();
var updateRequest = new XMLHttpRequest();
var deleteRequest = new XMLHttpRequest();
var countCartRequest = new XMLHttpRequest();
var arrProduct = [];

function registerFunction() {
    //여기도 마찬가지로 요청할때는 session을 이용해서 하면 됨.
    //지금 당장은 테스트로 1
    connectRequest.open("Post", "./cart/cartList.do?memberNum=" + eURI("1"), true);
    connectRequest.onreadystatechange = successConnect;
    connectRequest.send(null);
}

function successConnect() {
    
}

//<> 버튼 누를 시 해당 상품 갯수 수정
function goProductDetail(then) {
	console.log("하이"+ then);
	location.href = "./orderDetail.do?orderNum=" + orderNum;
}

//각 상품별 소계
function changeSubTotal(thisNum, price, count) {
    thisNum.html("&#8361; " + (price * count).toLocaleString("ko-KR") );

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
    $("#beforeDiscount").html("&#8361; " + originTotal);
    $("#actualPayment").html("&#8361; " + totalPrice);
}

//상품 개수 정보 수정
function updateCartProductCount(productNum, count) {
    updateRequest.open("get", "./cart/updatePC.do?productNum=" + eURI(productNum) + "&count=" + eURI(count), true);
    ////	updateRequest.onreadystatechange = successConnect;
    updateRequest.send(null);
}

//상품 삭제
function deleteCartProduct(arg, productNum) {
    deleteRequest.open("Post", "./cart/deleteCart.do?productNum=" + eURI(productNum), true);
    //	deleteRequest.onreadystatechange = successConnect;
    deleteRequest.send(null);
    $(arg).closest("tr").remove();
    cartTotal();
    countCart();
}

//nav 카트 갯수 처리
function countCart() {
	countCartRequest.open("Post", "http://localhost:8080/semiproject/cart/countCart.do", true);
	countCartRequest.onreadystatechange = function() {
		if (countCartRequest.readyState == 4 && countCartRequest.status == 200) {
			var object = eval("(" + countCartRequest.responseText + ")");
			var result = object.result;
			
			var signText = $('#h_menu_countCart').children('span');
			signText.text(result);
		}
	};
	countCartRequest.send(null);
}

//쿠폰 사용
function useCoupon(apply) {
	var code = $(apply).parent().children('input').val();
	if(code == "itwill"){
		alert("10% 할인이 되었습니다.");
		cartTotal(0.9);
		return;
	}
	alert("사용할 수 없는 코드입니다.");
}

//폼 이동
function sendIt(){
	var f = document.cartForm;
	var actualPayment = $("#actualPayment").text().replaceAll(/\D/gm, "");
	
	f.discountCost.value = actualPayment;
	f.method = "post"
	f.action = "/semiproject/order/payment.do";
	f.submit();
}

function removeCandWon(str) {
    return str.slice(2).replaceAll(",", "");
}

window.addEventListener("load", function () {
//	registerFunction();
});

function eURI(component) {
    return encodeURIComponent(component);
}