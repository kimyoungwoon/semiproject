<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
 	
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
 %>
<!DOCTYPE html>

<html>
<<<<<<< HEAD

=======
>>>>>>> parent of 91bf387 (Merge pull request #89 from youngjin3/Second-Main)
<head>
<title>로그인 / 회원가입</title>

<%@include file = "../payment/footer.jsp"  %>
<link rel="stylesheet" href="<%=cp %>/css/loginstyle.css">
<<<<<<< HEAD
<script type="text/javascript" src="<%=cp %>/member/js/util.js"></script>
=======

>>>>>>> parent of 91bf387 (Merge pull request #89 from youngjin3/Second-Main)

<script type="text/javascript">
$(document).ready(function() {
	loginfunc();
    $("button").click(function(event) {
        event.preventDefault();
        //alert("This form will not submit");
    });
});
		function registerMember(){
<<<<<<< HEAD
			
			 const regex = /^[0-9a-z]{8,17}$/;
			 

			    if (pInputID.value.length == eCheckResult.EMPTY) {
			        infoText.innerText = "필수 정보입니다.";
			    } else if (/*db적용시 중복값 체크*/ null) {
			        // "이미 사용중이거나 탈퇴한 아이디입니다."

			        //트리거 하나 만들어서 삭제되는 아이디를 다른 테이블에 저장해두자.
			        //그래서 그걸 가지고 탈퇴한 아이디도 체크해보자.

			        alert("중복값 체크");
			    } else if (!regex.test(pInputID.value)) {
			        infoText.innerText = "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
			    } else {
			        infoText.style = "display: default; color: green";
			        infoText.innerText = "멋진 아이디네요!";
			        return true;
			    }
			
			
=======
>>>>>>> parent of 91bf387 (Merge pull request #89 from youngjin3/Second-Main)
			f = document.regiForm;
					
	    	f.action="<%=cp %>/login/created_ok.do";
	  	 	f.submit();
		}
		
		function loginMember(){
			f = document.loginForm;
			
	    	f.action="<%=cp %>/login/login_ok.do";
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
				</button>
			</form>


			<form id="id_register" name="regiForm" method="post" class="input-group">
<<<<<<< HEAD
				<input type="text" class="input-field" placeholder="User Id" name="reg_id" value="${checkid }" onkeydown = "checkID(event);" required> 
=======
				<input type="text" class="input-field" placeholder="User Id" name="reg_id" value="${checkid }" required> 
>>>>>>> parent of 91bf387 (Merge pull request #89 from youngjin3/Second-Main)
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
<<<<<<< HEAD

=======
>>>>>>> parent of 91bf387 (Merge pull request #89 from youngjin3/Second-Main)
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