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
	function sendIt() {
		
    	f = document.myForm;
    
  
    
    	f.action="<%=cp%>/shopping/insert_ok.do";
  	 	f.submit();
}
	
</script>


</head>
<body>
<br/><br/>
<table width="600" border="2" cellpadding="0" cellspacing="0"
bordercolor="#d6d4a6" align="center" style="margin: auto;">

<tr height="40">
	<td style="padding-left: 20px;">
	<b>이미지 게시판</b><span><a href="<%=cp%>/shopping/setting.do"> <button>제품추가</button></a> </span>
	</td>
</tr>
</table>

<form action="" name="myForm" method="post" enctype="multipart/form-data">
<table width="600" border="0" cellpadding="0" cellspacing="0" align="center" style="margin: auto;">
	<tr>
		<td width="140" height="30" bgcolor="#eeeeee" style="padding-left: 20px;">
		제품명
		</td>
		<td width="600" style="padding-left: 10px;" bgcolor="#eeeeee">
		<input type="text" name="pd_name" size="48" maxlength="100" class="boxTF"/>
		</td>
	</tr>
<tr><td colspan="2" height="e" bgcolor="#dbdbdb" align="center"></td></tr>
<tr><td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td></tr>
	<tr>
		<td width="140" height="30" bgcolor="#eeeeee" style="padding-left: 20px;">
		제품금액
		</td>
		<td width="600" style="padding-left: 10px;" bgcolor="#eeeeee">
		<input type="text" name="pd_price" size="48" maxlength="100" class="boxTF"/>
		</td>
	</tr>
<tr><td colspan="2" height="e" bgcolor="#dbdbdb" align="center"></td></tr>
<tr><td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td></tr>
	<tr>
		<td width="140" height="30" bgcolor="#eeeeee" style="padding-left: 20px;">
		카테고리번호
		</td>
		<td width="600" style="padding-left: 10px;" bgcolor="#eeeeee">
		<input type="text" name="pd_categoryNum" size="48" maxlength="20" class="boxTF"/>
		</td>
	</tr>
<tr><td colspan="2" height="e" bgcolor="#dbdbdb" align="center"></td></tr>
<tr><td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td></tr>
	<tr>
		<td width="140" height="30" bgcolor="#eeeeee" style="padding-left: 20px;">
		브랜드번호
		</td>
		<td width="600" style="padding-left: 10px;" bgcolor="#eeeeee">
		<input type="text" name="pd_brandNum" size="48" maxlength="20" class="boxTF"/>
		</td>
	</tr>
<tr><td colspan="2" height="e" bgcolor="#dbdbdb" align="center"></td></tr>
<tr><td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td></tr>

<tr><td colspan="2" height="e" bgcolor="#dbdbdb" align="center"></td></tr>
<tr><td colspan="2" height="1" bgcolor="#dbdbdb" align="center"></td></tr>
	<tr>
		<td width="140" height="30" bgcolor="#eeeeee" style="padding-left: 20px;">
		파&nbsp;&nbsp;&nbsp;일
		</td>
		<td width="600" style="padding-left: 10px;" bgcolor="#eeeeee">
		<input type="file" name="upload" size="48" maxlength="100" class="boxTF"/>
		</td>
	</tr>
<tr><td colspan="2" height="e" bgcolor="#dbdbdb" align="center"></td></tr>
</table>

<table width="600" border="0" cellpadding="0" cellspacing="3" align="center" style="margin: auto;">
	<tr>
		<td height="40" align="center">
		<input type="button" value="등록하기" class="btn2" onclick="sendIt();"/>
		<input type="reset" value="다시입력" class="btn2" onclick="document.myForm.pd_name.focus();"/>
		<input type="submit" value="등록취소" class="btn2" 
		onclick="javascript:location.href='<%=cp%>shopping/list.do';"/>
		</td>
	</tr>
</table>
</form>


</body>
</html>