<%@include file = "../payment/header.jsp"  %>

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


<body>
	
	<!-- Header Section End -->
    <%@include file = "../payment/nav.jsp"  %>

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
	<%@include file = "../payment/footer.jsp"  %>
</body>
</html>