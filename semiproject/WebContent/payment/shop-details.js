var detailRequest = new XMLHttpRequest();
var insertCartRequest = new XMLHttpRequest();
var countCartRequest = new XMLHttpRequest();
var curProductNum = 0;
function registerFunction() {
	//여기도 마찬가지로 요청할때는 session을 이용해서 하면 됨.
	//지금 당장은 테스트로 1
	var productNum = $("#iProductNum").val();
	console.log(productNum);
	detailRequest.open("Post", "http://localhost:8080/semiproject/pdetail/pdetailList.do?productNum=" + eURI(productNum), true);
	detailRequest.onreadystatechange = successConnect;
	detailRequest.send(null);
}

function successConnect() {
//	var table = document.getElementById("productTable");
//	table.innerHTML = "";
	
	if (detailRequest.readyState == 4 && detailRequest.status == 200) {
		var object = eval("(" + detailRequest.responseText + ")");
		var result = object.result;
		curProductNum = result[0].value;
		//변경해야하는 부분
		//pTab의 href=#tab-1 + image
		//vTab의 id=tabs-1 + image
		
		productView(result);
		productInfo(result);
		productOtherInfo(result);
	}
}

//nav 카트 갯수 처리
function countCart() {
	countCartRequest.open("Post", "http://localhost:8080/semiproject/cart/countCart.do", true);
	countCartRequest.onreadystatechange = function() {
		if (countCartRequest.readyState == 4 && countCartRequest.status == 200) {
			var object = eval("(" + countCartRequest.responseText + ")");
			var result = object.result;
			
			var signText = $('#h_menu_countCart').children('span');
			console.log("여기 오긴 오니??")
			signText.text(result);
		}
	};
	console.log("안노위~??")
	countCartRequest.send(null);
}

//add to cart 버튼 눌렀을 때 실행 될 함수
function insertCartFunction() {
	
	var productCount = $("#productCount").val();
	console.log(productCount);
	insertCartRequest.open("Post", "http://localhost:8080/semiproject/shopping/addCartCount.do?productNum=" + eURI(curProductNum) + "&count=" + eURI(productCount), true);
	insertCartRequest.onreadystatechange = insertCartComplete;
	insertCartRequest.send(null);
	countCart();
}

function insertCartComplete() {
	if (insertCartRequest.readyState == 4 && insertCartRequest.status == 200) {
		alert("장바구니에 제품이 추가 되었습니다.");
	}
}

//상품 기타 정보
function productOtherInfo(result){
	
	let OtherInfo = $('.product__details__last__option').children('ul');
	OtherInfo.children('li:eq(0)').html("<span>SKU:</span> " +  result[0].value);
	/*OtherInfo.children('li:eq(1)').html("<span>Categories:</span> " +  result[3].value);
	OtherInfo.children('li:eq(2)').html("<span>Brand:</span> " +  result[4].value);*/
	
}

//상품 주요 정보
function productInfo(result){
	
	let productInfoDiv = $('.product__details__text');
	const tls = (arg) => {
		return "&#8361; " + Number(arg).toLocaleString("ko-KR");
	}
	
	productInfoDiv.children('h4').text(result[1].value);
	productInfoDiv.children('h3').html(tls(result[2].value));
	
}

//상품 사진 보여주기
function productView(result){
	let picTab = $('#detail_pic');
	let viewTab = $('#view_tab');
	var pTab;
	var vTab;
	const setPic = (tabNum, path, active = "") => {
		pTab = "<li class='nav-item'><a class='nav-link " + active +"' data-toggle='tab' href='#tabs-" + tabNum + "' " +
		"role='tab'><div class='product__thumb__pic set-bg' " +
		"style='background-image: url(&quot;" + path + "&quot;);'></div></a></li>";
		
		vTab = "<div class='tab-pane " + active + "' id='tabs-" + tabNum + "' role='tabpanel'>"
        +"<div class='product__details__pic__item'>"
            +"<img src='" + path + "' alt=''> </a>"
        +"</div>"
        +"</div>"
        picTab.append(pTab);
		viewTab.append(vTab)
	}
	
	setPic("1", "../pds/productFile/"+ result[5].value, "active" );
	setPic("2", "../pds/productFile/"+ result[6].value);
	setPic("3", "../pds/productFile/"+ result[7].value);
	setPic("4", "../pds/productFile/"+ result[8].value);
}

window.addEventListener("load", function () {
	registerFunction();
});