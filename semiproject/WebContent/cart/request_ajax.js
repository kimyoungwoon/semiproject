	var connectRequest = new XMLHttpRequest();
	var deleteRequest = new XMLHttpRequest();
	function registerFunction() {
		//여기도 마찬가지로 요청할때는 session을 이용해서 하면 됨.
		//지금 당장은 테스트로 1
		connectRequest.open("Post", "./ywsemi/shopCart.do?memberNum=" + encodeURIComponent("2"), true);
		connectRequest.onreadystatechange = successConnect;
		connectRequest.send(null);
	}

	function successConnect(){
		var table = document.getElementById('productTable');
		table.innerHTML = "";
		if(connectRequest.readyState == 4 && connectRequest.status == 200) {
			
			var object = eval('(' + connectRequest.responseText + ')');
			var result = object.result;
			
			for(var i = 0; i < result.length; i++) {
				var row = table.insertRow(0);
					row.innerHTML = "<input type='hidden' id='productNum' value='" + result[i][1].value + "'/>"
						+"<td class='product__cart__item'>"
						+ "<div class='product__cart__item__pic'>"
					+"<img src='./semiproject/img/shopping-cart/cart-1.jpg'>"
					+"</div>"+"<div class='product__cart__item__text'>"
						+"<h6>"+ result[i][3].value +"</h6>"
						+"<h5>" + Number(result[i][4].value).toLocaleString('ko-KR') + "원</h5>"
					+"</div>"
				+"</td>"
					+"<td class='quantity__item'>"
					+"<div class='quantity'>"
						+"<div class='pro-qty-2'>"
						//왜 span이 안붙을까??
						//멤버, 제품, 갯수, 이름, 가격
						+"<span onclick = 'operationCount(this);' class='fa fa-angle-left dec qtybtn'></span>"
							+"<input type='text' value='" + result[i][2].value + "'>"
							+"<span onclick = 'operationCount(this);' class='fa fa-angle-right inc qtybtn'></span>"
						+"</div>"
					+"</div>"
				+"</td>"
					+"<td class='cart__price'>" 
					+ (Number(result[i][2].value) * Number(result[i][4].value)).toLocaleString('ko-KR')
					+ "원</td>"
					+ "<td class='cart__close'>"
							+"<a href='javascript:void(0);' onclick='javascript:deleteCartProduct(this);'><i class='fa fa-close'></i></a></td>";
			}
			
			
			
		}
	}
	
	
	function operationCount(arg){
		var inputValue = $(arg).parent().find('input');
		var curValue = Number(inputValue.val());
		var newValue = 0;
		if ($(arg).hasClass('inc')) {
			newValue = curValue + 1;
		}
		else{
			if(curValue > 0){
				newValue = curValue - 1;
			}
		} 
		//console.log($(arg).parent().closest('input[productNum]').val());
		console.log($(arg).closest('tr').children("input:hidden[id='productNum']").val());
		inputValue.val(newValue);
		changeTotal(arg);
		
	}
	
	function changeTotal(arg){
		var productNum = $(arg).closest('tr').children('h5');
		console.log(productNum);
		//여기도 마찬가지로 요청할때는 session을 이용해서 하면 됨.
		//지금 당장은 테스트로 1
}
	
	function deleteCartProduct(arg){
			var productNum = $(arg).closest('tr').children("input:hidden[id='productNum']").val();
			//여기도 마찬가지로 요청할때는 session을 이용해서 하면 됨.
			//지금 당장은 테스트로 1
			deleteRequest.open("Post", "./ywsemi/cartDelete.do?productNum=" + encodeURIComponent(productNum), true);
//			deleteRequest.onreadystatechange = successConnect;
			deleteRequest.send(null);
			$(arg).closest('tr').remove();
	}
	
	
	
window.onload = function() {
	registerFunction();
}