<%@include file = "/payment/header.jsp"  %>
    
    
<script type="text/javascript">

	function sendIt() {
		
		var f = document.myForm;
		
		str= f.name.value;
		str = str.trim();
		if(!str) {
			alert("\n이름을 입력하세요.")
			f.name.focus();
			return;
		}		
		f.name.value = str;
		
		str= f.subject.value;
		str = str.trim();
		if(!str) {
			alert("\n제목을 입력하세요.")
			f.subject.focus();
			return;
		}
		f.subject.value = str;
		
		str= f.content.value;
		str = str.trim();
		if(!str) {
			alert("\n내용을 입력하세요.")
			f.content.focus();
			return;
		}		
		f.content.value = str;
		
		f.action = "<%=cp%>/review/write_ok.do";
		f.submit();
	}

</script>

<body>

<section class="related spad">
       <div class="container">
           <div class="row">
               <div class="col-lg-12">
                   <h1 class="related-title">Review</h1>
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
						<td align="center" width="100" bgcolor="#FCF8E8">Name</td>
						<td align="left" style="padding-left: 5px ;" bgcolor="#FCF8E8">
						<input type="text" name="name" size="20"  class="txtField"/>
						</td>
					</tr>					
					<tr height="60">
						<td align="center" width="100" bgcolor="#FCF8E8">Title</td>
						<td align="left" style="padding-left: 5px;" bgcolor="#FCF8E8">
						<input type="text" name="subject" size="54" class="txtField"/>
						</td>
					</tr>						
					<tr height="100">
						<td align="center" width="100" bgcolor="#FCF8E8">Contents</td>
						<td align="left" style="padding-left: 5px;" bgcolor="#FCF8E8">						
						<textarea rows="12" cols="56" name="content" class="boxTA"></textarea>
						</td>
					</tr>
				
					<tr height="10">
						<td align="right" colspan="2" bgcolor="#FCF8E8">
						<input type="button" class="btn2" value="Registration" onclick="sendIt()"/>
						<input type="reset" class="btn2" value="Re-enter"
						onclick="document.myForm.name.focus();"/>
						</td>
					</tr>	
	<!-- 				<tr height="2"><td colspan="2" bgcolor="#ccccc"></td></tr> -->
					</table>
					
					<table width="600" border="0" cellspacing="0" cellpadding="5"  style="margin: auto;">
					<c:forEach var="dto" items="${lists }">
						<tr height="30">
							<td align="left" bgcolor="#FCF8E8">&nbsp;NO&nbsp;${dto.num }&nbsp;.&nbsp;Name&nbsp;${dto.name }</td>
						<td align="right" bgcolor="#FCF8E8">&nbsp;Title&nbsp;${dto.subject }</td>
							<br/></tr>
						<tr height="30">	
							<td align="left" bgcolor="#FCF8E8">&nbsp;Contents&nbsp;${dto.savepath }</td>
							<td align="right" bgcolor="#FCF8E8">
							<input type="button" class="btn2" value="Delete" 
							onclick="javascript:location.href='<%=cp%>/review/delete.do?num=${dto.num }';"/></tr>
							<%-- javascript:location.href='<%=cp%>/guest/delete.jsp?num=<%=dto2.getNum()%>'; --%>
						<tr height="40"><td align="left" bgcolor="#ffffff">&nbsp;${dto.content }<br/></td>
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