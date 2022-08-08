<%@ page contentType="text/html;  charset=UTF-8"%>
<%
              request.setCharacterEncoding("UTF-8");    
              String cp = request.getContextPath();
              
              session.removeAttribute("Id");//suzi삭제
              session.invalidate();//userId 변수 삭제
              
              response.sendRedirect("semirpoject/member/login.jsp");
              
              
 %>
 
