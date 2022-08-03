<%@page import="com.review.ReviewDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp= request.getContextPath();
	
	Connection conn = DBConn.getConnection();
	ReviewDAO dao =new ReviewDAO(conn);
%>

<jsp:useBean id="dto" class="com.review.ReviewDTO" scope="page"/>
<jsp:setProperty property="*" name="dto"/>
<%

	int maxNum = dao.getMaxNum(); // dao에서 최댓값 불러오기

	dto.setNum(maxNum+1);

	dao.insertData(dto);

	DBConn.close();
	response.sendRedirect(cp + "/reciew/guest.jsp");

%>