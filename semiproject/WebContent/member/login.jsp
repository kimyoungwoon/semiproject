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
        <link rel="stylesheet" href="<%=cp %>/css/loginstyle.css">
    </head>
    <body background="<%=cp %>/img/member/background1.jpg">
        <div class="wrap">
            <div class="form-wrap">
                <div class="button-wrap">
                    <div id="btn"></div>
                    <button type="button" class="togglebtn" onclick="login()"><font size="2pt" color="#FFFAFA">LOG IN</font></button>
                    <button type="button" class="togglebtn" onclick="register()"><font size="2pt" color="#FFFAFA">REGISTER</font></button>
                </div>
                <div class="social-icons">
                   <img src="<%=cp %>/img/member/fb.png" alt="facebook"/>
                    <img src="<%=cp %>/img/member/tw.png" alt="twitter"/>
                    <img src="<%=cp %>/img/member/gl.png" alt="google"/>
                </div>
                <form id="login" action="<%=cp %>/member/login_ok.do" method="post" class="input-group">
                    <input type="text" class="input-field" placeholder="User Id or Email" name="login_userEmail" required>
                    <input type="password" class="input-field" placeholder="Enter Password" name="login_userPwd" required>
                    <div style="margin-top: 10px;"><font size="2pt" color="white">${message }</font></div>
                    <input type="checkbox" class="checkbox"><span>Remember Password</span>
                    <button class="submit"><font size="4pt" color="white" >Login</font></button>
                </form>
                <form id="register" action="<%=cp %>/member/created_ok.do" method="post" class="input-group">
                    <input type="email" class="input-field" placeholder="User Id" name="userId" required>
                    <input type="password" class="input-field" placeholder="Enter Password" name="userPwd" required>
                    <input type="text" class="input-field" placeholder="Your Name" name="userName" required>
                    <input type="text" class="input-field" placeholder="Your Birth" name="userBirth" required>
                    <input type="checkbox" class="checkbox"><span>Terms and conditions</span>
                    <button class="submit"><font size="3pt" color="white" >REGISTER</font></button>
                </form>
            </div>
        </div>
        <script>
            var x = document.getElementById("login");
            var y = document.getElementById("register");
            var z = document.getElementById("btn");
            
            
            function login(){
                x.style.left = "50px";
                y.style.left = "450px";
                z.style.left = "0";
            }

            function register(){
                x.style.left = "-400px";
                y.style.left = "50px";
                z.style.left = "110px";
            }
        </script>
    </body>
</html>