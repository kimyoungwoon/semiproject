<%@ page contentType="text/html; charset=euc-kr" %> 
<jsp:useBean id="sc" class="com.cart.SessionChecker" scope="application" /> 
<% 
    session.setMaxInactiveInterval(60); // 걍 결과가 빨리 보고싶어서여.. 60초 
    sc.setSession(session); 
	out.println("현재 접속자 수 : " + sc.getNowUser()); 
%> 