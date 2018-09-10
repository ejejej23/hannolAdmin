<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script type="text/javascript">
$(function() {
	$("body").on("click","button",function(){
		console.log("tesst");
	}); 
});

</script>
<div class="sub-container" style="width: 960px;">
    
    <div class="sub-title">
	  <h3>마감 <small>수불관리</small></h3>
	</div> 
    
    <div>
		<table class="table">
			    <colgroup>
			        <col style="width: 10%; text-align:center">
			        <col style="width: 10%; text-align:center">
			        <col style="width: 15%; text-align:center">
			        <col style="text-align:center">
			        <col style="width: 15%; text-align:center">
			        <col style="width: 15%; text-align:center">
			        <col style="width: 15%; text-align:center">
			    </colgroup>
    
		  <thead class="thead-light">
		    <tr>
		      <th scope="col">번호</th>
		      <th scope="col">년도</th>
		      <th scope="col">월</th>
		      <th scope="col">마감여부</th>
		      <th scope="col">결제사원번호</th>
		      <th scope="col">결제담당자</th>
		      <th scope="col">마감일자</th>
		    </tr>
		  </thead>
		  <tbody>
		  
			  	<c:forEach var="dto" items="${list}">
			    <tr>
			      <th scope="row">${dto.listNum}</th>
			      <td>${dto.year}</td>
			      <td>${dto.month}</td>
			      <td>${dto.isMagam == 1?"마감":"-"}&nbsp;<button id="${dto.year }-${dto.month }">변경 </button></td>
			      <td>${dto.usersCode}</td>
			      <td>${dto.name}</td>
			      <td>${dto.magamDate}</td>
			    </tr>
			    </c:forEach>
			    
		  </tbody>
		</table>
		
		
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
			        <c:if test="${dataCount==0 }">등록된 게시물이 없습니다.</c:if>
			        <c:if test="${dataCount!=0 }">${paging}</c:if>
			 </td>
		   </tr>
		</table>

    </div>
</div>