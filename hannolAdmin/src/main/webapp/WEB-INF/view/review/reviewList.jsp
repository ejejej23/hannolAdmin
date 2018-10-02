<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>
.redHeart{
	background: url("<%=cp%>/resource/images/like_heart_icon.png") 0px 0px no-repeat;	
	width: 30px;
	height: 30px;
	background-size: 100% auto;
}
.deleteReview{
	cursor: pointer;
}
</style>

<c:forEach items="${list}" var="dto">
    <div style="height: 70px;">
		<div style="width: 80%; float: left;" align="left" >
			<div>${dto.content}</div> 
			<div style="padding-top: 10px;">${dto.memberId}&nbsp;&nbsp;|&nbsp;&nbsp;${dto.reviewDate} 방문</div>		
		</div>
    	<div style="width: 20%; float: left; background: " align="center" data-reviewCode="${dto.reviewCode}">
    		<div id="likeCount${dto.reviewCode}" class="redHeart"></div>
			
		    <input type="text" name="likeCount${dto.reviewCode}" style="text-align:center; padding-left:14px; background-color:transparent; border: none; " disabled="disabled" value="${dto.likecount}">		
    		
    		<img class="deleteReview" src="<%=cp%>/resource/images/close_icon.png" onclick="deleteReview('${dto.reviewCode}')">
		</div>
		<hr size="3">
    </div>
</c:forEach>    

<div align="center" style="clear: both;">
	${paging}
</div>