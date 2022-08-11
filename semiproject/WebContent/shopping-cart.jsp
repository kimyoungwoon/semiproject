<%@include file = "payment/header.jsp"  %>
<link rel="stylesheet" href="<%=cp%>/payment/custom.css" type="text/css">
<script type="text/javascript" src="<%=cp %>/payment/cartPage.js"></script>


<body>
	<!-- Header Section End -->
	<%@include file = "payment/nav.jsp"  %>
	
	<!-- Breadcrumb Section Begin -->
	<section class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__text">
						<h4 id='sc'>Shopping Cart</h4>
						<div class="breadcrumb__links">
							<a href="./index.jsp">Home</a> <a href="./shop.jsp">Shop</a> <span>Shopping
								Cart</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Breadcrumb Section End -->

	<!-- Shopping Cart Section Begin -->
	<section class="shopping-cart spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="shopping__cart__table">
						<table>
							<thead>
								<tr>
									<th>Product</th>
									<th>Quantity</th>
									<th>Total</th>
									<th></th>
								</tr>
							</thead>
							<tbody id="productTable">
							</tbody>
						</table>
					</div>
					<div class="row">
						<div class="col-lg-6 col-md-6 col-sm-6">
							<div class="continue__btn">
								<a href="<%=cp %>/shopping/list.do">Continue Shopping</a>
							</div>
						</div>
						<!-- <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="continue__btn update__btn">
                                <a href="#"><i class="fa fa-spinner"></i> Update cart</a>
                            </div>
                        </div> -->
					</div>
				</div>
				<div class="col-lg-4">
					<div class="cart__discount">
						<h6>Discount codes</h6>
						<form>
							<input type="text" placeholder="Coupon code">
							<button type="button" onclick="useCoupon(this);">Apply</button>
						</form>
					</div>
					<div class="cart__total">
						<h6>Cart total</h6>
						<ul>
							<li>Before Discount <span id="beforeDiscount">&#8361; 0</span></li>
							<li>Actual Payment <span id="actualPayment">&#8361; 0</span></li>
						</ul>
						<%-- <a href="<%=cp%>/checkout.jsp" class="primary-btn">Proceed to
							checkout</a> --%>
						<form name="cartForm">
							<input type="hidden" name="discountCost" value="0" /> <input
								class="primary-btn" value="Proceed to checkout"
								onclick="sendIt();" type="button">
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Shopping Cart Section End -->

	<!-- Footer Section Begin -->
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

	<%@include file = "payment/footer.jsp"  %>
</body>
</html>