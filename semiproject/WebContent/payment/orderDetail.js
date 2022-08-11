var orderDetailList = new XMLHttpRequest();
var deleteRequest = new XMLHttpRequest();

function registerFunction() {
	//여기도 마찬가지로 요청할때는 session을 이용해서 하면 됨.
	//지금 당장은 테스트로 1
	var orderNum = $("#iOrderNum").val();

	orderDetailList.open("Post", "http://localhost:8080/semiproject/order/orderDetailList.do?orderNum=" + orderNum, true);
	orderDetailList.onreadystatechange = readConnect;
	orderDetailList.send(null);
}

function readConnect() {
	var table = document.getElementById("orderTable");
    table.innerHTML = "";
	if (orderDetailList.readyState == 4 && orderDetailList.status == 200) {
		console.log(orderDetailList.responseText);

		var object = eval("(" + orderDetailList.responseText + ")");
		var result = object.result;
		console.log(result);
		
		for (var i = 0; i < result.length; i++) {
			var row = table.insertRow(0);
			row.innerHTML = "<td class='product__cart__item'>" +
				"<div class='product__cart__item__pic'>" +
				"<img src='" + result[i][6].value +"' style='width:90px; height:90px;'>" +
				"</div>" +
				"<div class='product__cart__item__text'>" +
				"<h6>" +
				result[i][5].value +
				"</h6>" +
				"<h5>&#8361; " +
				Number(result[i][3].value).toLocaleString("ko-KR") +
				"</h5>" +
				"</div>" +
				"</td>" +
				"<td class='quantity__item'>" +
				"<div class='quantity'>" +
				"<div class='pro-qty-2'>" +
				"<input type='text' value='" +
				result[i][4].value +
				"'>" +
				"</div>" +
				"</div>" +
				"</td>" +
				"<td class='cart__price'>"+ "&#8361; " +
				(Number(result[i][3].value) * Number(result[i][4].value)).toLocaleString("ko-KR") +
				"</td>";
		}
	}	
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