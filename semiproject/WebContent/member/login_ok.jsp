<%@page import="com.member.MemberDAO"%>
<%@page import="com.member.MemberDTO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;  charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
              request.setCharacterEncoding("UTF-8");    
              String cp = request.getContextPath();
 %>
 
<jsp:useBean id="dto" class="com.member.MemberDTO" scope="page"/>
<jsp:setProperty property="*" name="dto"/>


<%

	Connection conn = DBConn.getConnection();
	MemberDAO dao = new MemberDAO(conn);
	
	int maxNum = dao.getMaxNum();

	dto.setNum(maxNum + 1);
	dto.setIpAddr(request.getRemoteAddr());
	
	dao.insertData(dto);
	
	DBConn.close();
	
	response.sendRedirect("login.do");
%>

