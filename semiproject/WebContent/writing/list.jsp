<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Male_Fashion Template">
<meta name="keywords" content="Male_Fashion, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Male-Fashion | Template</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="<%=cp%>/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/css/elegant-icons.css"	type="text/css">
<link rel="stylesheet" href="<%=cp%>/css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/css/style.css" type="text/css">
<link rel="stylesheet" type="text/css"href="<%=cp%>/writing/css/style.css" />
<link rel="stylesheet" type="text/css" href="<%=cp%>/writing/css/list.css" />
<script type="text/javascript" src="<%=cp%>/writing/js/util.js"></script>
<script type="text/javascript">

	function sendIt() {
		
		var f = document.searchForm;
		
		f.action = "<%=cp%>/bbs/list.do";
		f.submit();
	}
</script>
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Offcanvas Menu Begin -->
	<div class="offcanvas-menu-overlay"></div>
	<div class="offcanvas-menu-wrapper">
		<div class="offcanvas__option">
			<div class="offcanvas__links">
				<a href="#">Sign in</a> <a href="#">FAQs</a>
			</div>
			<div class="offcanvas__top__hover">
				<span>Usd <i class="arrow_carrot-down"></i></span>
				<ul>
					<li>USD</li>
					<li>EUR</li>
					<li>USD</li>
				</ul>
			</div>
		</div>
		<div class="offcanvas__nav__option">
			<a href="#" class="search-switch"><img
				src="<%=cp%>/img/icon/search.png" alt=""></a> <a href="#"><img
				src="<%=cp%>/img/icon/heart.png" alt=""></a> <a href="#"><img
				src="<%=cp%>/img/icon/cart.png" alt=""> <span>0</span></a>
			<div class="price">$0.00</div>
		</div>
		<div id="mobile-menu-wrap"></div>
		<div class="offcanvas__text">
			<p>Free shipping, 30-day return or refund guarantee.</p>
		</div>
	</div>
	<!-- Offcanvas Menu End -->

	<!-- Header Section Begin -->
	<header class="header">
	<div class="header__top">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-7">
					<div class="header__top__left">
						<p>Free shipping, 30-day return or refund guarantee.</p>
					</div>
				</div>
				<div class="col-lg-6 col-md-5">
					<div class="header__top__right">
						<div class="header__top__links">
							<a href="#">Sign in</a> <a href="#">FAQs</a>
						</div>
						<div class="header__top__hover">
							<span>Usd <i class="arrow_carrot-down"></i></span>
							<ul>
								<li>USD</li>
								<li>EUR</li>
								<li>USD</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-3">
				<div class="header__logo">
					<a href="./index.jsp"><img src="<%=cp%>/img/logo.png" alt=""></a>
				</div>
			</div>
			<div class="col-lg-6 col-md-6">
				<nav class="header__menu mobile-menu">
				<ul>
					<li><a href="./index.jsp">Home</a></li>
					<li class="active"><a href="./shop.jsp">Shop</a></li>
					<li><a href="#">Q&A</a>
						<ul class="dropdown">
							<li><a href="./about.jsp">About Us</a></li>
							<li><a href="./shop-details.jsp">Shop Details</a></li>
							<li><a href="<%=cp%>/bbs/list.do">Writing</a></li>
							<li><a href="./checkout.jsp">Check Out</a></li>
							<li><a href="./blog-details.jsp">Blog Details</a></li>
						</ul></li>
					<li><a href="./blog.jsp">Blog</a></li>
					<li><a href="./contact.jsp">Contacts</a></li>
				</ul>
				</nav>
			</div>
			<div class="col-lg-3 col-md-3">
				<div class="header__nav__option">
					<a href="#" class="search-switch"><img
						src="<%=cp%>/img/icon/search.png" alt=""></a> <a href="#"><img
						src="<%=cp%>/img/icon/heart.png" alt=""></a> <a href="#"><img
						src="<%=cp%>/img/icon/cart.png" alt=""> <span>0</span></a>
					<div class="price">$0.00</div>
				</div>
			</div>
		</div>
		<div class="canvas__open">
			<i class="fa fa-bars"></i>
		</div>
	</div>
	</header>
	
	<!-- Header Section End -->

	<!-- writing Section Begin -->
	<br />
	<br />
	<br />
	<br />
	<br />
	
	<div id="bbsList">		
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="related-title">QuestioN</h1>
				</div>
			</div>
		</div>
		<div id="bbsList_header">
			<div id="rightHeader">
				<input type="button" value=" Post " class="btn2"
				onclick="javascript:location.href='<%=cp%>/bbs/created.do';" />
			</div>

			<div id="bbsList_list">
				<div id="title">
					<dl>
						<dt class="num">Number</dt>
						<dt class="subject">Subject</dt>
						<dt class="name">Name</dt>
						<dt class="savepath">Date Created</dt>
						<dt class="hitcount">views</dt>
					</dl>
				</div>
				<div id="lists">
					<c:forEach var="dto" items="${lists }">
						<!-- lists에 5개에 데이터가 있어서 하나씩 준다 -->
						<dl>
							<dd class="num">${dto.num }</dd>
							<dd class="subject">
								<a href="${articleUrl}&num=${dto.num }">${dto.subject }</a>
							</dd>
							<dd class="name">${dto.name }</dd>
							<dd class="savepath">${dto.savePath }</dd>
							<dd class="hitcount">${dto.hitcount }</dd>
						</dl>
					</c:forEach>
				</div>
				<div id="footer">
					<p>
					<c:if test="${dataCount!=0 }">
						${pageIndexList }
					</c:if>
						<c:if test="${dataCount==0 }">
						There is no registered post.
					</c:if>
					</p>
				</div>
				<div id="leftHeader" style="margin: auto;">
					<form action="" method="post" name="searchForm" >
						<select name="searchKey" class="selectField">
							<option value="subject">Subject</option>
							<option value="name">Name</option>
							<option value="content">Content</option>
						</select> 
						<input type="text" name="searchValue" class="textField" /> <input
						type="button" value=" Search " class="btn2" onclick="sendIt();" />
					</form>
					</div>
				
			</div>
		</div>
	</div>
	
	<!-- writing Section end -->

	<!-- Footer Section Begin -->
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<footer class="footer">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-6 col-sm-6">
				<div class="footer__about">
					<div class="footer__logo">
						<a href="#"><img src="<%=cp%>/img/footer-logo.png" alt=""></a>
					</div>
					<p>The customer is at the heart of our unique business model,
						which includes design.</p>
					<a href="#"><img src="<%=cp%>/img/payment.png" alt=""></a>
				</div>
			</div>
			<div class="col-lg-2 offset-lg-1 col-md-3 col-sm-6">
				<div class="footer__widget">
					<h6>Shopping</h6>
					<ul>
						<li><a href="#">Clothing Store</a></li>
						<li><a href="#">Trending Shoes</a></li>
						<li><a href="#">Accessories</a></li>
						<li><a href="#">Sale</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-2 col-md-3 col-sm-6">
				<div class="footer__widget">
					<h6>Shopping</h6>
					<ul>
						<li><a href="#">Contact Us</a></li>
						<li><a href="#">Payment Methods</a></li>
						<li><a href="#">Delivary</a></li>
						<li><a href="#">Return & Exchanges</a></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-3 offset-lg-1 col-md-6 col-sm-6">
				<div class="footer__widget">
					<h6>NewLetter</h6>
					<div class="footer__newslatter">
						<p>Be the first to know about new arrivals, look books, sales
							& promos!</p>
						<form action="#">
							<input type="text" placeholder="Your email">
							<button type="submit">
								<span class="icon_mail_alt"></span>
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="footer__copyright__text">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					<p>
						Copyright ©
						<script>
							document.write(new Date().getFullYear());
						</script>
						2020 All rights reserved | This template is made with <i
							class="fa fa-heart-o" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
					</p>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</div>
			</div>
		</div>
	</div>
	</footer>
	<!-- Footer Section End -->

	<!-- Search Begin -->
	<div class="search-model">
		<div class="h-100 d-flex align-items-center justify-content-center">
			<div class="search-close-switch">+</div>
			<form class="search-model-form">
				<input type="text" id="search-input" placeholder="Search here.....">
			</form>
		</div>
	</div>
	<!-- Search End -->
	<!-- Js Plugins -->
	<script src="<%=cp%>/js/jquery-3.3.1.min.js"></script>
	<script src="<%=cp%>/js/bootstrap.min.js"></script>
	<script src="<%=cp%>/js/jquery.nice-select.min.js"></script>
	<script src="<%=cp%>/js/jquery.nicescroll.min.js"></script>
	<script src="<%=cp%>/js/jquery.magnific-popup.min.js"></script>
	<script src="<%=cp%>/js/jquery.countdown.min.js"></script>
	<script src="<%=cp%>/js/jquery.slicknav.js"></script>
	<script src="<%=cp%>/js/mixitup.min.js"></script>
	<script src="<%=cp%>/js/owl.carousel.min.js"></script>
	<script src="<%=cp%>/js/main.js"></script>
</body>
</html>