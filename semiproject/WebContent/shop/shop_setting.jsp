<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이미지 게시판</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/imageTest/data/style.css"/>
<script type="text/javascript">

</script>


</head>
<body>
<br/><br/>
<table width="600" border="2" cellpadding="0" cellspacing="0"
bordercolor="#d6d4a6" align="center" style="margin: auto;">

<tr height="40">
	<td style="padding-left: 20px;">
	<b>이미지 게시판</b>
	</td>
</tr>
</table>





<form action="<%=cp %>/shopping/insertSize.do" name="sizeForm" method="post">

<table width="600" border="0" cellpadding="0" cellspacing="0" align="center" style="margin: auto;">
	<tr>
		<td width="140" height="30" bgcolor="#eeeeee" style="padding-left: 20px;">
		제품번호
		</td>
		<td width="600" style="padding-left: 10px;" bgcolor="#eeeeee">
		<input type="text" name="size_nameNum" size="5" maxlength="100" class="boxTF"/>
		</td>
	</tr>
	<tr>
		<td width="140" height="30" bgcolor="#eeeeee" style="padding-left: 20px;">
		사이즈 번호
		</td>
		<td width="600" style="padding-left: 10px;" bgcolor="#eeeeee">
		<input type="text" name="pd_sizeNum" size="5" maxlength="20" class="boxTF"/>
		</td>
	</tr>
	<tr>
		<td height="40" align="center">
			<input type="submit" value="등록하기" class="btn2"/>
		</td>
	</tr>
	
</table>
</form>	
<form action="<%=cp %>/shopping/insertColor.do" name="colorForm" method="post">
<table width="600" border="0" cellpadding="0" cellspacing="0" align="center" style="margin: auto;">	
<tr><td colspan="2" height="e" bgcolor="#dbdbdb" align="center"></td></tr>
<tr><td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td></tr>
	
	<tr>
		<td width="140" height="30" bgcolor="#eeeeee" style="padding-left: 20px;">
		제품번호
		</td>
		<td width="600" style="padding-left: 10px;" bgcolor="#eeeeee">
		<input type="text" name="color_nameNum" size="5" maxlength="100" class="boxTF"/>
		</td>
	</tr>
	<tr>
		<td width="140" height="30" bgcolor="#eeeeee" style="padding-left: 20px;">
		컬러 번호
		</td>
		<td width="600" style="padding-left: 10px;" bgcolor="#eeeeee">
		<input type="text" name="pd_colorNum" size="5" maxlength="20" class="boxTF"/>
		</td>
	</tr>	

	<tr>
		<td height="40" align="center">
			<input type="submit" value="등록하기" class="btn2"/>
		</td>
	</tr>
<tr><td colspan="2" height="e" bgcolor="#dbdbdb" align="center"></td></tr>
<tr><td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td></tr>
</table>
</form>
<form action="<%=cp %>/shopping/insertTag.do" name="tagForm" method="post">
<table width="600" border="0" cellpadding="0" cellspacing="0" align="center" style="margin: auto;">	
	<tr>
		<td width="140" height="30" bgcolor="#eeeeee" style="padding-left: 20px;">
		제품번호
		</td>
		<td width="600" style="padding-left: 10px;" bgcolor="#eeeeee">
		<input type="text" name="tag_nameNum" size="5" maxlength="100" class="boxTF"/>
		</td>
	</tr>
	<tr>
		<td width="140" height="30" bgcolor="#eeeeee" style="padding-left: 20px;">
		태그 번호
		</td>
		<td width="600" style="padding-left: 10px;" bgcolor="#eeeeee">
		<input type="text" name="pd_tagNum" size="5" maxlength="20" class="boxTF"/>
		</td>
	</tr>

	<tr>
		<td height="40" align="center">
			<input type="button" value="등록하기" class="btn2" onclick="sendIt();"/>
		</td>
	</tr>
<tr><td colspan="2" height="e" bgcolor="#dbdbdb" align="center"></td></tr>
<tr><td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td></tr>
</table>

</form>
<table width="600" border="0" cellpadding="0" cellspacing="3" align="center" style="margin: auto;">
	<tr>
		<td height="40" align="center">
		<input type="submit" value="등록취소" class="btn2" 
		onclick="javascript:location.href='<%=cp%>/shopping/list.do';"/>
		</td>
	</tr>
</table>


<table width="600 " align="center" border="1" cellpadding="0" cellspacing="0">


<tr>
	<td align="center" width="50">번호</td>
	<td align="left" width="150">제목</td>
	<td align="left" width="250">제품명</td>
	<td align="center" width="50">카테고리번호</td>
</tr>

<c:forEach var="dto" items="${settinglists }">

<tr>
	<td align="center" width="50">${dto.num }</td>
	<td align="left" width="150">${dto.name }</td>
	<td align="left" width="250">
	<img src="${imagePath }/${dto.saveFileName}" width="180" height="180"/>
	</td>
	<td>${dto.category }</td>
</tr>
</c:forEach>
</table>

</body>
</html>