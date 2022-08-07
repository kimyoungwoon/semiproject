<script type="text/javascript" src="<%=cp%>/payment/nav.js"></script>
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
			<a href="#" class="search-switch">
			<img src="<%=cp%>/img/icon/search.png" alt=""></a> 
			<a href="#"><img src="<%=cp%>/img/icon/heart.png" alt=""></a> 
			<a href="#"><img src="<%=cp%>/img/icon/cart.png" alt=""> <span>5</span></a>
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
								<a href="<%=cp %>/login/created.do" class = "desk_sign">Sign in</a> <a href="<%=cp %>/order/orderHistoryList.do">FAQs</a>
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
						<a href="/semiproject/index.jsp"><img src="<%=cp%>/img/logo.png" alt=""></a>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<nav class="header__menu mobile-menu">
						<ul>
							<li><a href="<%=cp %>/index.jsp">Home</a></li>
							<li ><a href="<%=cp %>/shopping/list.do">Shop</a></li>
							<li><a href="#">Pages</a>
								<ul class="dropdown">
									<li><a href="./about.jsp">About Us</a></li>
									<li><a href="./shop-details.jsp">Shop Details</a></li>
									<li><a href="<%=cp %>/cart/cart.do">Shopping Cart</a></li>
									<li><a href="<%=cp %>/order/payment.do">Check Out</a></li>
									<li><a href="./blog-details.jsp">Blog Details</a></li>
								</ul></li>
							<li><a href="./blog.jsp">Blog</a></li>
							<li><a href="./contact.jsp">Contacts</a></li>
						</ul>
					</nav>
				</div>
				<div class="col-lg-3 col-md-3">
					<div class="header__nav__option">
						<a href="#" class="search-switch">
						<img src="<%=cp%>/img/icon/search.png" alt=""></a> 
						<a href="<%=cp %>/nav/wishList.do"><img src="<%=cp%>/img/icon/heart.png" alt=""></a> 
						<a href="<%=cp %>/cart/cart.do" id = "h_menu_countCart"><img src="<%=cp%>/img/icon/cart.png" alt=""><span>5</span></a>
					</div>
				</div>
			</div>
			<div class="canvas__open"><i class="fa fa-bars"></i>
			</div>
		</div>
	</header>