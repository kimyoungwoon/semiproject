var navRequest = new XMLHttpRequest();
var countCartRequest = new XMLHttpRequest();
var signInRequest = new XMLHttpRequest();

function navFunction() {
	//sessionStorage.setItem("mine", "회원정보 1");
	//여기도 마찬가지로 요청할때는 session을 이용해서 하면 됨.
	//지금 당장은 테스트로 1
	navRequest.open("Post", "../nav/session.do", true);
	navRequest.onreadystatechange = navSuccessConnect;
	navRequest.send(null);
	checkLogin();
	
}

function navSuccessConnect() {
	if (navRequest.readyState == 4 && navRequest.status == 200) {
		var object = eval("(" + navRequest.responseText + ")");
		var result = object.result;

//		console.log(result);
	}
}

//nav 장바구니 갯수
function countCart() {
	countCartRequest.open("Post", "./cart/countCart.do", true);
	countCartRequest.onreadystatechange = function() {
		if (countCartRequest.readyState == 4 && countCartRequest.status == 200) {
			if(countCartRequest.responseText != null && countCartRequest.responseText != "" ){
				var object = eval("(" + countCartRequest.responseText + ")");
				var result = object.result;
				var hCartCountText = $('#h_menu_countCart').children('span');
				var oCartCountText = $('#o_menu_countCart').children('span');
				hCartCountText.text(result);
				oCartCountText.text(result);
			}
		}
	};
	countCartRequest.send(null);
}

//로그인 확인
function checkLogin() {
	signInRequest.open("Post", "./nav/checkLogin.do", true);
	signInRequest.onreadystatechange = function() {
		if (signInRequest.readyState == 4 && signInRequest.status == 200) {
			if(signInRequest.responseText != null && signInRequest.responseText != "" ){
				var object = eval("(" + signInRequest.responseText + ")");
				var result = object.result;
				//<a href="#" class="desk_sign">MyPage</a>
				if(result == "Logging"){
					var hearderTop = $('.header__top__links');
					var signText = hearderTop.children('.desk_sign');
					signText.html("<a href='#' class='desk_sign'>My Page</a>");
					hearderTop.append("<a href='./login/logout_ok.do' id = 'logout_btn'>Log Out</a>");
					countCart();
				}
			}
			//signText.text(result);
		}
	}
	signInRequest.send(null);
}

window.addEventListener("load", function () {
	navFunction();
});

function eURI(component) {
	return encodeURIComponent(component);
}


