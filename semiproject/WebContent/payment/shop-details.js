var detailRequest = new XMLHttpRequest();
var arrProduct = [];

function registerFunction() {
	//여기도 마찬가지로 요청할때는 session을 이용해서 하면 됨.
	//지금 당장은 테스트로 1
	var productNum = $("#iProductNum").val();
	console.log(productNum);
	detailRequest.open("Post", "../pdetail/pdetailList.do?productNum=" + eURI(productNum), true);
	detailRequest.onreadystatechange = successConnect;
	detailRequest.send(null);
}

function successConnect() {
//	var table = document.getElementById("productTable");
//	table.innerHTML = "";
	let picTab = $('#detail_pic');
	if (detailRequest.readyState == 4 && detailRequest.status == 200) {
		var object = eval("(" + detailRequest.responseText + ")");
		var result = object.result;
		picTab.html("");

		var detailView = "<li class='nav-item' >"
		+"<a class='nav-link active' data-toggle='tab' href='#tabs-1' role='tab'>"
		+"<div class='product__thumb__pic' style='background-image : url('img/shop-details/thumb-2.png')'>"
		+"</div>"
		+"</a>"
		+"</li>"
		+"<li class='nav-item'>"
		+"<a class='nav-link' data-toggle='tab' href='#tabs-2' role='tab'>"
		+"<div class='product__thumb__pic set-bg' data-setbg='/img/shop-details/thumb-2.png'>"
		+"</div>"
		+"</a>"
		+"</li>"
		+"<li class='nav-item'>"
		+"<a class='nav-link' data-toggle='tab' href='#tabs-3' role='tab'>"
		+"<div class='product__thumb__pic set-bg' data-setbg='semiproject/img/shop-details/thumb-3.png'>"
		+"</div>"
		+"</a>"
		+"</li>"
		+"<li class='nav-item'>"
		+"<a class='nav-link' data-toggle='tab' href='#tabs-4' role='tab'>"
		+"<div class='product__thumb__pic set-bg' data-setbg='img/shop-details/thumb-4.png'>"
		+"<i class='fa fa-play'></i>"
		+"</div>"
		+"</a>"
		+"</li>";
		
		picTab.html(detailView);



		console.log(picTab);





	}
}

window.addEventListener("load", function () {
	registerFunction();
});