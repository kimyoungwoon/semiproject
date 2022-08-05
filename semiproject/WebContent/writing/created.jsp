<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp= request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Male-Fashion | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="<%=cp%>/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="<%=cp%>/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="<%=cp%>/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="<%=cp%>/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="<%=cp%>/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="<%=cp%>/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="<%=cp%>/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="<%=cp%>/css/style.css" type="text/css">
	<link rel="stylesheet" type="text/css" href="<%=cp %>/writing/css/style.css"/>
	<link rel="stylesheet" type="text/css" href="<%=cp %>/writing/css/created.css"/>


<script type="text/javascript" src="<%=cp%>/writing/js/util.js"></script>
<script type="text/javascript">

	function sendIt() {
		
		var f= document.myForm;
		
		str= f.subject.value;
		str = str.trim();
		if(!str) {
			alert("\n제목을 입력하세요.")
			f.subject.focus();
			return;
		}
		f.subject.value = str;
		
		str= f.name.value;
		str = str.trim();
		if(!str) {
			alert("\이름을 입력하세요.")
			f.name.focus();
			return;
		}
		
		/* if(!isValidKorean(str)) {
			alert("\n이름을 정확히 입력하세요.");
			f.name.focus();
			return;
		} */
		
		f.name.value = str;
		
		if(f.email.value) {
			if(!isValidEmail(f.email.value)) {
				alert("\n정상적인 E-mail을 입력하세요.")
				f.email.focus();
				return;
			}
		}
		
		str= f.content.value;
		str = str.trim();
		if(!str) {
			alert("\n내용을 입력하세요.")
			f.content.focus();
			return;
		}
		f.content.value = str;
		
		str= f.pwd.value;
		str = str.trim();
		if(!str) {
			alert("\n패스워드를 입력하세요.")
			f.pwd.focus();
			return;
		}
		f.pwd.value = str;
		
		f.action = "<%=cp%>/bbs/created_ok.do";
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
                <a href="#">Sign in</a>
                <a href="#">FAQs</a>
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
            <a href="#" class="search-switch"><img src="<%=cp%>/img/icon/search.png" alt=""></a>
            <a href="#"><img src="<%=cp%>/img/icon/heart.png" alt=""></a>
            <a href="#"><img src="<%=cp%>/img/icon/cart.png" alt=""> <span>0</span></a>
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
                                <a href="#">Sign in</a>
                                <a href="#">FAQs</a>
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
                                    <li><a href="<%=cp%>/writing/list.jsp">Writing</a></li>
                                    <li><a href="./checkout.jsp">Check Out</a></li>
                                    <li><a href="./blog-details.jsp">Blog Details</a></li>
                                </ul>
                            </li>
                            <li><a href="./blog.jsp">Blog</a></li>
                            <li><a href="./contact.jsp">Contacts</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3 col-md-3">
                    <div class="header__nav__option">
                        <a href="#" class="search-switch"><img src="<%=cp%>/img/icon/search.png" alt=""></a>
                        <a href="#"><img src="<%=cp%>/img/icon/heart.png" alt=""></a>
                        <a href="#"><img src="<%=cp%>/img/icon/cart.png" alt=""> <span>0</span></a>
                        <div class="price">$0.00</div>
                    </div>
                </div>
            </div>
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
    </header>
    <!-- Header Section End -->

<!-- created Section begin -->
<div id="bbs">
	<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="related-title">QuestioN</h1>
				</div>
			</div>
		</div>
	
	<form action="" method="post" name="myForm">
	
	<div id ="bbsCreated">
	
		<div class="bbsCreated_bottomLine">
			<dl>
				<dt>제&nbsp;&nbsp;&nbsp;&nbsp;목</dt>
				<dd>
					<input type="text" name="subject" size="64"
					maxlength="100" class="boxTF"/>
				</dd>	
			</dl>
		</div>
		
		<div class="bbsCreated_bottomLine">
			<dl>
				<dt>작&nbsp;성&nbsp;자</dt>
				<dd>
					<input type="text" name="name" size="35"
					maxlength="20" class="boxTF" value="${sessionScope.customInfo.userName }"/>
				</dd>	
			</dl>
		</div>
		
		<div class="bbsCreated_bottomLine">
			<dl>
				<dt>E-Mail</dt>
				<dd>
					<input type="text" name="email" size="35"
					maxlength="50" class="boxTF"/>
				</dd>	
			</dl>
		</div>
		
		<div id="bbsCreated_content">
			<dl>
				<dt>내&nbsp;&nbsp;&nbsp;&nbsp;용</dt>
				<dd>
					<textarea rows="12" cols="63" name="content" class="boxTA"></textarea>
				</dd>	
			</dl>
		</div>
		
		<div class="bbsCreated_noLine">
			<dl>
				<dt>패스워드</dt>
				<dd>
					<input type="password" name="pwd" size="35"
					maxlength="7" class="boxTF"/>
				</dd>	
			</dl>
		</div>
		
		<div id = "bbsCreated_footer">
			<input type="button" value = "등록하기" class="btn2"
				onclick="sendIt();"/>
			<input type="reset" value="다시입력" class="btn2"
				onclick="document.myForm.subject.focus();"/>
			<input type="button" value="작성취소" class="btn2"
				onclick="javascript:location.href='<%=cp%>/bbs/list.do';">				
		</div>
	</div>
	</form>
</div>
<!-- created Section end -->

    	<!-- Footer Section Begin -->
	<br/><br/><br/><br/><br/><br/><br/><br/>
	<br/><br/><br/><br/><br/><br/><br/><br/>
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