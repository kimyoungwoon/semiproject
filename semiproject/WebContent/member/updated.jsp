<%@include file = "../payment/header.jsp"  %>
<%@ page contentType="text/html; charset=UTF-8"%>




<script type="text/javascript">

	function sendIt(){
	
		var f = document.myForm;
	
		str = f.pw.value;
		if(!str){
			alert("패스워드를 입력하세요");
			f.pw.focus();
			return;
		}
		
		f.action = "<%=cp%>/login/updated_ok.do";
		f.submit();
		
	}
	

	function deletedIt(){
	
		var f = document.myForm;
		
		f.action = "<%=cp%>/login/delete_ok.do";
		f.submit();
		
	}
	

	

	
</script>


<body>
	
    <!-- Header Section End -->
	<%@include file = "../payment/nav.jsp"  %>
	
	
	<div id="bbs" margin="auto" align="center">
	
	<div class="container">
			<div class="row">
				<div class="col-lg-12"><br/><br/><br/>
					<h1 class="related-title">modify</h1>
				</div>
			</div>
		</div>
	<div id ="bbsCreated">
	

		<div id="bbs_title">회&nbsp;원&nbsp;수&nbsp;정</div><br/>
		<form action="" method="post" name="myForm">
				<span>필수입력사항</span>
			<div id="bbsCreated">
				<div class="bbsCreated_bottomLine">
					<dl>
						<dt>아&nbsp;이&nbsp;디</dt>
						<dd>
						${dto.id }
						</dd>
					</dl>
				</div>

				<div class="bbsCreated_bottomLine">
					<dl>
						<dt>패&nbsp;스&nbsp;워&nbsp;드</dt>
						<dd>
							<input type="password" name="pw" size="35" maxlength="20" placeholder="password"
								value="" class="boxTF" />
						</dd>
					</dl>
				</div>
				
				<div class="bbsCreated_bottomLine">
					<dl>
						<dt>이&nbsp;&nbsp;&nbsp;&nbsp;름</dt>
						<dd>
						${dto.name }
						</dd>
					</dl>
				</div>


				<div class="bbsCreated_bottomLine">
					<dl>
						<dt>
						E-mail&nbsp;
						</dt>
						<dd>
							<input type="text" name="email" size="35" maxlength="50" placeholder="E-Mail"
								value="${dto.email }" class="boxTF" />
						</dd>
					</dl>
				</div>
				
				<div class="bbsCreated_bottomLine">
					<dl>
						<dt>
						주&nbsp;&nbsp;소&nbsp;
						</dt>
						<dd>
							<input type="text" name="address" size="35" maxlength="50" placeholder="address"
								value="${dto.address }" class="boxTF" />						
						</dd>
					</dl>
				</div>
				
					<div class="bbsCreated_bottomLine">
					<dl>
						<dt>
						전&nbsp;화&nbsp;번&nbsp;호
						</dt>
						<dd>
							<input type="text" name="tel" size="35" maxlength="50" placeholder="Tel"
								value="${dto.tel }" class="boxTF" />
						</dd>
					</dl>
				</div>
				
				<div class="bbsCreated_bottomLine">
					<dl>
						<dt>
						성&nbsp;&nbsp;별&nbsp;
						</dt>
						<dd>
							<label><input type="checkbox" name="gender" size="35" maxlength="50" placeholder="gender"
								value="${dto.gender }" class="boxTF" />man</label>
								<label><input type="checkbox" value="${dto.gender }" >female</label>	
						</dd>
					</dl>
				</div>

			<div class="bbsCreated_bottomLine">
					<dl>
						<dt>
						생&nbsp;년&nbsp;월&nbsp;일
						</dt>
						<dd>
	  					${dto.birth }
						</dd>
					</dl>
				</div>
			
			</div>
			<input type="hidden"  name="num" value="${dto.num }"/>
			<input type="hidden" name="id" value="${dto.id }"/>
			<input type="hidden" name="name" value="${dto.name }"/>
			<input type="hidden" name="birth" value="${dto.birth }"/>
		

			<div id="bbsCreated_footer">
				<input type="submit" value="수정하기" class="btn2" onclick="sendIt()" />
				<input type="submit" value="수정취소" class="btn2"
					onclick="javascript:location.href='<%=cp %>';" />
			</div>
				
				<br/>
					<br/>
				
				<div id="bbsCreated_footer">
				<input type="button" value="회원탈퇴" class="btn2" onclick="deletedIt()"/>
			
			</div>
			
			
			
		</form>

	</div>
	
	<br/>
		<br/>
			<br/>
				<br/>
					<br/>
						<br/>
							<br/>
								<br/>
									<br/>
										<br/>
											<br/>
												<br/>
													
															
	 
       <!-- Footer Section Begin -->
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

 <!-- Product Section End -->
    <%@include file = "../payment/footer.jsp"  %>

	
</body>

</html>