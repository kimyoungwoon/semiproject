<%@include file = "../payment/header.jsp"  %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
%>
    
    <link rel="stylesheet" type="text/css" href="<%=cp %>/writing/css/style.css"/>
	<link rel="stylesheet" type="text/css" href="<%=cp %>/writing/css/article.css"/>

<body>

	<script type="text/javascript">
		function deleteIt() {

			if (confirm("정말 삭제하시겠습니까??") == true) { //확인

				document.deleted.action="<%=cp %>/bbs/deleted_ok.do?num=${dto.num }&${params }";
				document.deleted.submit();

			} else { //취소

				return false;

			}

		}
	</script>

	<!-- Header Section End -->
	<%@include file="../payment/nav.jsp"%>

	<!-- article Section begin -->
	<div id="bbs">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="related-title">Notice Board</h1>
				</div>
			</div>
		</div>
		<div id="bbsArticle">
			<form action="" method="post" name="deleted">
			<div id="bbsArticle_header">${dto.subject }</div>
			<div class="bbsArticle_bottomLine">
				<dl>
					<dt>작성자</dt>
					<dd>${dto.name }</dd>
					<dt>줄수</dt>
					<dd>${lineSu }</dd>
				</dl>
			</div>

			<div class="bbsArticle_bottomLine">
				<dl>
					<dt>등록일</dt>
					<dd>${dto.savePath }</dd>
					<dt>조회수</dt>
					<dd>${dto.hitcount }</dd>
				</dl>
			</div>

			<div id="bbsArticle_content">
				<table width="600" border="0">
					<tr>
						<td style="padding: 20px 80px 20px 62px;" valign="top"
							height="200">${dto.content }</td>
					</tr>
				</table>
			</div>
			
			<div id="bbsArticle_footer">
				<div id="leftFooter">
					<input type="button" value="수정" class="btn2"
						onclick="javascript:location.href='<%=cp %>/bbs/updated.do?num=${dto.num }&${params }';" />
					<input type="button" value="삭제" class="btn2"
						onclick="deleteIt()" />
				</div>
				<div id="rightFooter">
					<input type="button" value="리스트" class="btn2"
						onclick="location='<%=cp %>/bbs/list.do?${params }';" />
				</div>
			</div>
			</form>
		</div>
	</div>
	<!-- article Section end -->

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
	<footer class="footer">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="footer__about">
						<div class="footer__logo">
							<a href="#"><img src="<%=cp%>/img/footer-logo.png" alt=""></a>
						</div>
                        <p>The customer is at the heart of our unique business model, which includes design.</p>
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
                            <p>Be the first to know about new arrivals, look books, sales & promos!</p>
                            <form action="#">
                                <input type="text" placeholder="Your email">
                                <button type="submit"><span class="icon_mail_alt"></span></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="footer__copyright__text">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        <p>Copyright ©
                            <script>
                                document.write(new Date().getFullYear());
                            </script>2020
                            All rights reserved | This template is made with <i class="fa fa-heart-o"
                            aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
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
   <%@include file = "../payment/footer.jsp"  %>
</body>
</html>