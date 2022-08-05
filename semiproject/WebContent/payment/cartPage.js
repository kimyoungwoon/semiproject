var connectRequest = new XMLHttpRequest();
var updateRequest = new XMLHttpRequest();
var deleteRequest = new XMLHttpRequest();
var arrProduct = [];

function registerFunction() {
    //여기도 마찬가지로 요청할때는 session을 이용해서 하면 됨.
    //지금 당장은 테스트로 1
    connectRequest.open("Post", "./cart/shopCart.do?memberNum=" + eURI("1"), true);
    connectRequest.onreadystatechange = successConnect;
    connectRequest.send(null);
}

function successConnect() {
    var table = document.getElementById("productTable");
    table.innerHTML = "";
    if (connectRequest.readyState == 4 && connectRequest.status == 200) {
        var object = eval("(" + connectRequest.responseText + ")");
        var result = object.result;

        for (var i = 0; i < result.length; i++) {
            var row = table.insertRow(0);
            row.innerHTML =
                "<input type='hidden' id='productNum' value='" +
                result[i][1].value +
                "'/>" +
                "<td class='product__cart__item'>" +
                "<div class='product__cart__item__pic'>" +
                "<img src='/semiproject/img/shopping-cart/cart-1.jpg'>" +
                "</div>" +
                "<div class='product__cart__item__text'>" +
                "<h6>" +
                result[i][3].value +
                "</h6>" +
                "<h5>₩ " +
                Number(result[i][4].value).toLocaleString("ko-KR") +
                "</h5>" +
                "</div>" +
                "</td>" +
                "<td class='quantity__item'>" +
                "<div class='quantity'>" +
                "<div class='pro-qty-2'>" +
                //왜 span이 안붙을까??
                //멤버, 제품, 갯수, 이름, 가격
                "<span onclick = 'operationCount(" +
                i +
                ");' class='fa fa-angle-left dec qtybtn'></span>" +
                "<input type='text' value='" +
                result[i][2].value +
                "'>" +
                "<span onclick = 'operationCount(" +
                i +
                "," +
                '"inc"' +
                ");' class='fa fa-angle-right inc qtybtn'></span>" +
                "</div>" +
                "</div>" +
                "</td>" +
                "<td class='cart__price'>₩ " +
                (Number(result[i][2].value) * Number(result[i][4].value)).toLocaleString("ko-KR") +
                "</td>" +
                "<td class='cart__close'>" +
                "<a href='javascript:void(0);' onclick='javascript:deleteCartProduct(" +
                "this" +
                "," +
                result[i][1].value +
                ");'><i class='fa fa-close'></i></a></td>";
            arrProduct[i] = new Array(result[i].length + 1);
            arrProduct[i][0] = result[i][0].value; //회원번호
            arrProduct[i][1] = result[i][1].value; //제품번호
            arrProduct[i][2] = $(row.cells[1]).find("input"); //갯수 요소
            arrProduct[i][3] = result[i][3].value; //이름
            arrProduct[i][4] = result[i][4].value; //가격
            arrProduct[i][5] = $(row.cells[2]); //각각의 상품 소계
        }
        cartTotal();
    }
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
    thisNum.text("₩ " + (price * count).toLocaleString("ko-KR") );

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
    $("#beforeDiscount").text("₩ " + originTotal);
    $("#actualPayment").text("₩ " + totalPrice);
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
    return str.slice(2).replaceAll(",", "");
}

window.onload = function () {
    registerFunction();
};

function eURI(component) {
    return encodeURIComponent(component);
}