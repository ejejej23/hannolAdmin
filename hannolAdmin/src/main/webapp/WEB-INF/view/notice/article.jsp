<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">
function deleteNotice() {
<c:if test="${sessionScope.staff.authority=='ROLE_ADMIN' || sessionScope.staff.staffIdx==dto.usersCode}">
	var num = "${dto.noticeCode}";
	var page = "${page}";
	var query = "num="+num+"&page="+page;
	var url = "<%=cp%>/notice/delete?" + query;

	if(confirm("위 자료를 삭제 하시 겠습니까 ? ")) {
			location.href=url;
	}
</c:if>    
<c:if test="${sessionScope.staff.authority!='ROLE_ADMIN' && sessionScope.staff.staffIdx!=dto.usersCode}">
	alert("게시물을 삭제할 수  없습니다.");
</c:if>
}

function updateNotice() {
<c:if test="${sessionScope.staff.staffIdx==dto.usersCode}">
	var num = "${dto.noticeCode}";
	var page = "${page}";
	var query = "num="+num+"&page="+page;
	var url = "<%=cp%>/notice/update?" + query;

	location.href=url;
</c:if>

<c:if test="${sessionScope.staff.staffIdx!=dto.usersCode}">
	alert("게시물을 수정할 수  없습니다.");
</c:if>
}
</script>

<script type="text/javascript">
function login() {
	location.href="<%=cp%>/staff/login";
}

</script>

<div class="body-container" style="width: 960px;">
    <div class="body-title">
        <h3><span style="font-family: Webdings">2</span> 글보기 </h3>
    </div>
    
    <div>
			<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			<tr height="35" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="center">
				   ${dto.subject}
			    </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td width="50%" align="left" style="padding-left: 5px;">
			       작성자 : ${dto.name}
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
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			       이전글 :
			         <c:if test="${not empty preReadDto}">
			              <a href="<%=cp%>/notice/article?${query}&num=${preReadDto.noticeCode}">${preReadDto.subject}</a>
			        </c:if>
			    </td>
			</tr>
			
			<tr height="35" style="border-bottom: 1px solid #cccccc;">
			    <td colspan="2" align="left" style="padding-left: 5px;">
			       다음글 :
			         <c:if test="${not empty nextReadDto}">
			              <a href="<%=cp%>/notice/article?${query}&num=${nextReadDto.noticeCode}">${nextReadDto.subject}</a>
			        </c:if>
			    </td>
			</tr>
			</table>
			
			<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
			<tr height="45">
			    <td width="300" align="left">
			       <c:if test="${sessionScope.staff.staffIdx==dto.usersCode}">				    
			          <button type="button" class="btn" onclick="updateNotice();">수정</button>
			       </c:if>
			       <c:if test="${sessionScope.staff.staffIdx==dto.usersCode || sessionScope.staff.authority=='ROLE_ADMIN'}">				    
			          <button type="button" class="btn" onclick="deleteNotice();">삭제</button>
			       </c:if>
			    </td>
			
			    <td align="right">
			        <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/notice/list?${query}';">리스트</button>
			    </td>
			</tr>
			</table>
    </div>
    
    
</div>
