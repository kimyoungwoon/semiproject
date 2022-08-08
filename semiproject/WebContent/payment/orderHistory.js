var orderHistoryRequest = new XMLHttpRequest();
var deleteRequest = new XMLHttpRequest();
var detailRequest = new XMLHttpRequest();
var orderNumber = 0;

function registerFunction() {
	//여기도 마찬가지로 요청할때는 session을 이용해서 하면 됨.
	//지금 당장은 테스트로 1
	orderHistoryRequest.open("Post", "./order/orderHistory.do", true);
	orderHistoryRequest.onreadystatechange = readConnect;
	orderHistoryRequest.send(null);
}

function readConnect() {
	var table = document.getElementById("orderTable");
	table.innerHTML = "";
	if (orderHistoryRequest.readyState == 4 && orderHistoryRequest.status == 200) {
		var object = eval("(" + orderHistoryRequest.responseText + ")");
		var result = object.result;
		console.log(result);

		for (var i = 0; i < result.length; i++) {
			var row = table.insertRow(0);
			row.innerHTML = "<td height = '50px' class='product__cart__item' >"
				+"<a href='javascript:void(0);' onclick='javascript:orderDetailView("
		        +result[i][1].value
		        +");'>"
				+"<div class='product__cart__item__pic'>"
				+"<img src='" + result[i][5].value +"' style='width:90px; height:90px;'>"
				+"</div>"
				+"<div class='product__cart__item__text'>"
				+"<h6>" + "ORDER " + result[i][1].value + "</h6>"
				+"<h6>" +  result[i][4].value + " and " + result[i][6].value +" etc</h6>"
				+"</div>"
				+"</td>"
				+"</a>"
				+"<td class='cart__price'>"+ result[i][3].value +"</td>"
				+"<td class='cart__price'>&#8361; "+ Number(result[i][2].value).toLocaleString("ko-KR") +"</td>"
				+"<td class='cart__close'>"
				+"<a href='javascript:void(0);' onclick='javascript:deleteCartProduct("
				+"this"
		        +","
		        +result[i][1].value
		        +");'><i class='fa fa-close'></i></a></td>";
		}
	}
}

//해당 주문 클릭스 주문 상세로 가도록 구현할 메서드
function orderDetailView(orderNum) {
	
	location.href = "./orderDetail.do?orderNum=" + orderNum;
	
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

//주문 삭제
function deleteCartProduct(arg, orderNum) {
	
	var result = confirm("정말 삭제하시겠습니까?");
	if(!result){
	    return;
	}
	deleteRequest.open("Post", "./order/deleteOrder.do?orderNum=" + eURI(orderNum), true);
	//	deleteRequest.onreadystatechange = successConnect;
	deleteRequest.send(null);	//주석 처리 해제 시 제대로 삭제 됨.
	$(arg).closest("tr").remove();
}

function removeCandWon(str) {
	return str.slice(2).replaceAll(",", "");
}

window.addEventListener("load", function () {
	registerFunction();
});

function eURI(component) {
	return encodeURIComponent(component);
}