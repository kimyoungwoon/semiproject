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
	let viewTab = $('#view_tab');
	if (detailRequest.readyState == 4 && detailRequest.status == 200) {
		var object = eval("(" + detailRequest.responseText + ")");
		var result = object.result;
		//console.log(viewTab)
//		console.log(result)
		
		//picTab.html("");
		
		picTab.append("<li class='nav-item'><a class='nav-link' data-toggle='tab' href='#tabs-5' " +
				"role='tab'><div class='product__thumb__pic set-bg' data-setbg='../img/shop-details/product-big-2.png' " +
				"style='background-image: url(&quot;../img/shop-details/thumb-1.png&quot;);'></div></a></li>");
		
		viewTab.append("<div class='tab-pane' id='tabs-5' role='tabpanel'>"
        +"<div class='product__details__pic__item'>"
            +"<img src='../img/shop-details/product-big-2.png' alt=''>"
            +"<a href='https://www.youtube.com/watch?v=8PJ3_p7VqHw&amp;list=RD8PJ3_p7VqHw&amp;start_radio=1' class='video-popup'><i class='fa fa-play'></i></a>"
        +"</div>"
    +"</div>")
		
		
		
		
//		<div class='tab-pane' id='tabs-4' role='tabpanel'>
//        <div class='product__details__pic__item'>
//            <img src='../img/shop-details/product-big-4.png' alt=''>
//            <a href='https://www.youtube.com/watch?v=8PJ3_p7VqHw&amp;list=RD8PJ3_p7VqHw&amp;start_radio=1' class='video-popup'><i class='fa fa-play'></i></a>
//        </div>
//    </div>
		
//		+"</li>"
//		+"<li class='nav-item'>"
//		+"<a class='nav-link' data-toggle='tab' href='#tabs-2' role='tab'>"
//		+"<div class='product__thumb__pic set-bg' data-setbg='/img/shop-details/thumb-2.png'>"
//		+"</div>"
//		+"</a>"
//		+"</li>"
//		+"<li class='nav-item'>"
//		+"<a class='nav-link' data-toggle='tab' href='#tabs-3' role='tab'>"
//		+"<div class='product__thumb__pic set-bg' data-setbg='semiproject/img/shop-details/thumb-3.png'>"
//		+"</div>"
//		+"</a>"
//		+"</li>"
//		+"<li class='nav-item'>"
//		+"<a class='nav-link' data-toggle='tab' href='#tabs-4' role='tab'>"
//		+"<div class='product__thumb__pic set-bg' data-setbg='img/shop-details/thumb-4.png'>"
//		+"<i class='fa fa-play'></i>"
//		+"</div>"
//		+"</a>"
//		+"</li>";
//		
//		picTab.html(detailView);
//
//
//
//		console.log(picTab);
//
//



	}
}

window.addEventListener("load", function () {
	registerFunction();
});