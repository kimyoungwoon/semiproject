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

    <!-- Css Styles -->
    <link rel="stylesheet" type="text/css" href="<%=cp %>/writing/reviewer/data/style.css"/>
	<link rel="stylesheet" type="text/css" href="<%=cp %>/writing/reviewer/data/newstyle.css"/>
    <link rel="stylesheet" href="<%=cp%>/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="<%=cp%>/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="<%=cp%>/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="<%=cp%>/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="<%=cp%>/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="<%=cp%>/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="<%=cp%>/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="<%=cp%>/css/style.css" type="text/css">
<script type="text/javascript">

	function sendIt() {
		
		var f = document.myForm;
		
		f.action = "<%=cp%>/review/write_ok.do";
		f.submit();
	}

</script>
</head>
<body>

<section class="related spad">
       <div class="container">
           <div class="row">
               <div class="col-lg-12">
                   <h2 class="related-title">Review Board</h2>
               </div>
           </div>
       </div>
</section>       	    



<div class="container">	
		<form action="" method="post" name="myForm">					       
		          <div class="col-lg-12">
		               <h4 class="related-title">Please Write a Review</h4>
		          </div>			       						
			<table width="600" border="0px" style="margin: auto;">
					<tr height="60">
						<td align="center" width="100" bgcolor="#E7FEFF">작성자</td>
						<td align="left" style="padding-left: 5px ;" bgcolor="#E7FEFF">
						<input type="text" name="name" size="20"  class="txtField"/>
						</td>
					</tr>					
					<tr height="60">
						<td align="center" width="100" bgcolor="#E7FEFF">제목</td>
						<td align="left" style="padding-left: 5px;" bgcolor="#E7FEFF">
						<input type="text" name="subject" size="54" class="txtField"/>
						</td>
					</tr>						
					<tr height="100">
						<td align="center" width="100" bgcolor="#E7FEFF">내용</td>
						<td align="left" style="padding-left: 5px;" bgcolor="#E7FEFF">						
						<textarea rows="12" cols="56" name="content" class="boxTA"></textarea>
						</td>
					</tr>
				
					<tr height="10">
						<td align="right" colspan="2" bgcolor="#E7FEFF">
						<input type="submit" class="btn2" value="등록하기" onclick="sendIt()"/>
						<input type="reset" class="btn2" value="다시입력"
						onclick="document.myForm.name.focus();"/>
						</td>
					</tr>	
	<!-- 				<tr height="2"><td colspan="2" bgcolor="#ccccc"></td></tr> -->
					</table>
					
					<table width="600" border="0" cellspacing="0" cellpadding="5"  style="margin: auto;">
					<c:forEach var="dto" items="${lists }">
						<tr height="20">
							<td align="left" bgcolor="#E7FEFF">NO&nbsp;${dto.num }&nbsp;.&nbsp;이름&nbsp;${dto.name }</td>
							<td align="right" bgcolor="#E7FEFF">제목&nbsp;${dto.subject }</td>
							<br/></tr>
						<tr height="20">	
							<td align="left" bgcolor="#E7FEFF">작성일&nbsp;${dto.savepath }</td>
							<td align="right" bgcolor="#E7FEFF">
							<input type="button" class="btn2" value="삭제" 
							onclick="javascript:location.href='<%=cp%>/review/delete.do?num=${dto.num }';"/></tr>
							<%-- javascript:location.href='<%=cp%>/guest/delete.jsp?num=<%=dto2.getNum()%>'; --%>
						<tr><td align="left" bgcolor="#ffffff">${dto.content }<br/></td>
						</tr>					
					</c:forEach>
					</table>			
					<table style="margin: auto;">
					<tr>
						<td style="margin: auto;">${pageIndexList }</td>
					</tr>
			</table>				
		</form>
		
</div>

</body>
</html>