<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script>
$(function(){
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
	}
});

function deleteFaq(){
	if(!confirm("정말 삭제 하시겠습니까?")){
		return;
	}
	
	location.href="<%=cp%>/faq/delete?${query}&faqCode=${dto.faqCode}";
}
</script>


<div class="sub-container" style="width: 960px;">
    <div class="sub-title">
	  <h3>FAQ글내용</h3>
	</div>
    
    <div>
			<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			<tr height="35" style="border-top: 2px solid #dddddd; border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="center">
				   ${dto.subject}
			    </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td width="50%" align="left" style="padding-left: 5px;">
			       작성자 : ${dto.usersName}
			    </td>
			    <td width="50%" align="right" style="padding-right: 5px;">
			        ${dto.created} 
			    </td>
			</tr>
			
			<tr>
			  <td colspan="2" align="left" style="padding: 10px 5px;" valign="top" height="200">
			      ${dto.content}
			   </td>
			</tr>
			</table>
			
			<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
			<tr height="45">
			    <td width="300" align="left">	
			    <c:if test="${sessionScope.staff.authority == 'ROLE_ADMIN' }">			    
			          <button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/faq/update?${query}&faqCode=${dto.faqCode}';">수정</button>
			          <button type="button" class="btn btn-default" onclick="deleteFaq();">삭제</button>
			    </c:if>
			    </td>
			
			    <td align="right">
			        <button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/faq/list?${query}';">돌아가기</button>
			    </td>
			</tr>
			</table>
    </div>
    
    
</div>
