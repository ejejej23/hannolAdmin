<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<table class="table">
		    <colgroup>
		        <col style="width: 10%; text-align:center">
		        <col style="width: 10%; text-align:center">
		        <col style="width: 10%; text-align:center">
		        <col style="text-align:center">
		        <col style="width: 15%; text-align:center">
		        <col style="width: 10%; text-align:center">
		        <col style="width: 15%; text-align:center">
		        <col style="width: 10%; text-align:center">
		    </colgroup>
    
		  <thead class="thead-light">
		    <tr>
		      <th scope="col">번호</th>
		      <th scope="col">년도</th>
		      <th scope="col">분기</th>
		      <th scope="col">예산금액</th>
		      <th scope="col">결제사원번호</th>
		      <th scope="col">결제담당자</th>
		      <th scope="col">입력일자</th>
		      <th scope="col">&nbsp;</th>
		    </tr>
		  </thead>
		  <tbody>
			  	<c:forEach var="dto" items="${list}">
				    <tr>
				      <th scope="row">${dto.listNum}</th>
				      <td>${dto.year}</td>
				      <td>${dto.quarter}</td>
				      <td><fmt:formatNumber value="${dto.budget}" type="number"/>원</td>
				      <td>${dto.usersCode}</td>
				      <td>${dto.name}</td>
				      <td>${dto.inputDate}</td>
				      <td><button class="btn btn-default" name="updateBtn">수정</button></td>
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