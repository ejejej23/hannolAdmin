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
			        <col style="width: 10%; text-align:center">
			        <col style="width: 10%; text-align:center">
			        <col style="width: 10%; text-align:center">
			        <col style="width: 10%; text-align:center">
			        <col style="text-align:center">
			        <col style="width: 10%; text-align:center">
			    </colgroup>
    
		  <thead class="thead-light">
		    <tr>
		      <th scope="col">번호</th>
		      <th scope="col">사원번호</th>
		      <th scope="col">이름</th>
		      <th scope="col">발령코드</th>
		      <th scope="col">테마</th>
		      <th scope="col">부서</th>
		      <th scope="col">직위</th>
		      <th scope="col">발령일자</th>
		      <th scope="col"></th>
		    </tr>
		  </thead>
		  <tbody>
		  
			  	<c:forEach var="dto" items="${list}">
				    <tr>
				      <th scope="row">${dto.listNum}</th>
				      <td>${dto.usersCode}</td>
				      <td>${dto.name}</td>
				      <td>${dto.careerCode}</td>
				      <td>${dto.themeName}</td>
				      <td>${dto.dpName}</td>
				      <td>${dto.positionCode}</td>
				      <td>${dto.careerDate}</td>
				      <td><button class="btn btn1" name="infoBtn">상세 </button></td>
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