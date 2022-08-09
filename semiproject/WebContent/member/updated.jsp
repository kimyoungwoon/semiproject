<%@include file = "../payment/header.jsp"  %>
<%@ page contentType="text/html; charset=UTF-8"%>

<style>



</style>

<script type="text/javascript" src="<%=cp%>/member/js/util.js"></script>



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
	
</script>


<body>
	
    <!-- Header Section End -->
	<%@include file = "../payment/nav.jsp"  %>
	
	
	
<div class="row">
<div style="height: 0px; line-height: 35px; border-bottom: 1px solid #000000; clear: both; text-align: left">
</div>	
</div>	
<section>
<br/><br/><br/>
	<div class="container">	
		 <div class="row" style="height: 50px; margin-top: 50px;font-size:40pt margin-bottom: 50px;">
    		<div class="col-lg-12" aria-label="Basic outlined example" >
			<h1><b>Modify</b></h1>   
			<div style="height: 0px; line-height: 35px; border-bottom: 1px solid #000000; clear: both; text-align: left;overflow: visible;border-top: 10px;"></div> 	
    		<div style="height: 0px; line-height: 35px; border-bottom: 1px solid #000000; clear: both; text-align: left;overflow: visible;border-top: 10px;"></div> 
    		</div>	
 		</div>
 		
		
		
		<form action="" method="post" name="myForm">
	
		
		
			
			 <div class="row" style="height: 50px; margin-top: 200px; font-weight: bold; font-size:15pt;" >
    			<div class="col-1"  >
					아&nbsp;이&nbsp;디   	
    			</div>
    			<div class="col-11" >
    			<input type="text" class="btn-outline-secondary" disabled="disabled" name="id" value="${dto.id }">
    		
    			</div>	
 			</div>	
 		
 			<div class="row" style="height: 50px; margin-top: 50px; font-weight: bold; font-size:15pt;">
    			<div class="col-1"  >
				패&nbsp;스&nbsp;워&nbsp;드 	
    			</div>
    			<div class="col-11" >
    				<input type="password" class="btn-outline-secondary"  name="pw"  placeholder="password"
					value="${dto.pw }"  />
    			</div>	
 			</div>	
 			
 			<div class="row" style="height: 50px; margin-top: 50px; font-weight: bold; font-size:15pt;">
    			<div class="col-1" >
				E-mail:	
    			</div>
    			<div class="col-11" >
    				<input type="text" class="btn-outline-secondary" name="email" placeholder="E-Mail"
							value="${dto.email }">
    			</div>	
 			</div>	
	
			<div class="row" style="height: 50px; margin-top: 50px; font-weight: bold; font-size:15pt;">
    			<div class="col-1" >
				주&nbsp;&nbsp;소&nbsp;	
    			</div>
    			<div class="col-11" >
    				<input type="text" name="address" class="btn-outline-secondary"  placeholder="address"
						value="${dto.address }" />
    			</div>	
 			</div>		
				
			<div class="row" style="height: 50px; margin-top: 50px; font-weight: bold; font-size:15pt;">
    			<div class="col-1" >
				성&nbsp;&nbsp;별&nbsp;	
    			</div>
    			<div class="col-5" >
    				<div class="form-check">	
  						<input class="form-check-input" type="radio" name="birth" id="flexRadioDefault1" checked value="남자">
  							<label class="form-check-label" for="birth">
  							  남자
  							</label>
					</div>
					<div class="form-check">
 						<input class="form-check-input" type="radio" name="birth" id="flexRadioDefault2"  value="여자">
 							 <label class="form-check-label" for="birth">
  								여자
							  </label>
					</div>
				</div>
 			</div>		

			<div class="row" style="height: 50px; margin-top: 50px; font-weight: bold; font-size:15pt;">
    			<div class="col-1" >
				생&nbsp;년&nbsp;월&nbsp;일
    			</div>
    			<div class="col-11" >
    				<input type="text" class="btn-outline-secondary" disabled="disabled"  name="birth" value="${dto.birth }" />
    			</div>	
 			</div>	
			
			<div class="row" style="height: 50px; margin-top: 50px; font-weight: bold; font-size:15pt;">
			<div class="col-6" >
			<div>
				<input type="submit" value="수정하기" class="btn btn-secondary" onclick="sendIt()" />
				<input type="submit" value="수정취소" class="btn btn-secondary"
					onclick="javascript:location.href='<%=cp %>';" />
				
			</div>	
			</div>
			<div class="col-6" >
			<div>
				<input type="button" style="text-align: right;" value="회원탈퇴" class="btn btn-danger" onclick= />
			
			</div>	
			</div>		

	
			
			</div>
			
			<input type="hidden"  name="num" value="${dto.num }"/>
			
			
			
		

			
				
				
			
			
			
		</form>
	</div>
</section>		
	
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