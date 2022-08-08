<%@include file = "../payment/header.jsp"  %>

<body>
   
    <!-- Header Section End -->
    <%@include file = "../payment/nav.jsp"  %>

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
    <%@include file = "../payment/footer.jsp"  %>
</body>
</html>