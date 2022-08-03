<%@page import="com.review.ReviewDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.util.MyPage"%>
<%@page import="com.review.ReviewDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<jsp:useBean id="dto" class="com.review.ReviewDTO" scope="page"/>
<jsp:setProperty property="*" name="dto"/>

<%
	request.setCharacterEncoding("UTF-8");
	String cp= request.getContextPath();
	
	Connection conn = DBConn.getConnection();
	ReviewDAO dao =new ReviewDAO(conn);
	
	MyPage mypage =  new MyPage();
	
	/* 넘어온 페이지 번호pagenum(Mypage,article,update,delete) */
	String pageNum = request.getParameter("pageNum");
	
	//첫시작시 현재페이지 1
	int currentPage = 1;
	
	//넘어온 페이지 번호가 존재할 경우 현재페이지에 값 넣어주기
	if(pageNum!=null) {
		currentPage = Integer.parseInt(pageNum);
	}
	
	//전체데이터 갯수 구하기
	int dataCount = dao.getDataCount();	
		
	//한페이지에 표시할 데이터의 갯수
	int numPerPage = 3;
		
	//전체 페이지수 구하기
	int totalPage = mypage.getPagecount(numPerPage, dataCount);
		
	//전체페이지수가 표시할 페이지수보다 큰 경우(삭제로 인해)
	if(currentPage>totalPage) { //마지막페이지에 마지막 글을 지웠을때 앞페이지로 이동시켜주는 코딩
		currentPage = totalPage;//ex 12페이지에 하나만있는 글을 지웠을때 11페이지로 이동시켜주는	
	} 
		
	//데이터베이스에서 가져올 rownum의 시작과 끝
	int start = (currentPage-1)*numPerPage+1;
	int end = currentPage*numPerPage;
		
	List<ReviewDTO> lists = dao.getListData(start, end);
	
	//페이징 처리
	String listUrl = "guest.jsp";
	String pageIndexList = 
		mypage.pageIndexList(currentPage, totalPage, listUrl);
	
	DBConn.close();

%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="<%=cp %>/review/data/style.css"/>


<script type="text/javascript">

 //function deleteIt() {

	// if (confirm("정말 삭제하시겠습니까??") == true){    //확인
	// document.delete.submit();
	// }else{   //취소
	//    return false;
	//}
	//}
	

</script>



<script type="text/javascript" src="<%=cp%>/review/data/guest.js">

</script>
</head>
<body>

<table width="560" border="2" cellspacing="0" cellpadding="3" style="margin: auto;">
<tr height="50">
	<td bgcolor="#ffffff" style="padding-left: 10px">
	<b>방명록 (J S P)</b>
	</td>
</tr>	
</table>
<br/>

<form action="" method="post" name="myForm">

<table width="560" border="0" cellspacing="0" cellpadding="3" style="margin: auto;">

<tr height="2"><td colspan="2" bgcolor="#cccccc"></td></tr>
<tr height="30">
	<td align="center" width="100" bgcolor="#e6e6e6">작성자</td>
	<td style="padding-left: 5px;">
	<input type="text" name="name" size="20"  class="txtField"/>
	</td>
</tr>	

<tr height="2"><td colspan="2" bgcolor="#cccccc"></td></tr>
<tr height="30">
	<td align="center" width="100" bgcolor="#e6e6e6">내용</td>
	<td style="padding-left: 5px;">
	
	<textarea rows="12" cols="50" name="content" class="boxTA"></textarea>
	</td>
</tr>

<tr height="35">
	<td align="right" colspan="2">
	<input type="submit" class="btn" value="등록하기" onclick="sendIt();"/>
	<input type="reset" class="btn" value="다시입력"
	onclick="document.myForm.name.focus();"/>
	</td>
</tr>	
<tr height="2"><td colspan="2" bgcolor="#ccccc"></td></tr>
</table>

<table width="560" border="0" cellspacing="0" cellpadding="100"  style="margin: auto;">
<%for(ReviewDTO dto2: lists) {%>
	<tr height="30">
		<td align="left" bgcolor="#e6e6e6">NO&nbsp;<%=dto2.getNum() %>.<%=dto2.getName() %></td>
		<br/></tr>
	<tr height="30">	
		<td align="right" bgcolor="#e6e6e6">
		<input type="button" value="삭제" 
		onclick="javascript:location.href='<%=cp%>/guest/delete.jsp?num=<%=dto2.getNum()%>';"/></tr>
		<%-- javascript:location.href='<%=cp%>/guest/delete.jsp?num=<%=dto2.getNum()%>'; --%>
	<tr><td align="left" bgcolor="#ffffff"><%=dto2.getContent() %></td>
	</tr>
<%} %>
</table>
<center>
<p>
<%=pageIndexList %></p></center>
</form>

</body>
</html>