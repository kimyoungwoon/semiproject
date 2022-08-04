<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp= request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="<%=cp %>/review/data/style.css"/>

<script type="text/javascript" src="<%=cp%>/review/data/guest.js"></script>
</head>
<body>

<table width="560" border="2" cellspacing="0" cellpadding="3" style="margin: auto;">
<tr height="50">
	<td bgcolor="#ffffff" style="padding-left: 10px">
	<b>리 뷰 글</b>
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
	<td align="center" width="100" bgcolor="#e6e6e6">제목</td>
	<td style="padding-left: 5px;">
	<input type="text" name="subject" size="20" class="txtField"/>
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
	<input type="submit" class="btn" value="등록하기" onclick="javascript:location.href='<%=cp%>/review/list.do';"/>
	<input type="reset" class="btn" value="다시입력"
	onclick="document.myForm.name.focus();"/>
	</td>
</tr>	
<tr height="2"><td colspan="2" bgcolor="#ccccc"></td></tr>
</table>

<table width="560" border="0" cellspacing="0" cellpadding="100"  style="margin: auto;">
<c:forEach var="dto" items="${lists }">
	<tr height="30">
		<td align="left" bgcolor="#e6e6e6">NO&nbsp;${dto.Num }.이름&nbsp;${dto.Name }.제목&nbsp;${dto.subject }</td>
		
		<br/></tr>
	<tr height="30">	
		<td align="left" bgcolor="#e6e6e6">작성일&nbsp;${dto.savePath }</td>
		<td align="right" bgcolor="#e6e6e6">
		<input type="button" value="삭제" 
		onclick="javascript:location.href='<%=cp%>/review/delete.do?num=${dto.Num }';"/></tr>
		<%-- javascript:location.href='<%=cp%>/guest/delete.jsp?num=<%=dto2.getNum()%>'; --%>
	<tr><td align="left" bgcolor="#ffffff">${dto.Content }</td>
	</tr>
</c:forEach>
</table>
<center>
	<div>
			<p>
				<c:if test="${dataCount!=0 }">
					${pageIndexList }
				</c:if>
				<c:if test="${dataCount==0 }">
					등록된 게시물이 없습니다.
				</c:if>
			</p>
	</div>
</center>
</form>

</body>
</html>