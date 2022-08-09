<%@include file = "../payment/header.jsp"  %>
<%@ page contentType="text/html; charset=UTF-8"%>
    
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
		
		
		f.action = "<%=cp%>/bbs/updated_ok.do";
		f.submit();		
		
	}
</script>


<body>
   
    <!-- Header Section End -->
    <%@include file = "../payment/nav.jsp"  %>
    <!-- updated Section begin -->
    
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
					<input type="text" name="subject"  size="64"
					maxlength="100" class="boxTF" value="${dto.subject }" />
				</dd>	
			</dl>
		</div>
		
		
		<div class="bbsCreated_bottomLine">
			<dl>
				<dt>작&nbsp;성&nbsp;자</dt>
				<dd>
					<input type="text" name="name" size="35"
					maxlength="20" class="boxTF" value="${dto.name }"/>
				</dd>	
			</dl>
		</div>
		
		<div class="bbsCreated_bottomLine">
			<dl>
				<dt>E-Mail</dt>
				<dd>
					<input type="text" name="email" size="35"
					maxlength="50" class="boxTF" value="${dto.email }"/>
				</dd>	
			</dl>
		</div>
		
		<div id="bbsCreated_content">
			<dl>
				<dt>내&nbsp;&nbsp;&nbsp;&nbsp;용</dt>
				<dd>
					<textarea rows="12" cols="63" name="content" 
					class="boxTA" >${dto.content }</textarea>
				</dd>	
			</dl>
		</div>
		
		<div class="bbsCreated_noLine">
			<dl>
				<dt>비밀번호</dt>
				<dd>
					<input type="password" name="pwd" size="35" value="${dto.pw }"
					maxlength="7" class="boxTF"/>
				</dd>	
			</dl>
		</div>
		<div id = "bbsCreated_footer">
			<input type="hidden" name="num" value="${dto.num }"/>
			<input type="hidden" name="pageNum" value="${pageNum }"/>
			<input type="hidden" name="searchKey" value="${searchKey }"/>
			<input type="hidden" name="searchValue" value="${searchValue }"/>
			
			<input type="button" value = "수정하기" class="btn2"
				onclick="sendIt();"/>			
			<input type="button" value="수정취소" class="btn2"
				onclick="javascript:location.href='<%=cp%>/bbs/list.do?${params }';">				
		</div>	
		</form>	
	</div>
    
    <!-- updated Section end -->
    
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
	<%@include file = "../payment/footer.jsp"  %>
</body>
</html>