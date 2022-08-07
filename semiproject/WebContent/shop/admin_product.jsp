<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>admin pages</title>

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
            <a href="#" class="search-switch"><img src="img/icon/search.png" alt=""></a>
            <a href="#"><img src="img/icon/heart.png" alt=""></a>
            <a href="#"><img src="img/icon/cart.png" alt=""> <span>0</span></a>
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
                        <a href="./index.jsp"><img src="img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <nav class="header__menu mobile-menu">
                        <ul>
                            <li><a href="./index.jsp">Home</a></li>
                            <li class="active"><a href="./shop.jsp">Shop</a></li>
                            <li><a href="#">Pages</a>
                                <ul class="dropdown">
                                    <li><a href="./about.jsp">About Us</a></li>
                                    <li><a href="./shop-details.jsp">Shop Details</a></li>
                                    <li><a href="./shopping-cart.jsp">Shopping Cart</a></li>
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
                        <a href="#" class="search-switch"><img src="img/icon/search.png" alt=""></a>
                        <a href="#"><img src="img/icon/heart.png" alt=""></a>
                        <a href="#"><img src="img/icon/cart.png" alt=""> <span>0</span></a>
                        <div class="price">$0.00</div>
                    </div>
                </div>
            </div>
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
    </header>
    <!-- Header Section End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Shop</h4>
                        <div class="breadcrumb__links">
                            <a href="./index.jsp">Home</a>
                            <span>Shop</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shop Section Begin -->
    <section class="shop spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="shop__sidebar">
                        <div class="shop__sidebar__search">
                            <form action="#">
                                <input type="text" placeholder="Search...">
                                <button type="submit"><span class="icon_search"></span></button>
                            </form>
                        </div>
                        <div class="shop__sidebar__accordion">
                            <div class="accordion" id="accordionExample">
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseOne">제품 관리</a>
                                    </div>
                                    <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__categories">
                                                <ul class="nice-scroll">
                                                    <li><a href="#">제품 등록</a></li>
                                                    <li><a href="<%=cp%>/setting/setting.do">상세정보 등록</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseTwo">제품 디테일</a>
                                    </div>
                                    <div id="collapseTwo" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__brand">
                                                <ul>
                                                    <li><a href="#">기능 준비중</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseThree">회원관리</a>
                                    </div>
                                    <div id="collapseThree" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__price">
                                                <ul>
                                                    <li><a href="#">유입 경로 확인</a></li>
                                                    <li><a href="#">기능 준비중입니다</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                              <!-- 여기까지가 옆섹션 -->
                              
                                
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 여기까지  -->
                <div class="col-lg-9">
                    <div class="shop__product__option">
                    <!-- 여기서부터 입력창 -->
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="shop__product__option__left">
                                    <p>Showing 1–12 of 126 results</p>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="shop__product__option__right">
                                    <p>Sort by Price:</p>
                                    <select>
                                        <option value="">Low To High</option>
                                        <option value="">$0 - $55</option>
                                        <option value="">$55 - $100</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <br/><br/><br/><br/>
<form action="" name="myForm" method="post" enctype="multipart/form-data">
<table width="600" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="140" height="30" bgcolor="#FFFFFF" style="padding-left: 20px;">
		Product Name
		</td>
		<td width="600" style="padding-left: 10px;" bgcolor="#FFFFFF">
		<input type="text" name="pd_name" size="48" maxlength="100" class="boxTF"/>
		</td>
	</tr>
<tr><td colspan="2" height="e" bgcolor="#dbdbdb" align="center"></td></tr>
<tr><td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td></tr>
	<tr>
		<td width="140" height="30" bgcolor="#FFFFFF" style="padding-left: 20px;">
		Price
		</td>
		<td width="600" style="padding-left: 10px;" bgcolor="#FFFFFF">
		<input type="text" name="pd_price" size="48" maxlength="100" class="boxTF"/>
		</td>
	</tr>
<tr><td colspan="2" height="e" bgcolor="#dbdbdb" align="center"></td></tr>
<tr><td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td></tr>
	<tr>
		<td width="300" height="30" bgcolor="#FFFFFF" style="padding-left: 20px;">
		Category
		</td>
		<td width="600" style="padding-left: 10px;" bgcolor="#FFFFFF">
		<select name="pd_categoryNum">
			<option value="1">Men</option>
			<option value="2">Women</option>
			<option value="3">Bags</option>
			<option value="4">Clothing</option>
			<option value="5">Shoes</option>
			<option value="6">Accessories</option>
			<option value="7">Kids</option>
		</select>
		</td>
	</tr>
<tr><td colspan="2" height="e" bgcolor="#dbdbdb" align="center"></td></tr>
<tr><td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td></tr>
	<tr>
		<td width="140" height="30" bgcolor="#FFFFFF" style="padding-left: 20px;">
		Brand
		</td>
		<td width="600" style="padding-left: 10px;" bgcolor="#FFFFFF">
		<select name="pd_brandNum">
			<option value="1">Louis Vuitton</option>
			<option value="2">Chanel</option>
			<option value="3">Hermes</option>
			<option value="4">Gucci</option>
		</select>
		</td>
	</tr>
<tr><td colspan="2" height="e" bgcolor="#dbdbdb" align="center"></td></tr>
<tr><td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td></tr>

<tr><td colspan="2" height="e" bgcolor="#dbdbdb" align="center"></td></tr>
<tr><td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td></tr>
	<tr>
		<td width="140" height="30" bgcolor="#FFFFFF" style="padding-left: 20px;">
		Image
		</td>
		<td width="600" style="padding-left: 10px;" bgcolor="#FFFFFF">
		<input type="file" name="upload" size="48" maxlength="100" class="boxTF"/>
		</td>
	</tr>
<tr><td colspan="2" height="e" bgcolor="#dbdbdb" align="center"></td></tr>
</table>

<table width="600" border="0" cellpadding="0" cellspacing="3" align="center" style="margin: auto;">
	<tr>
		<td height="40" align="center">
		<input type="button" value="Registration" class="btn2" onclick="sendIt();"/>
		<input type="reset" value="Re-enter" class="btn2" onclick="document.myForm.pd_name.focus();"/>
		<input type="submit" value="Cancle" class="btn2" 
		onclick="javascript:location.href='<%=cp%>setting/list.do';"/>
		</td>
	</tr>
</table>
</form>   
                     
                        
                        
                        
                        
                     <!-- 여기까지 입력창 -->   
                    </div>
                    <!-- 여기서부터 이미지게시판 -->
                    <div class="row">
                        
                    
                      
               
                 
                 
                     
                     
                  
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                         
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Section End -->

    <!-- Footer Section Begin -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__logo">
                            <a href="#"><img src="img/footer-logo.png" alt=""></a>
                        </div>
                        <p>The customer is at the heart of our unique business model, which includes design.</p>
                        <a href="#"><img src="img/payment.png" alt=""></a>
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
	
	<!-- Js from 이동우 -->
	<script type="text/javascript">
	function sendIt() {
		
    	f = document.myForm;
    
  
    
    	f.action="<%=cp%>/setting/insert_ok.do";
  	 	f.submit();
	}
	
	</script>
	
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