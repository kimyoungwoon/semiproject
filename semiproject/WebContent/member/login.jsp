<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
 	
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
 %>
<!DOCTYPE html>

<html>
<head>
<title>로그인 / 회원가입</title>

<%@include file = "../payment/footer.jsp"  %>
<link rel="stylesheet" href="<%=cp %>/css/loginstyle.css">
<script type="text/javascript" src="<%=cp %>/member/js/util.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	loginfunc();
    $("button").click(function(event) {
        event.preventDefault();
        //alert("This form will not submit");
    });
});
		function registerMember(){
			f = document.regiForm;
					
	    	f.action="<%=cp %>/login/created_ok.do";
	  	 	f.submit();
		}
		
		function loginMember(){
			f = document.loginForm;
			
	    	f.action="<%=cp %>/login/login_ok.do";
	  	 	f.submit();
		}
				
		function searchIt(){
			f = document.loginForm;
			
	    	f.action="<%=cp %>/login/searchpwd.do";
	  	 	f.submit();
		}
				
		
		</script>
</head>

<body background="<%=cp %>/img/member/background1.jpg">

	<div class="wrap">
		<div class="form-wrap" style="background-color: white;">
			<div class="button-wrap">
				<div id="btn"></div>
				<button type="button" class="togglebtn" onclick="loginfunc()">
					<font size="2pt" color="#FFFAFA">LOG IN</font>
				</button>
				<button type="button" class="togglebtn" onclick="registerfunc()">
					<font size="2pt" color="#FFFAFA">REGISTER</font>
				</button>
			</div>
			<div class="social-icons">
				<img src="<%=cp %>/img/member/fb.png" alt="facebook" /> <img
					src="<%=cp %>/img/member/tw.png" alt="twitter" /> <img
					src="<%=cp %>/img/member/gl.png" alt="google" />
			</div>
			<form id="id_login" name="loginForm" method="post"
				class="input-group">
				<input type="text" class="input-field" placeholder="User Id" name="login_id" required> 
				<input type="password" class="input-field" placeholder="Enter Password" name="login_pw" required>
				<div style="margin-top: 10px;">
					<font size="2pt" color="black">${message }</font>
				</div>
				<input type="checkbox" class="checkbox"><span>Remember
					Password</span>
				<button class="submit" onclick="loginMember();">
					<font size="4pt" color="white">Login</font>
				</button><br/>
				<button class="submit" onclick="searchIt();">
				<font size="2pt" color="white">Search Pwd</font>
				</button>
			</form>


			<form id="id_register" name="regiForm" method="post" class="input-group">
				<input type="text" class="input-field" placeholder="User Id" name="reg_id" value="${checkid }" required> 

					<input type="password" class="input-field" placeholder="Enter Password" name="reg_pw" required> 
					<input type="text" class="input-field" placeholder="Your Name" name="reg_name" required> 
					<input type="date" class="input-field" placeholder="YYYY-MM-DD" name="reg_birth" required>
					<input type="checkbox" class="checkbox"><span>Terms and conditions</span>
				<button class="submit" onclick="registerMember();">
					<font size="3pt" color="white">REGISTER</font>					
				</button>
				
			</form>
		</div>
	</div>


	<script>
            var x = document.getElementById("id_login");
            var y = document.getElementById("id_register");
            var z = document.getElementById("btn");
            
            
            function loginfunc(){
                x.style.left = "50px";
                y.style.left = "450px";
                z.style.left = "0";
            }

            function registerfunc(){
                x.style.left = "-400px";
                y.style.left = "50px";
                z.style.left = "110px";
            }
        </script>
</body>