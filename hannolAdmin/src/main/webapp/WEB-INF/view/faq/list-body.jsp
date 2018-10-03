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
		<col style="text-align:center">
		<col style="width: 15%; text-align:center">
		<col style="width: 15%; text-align:center">
	</colgroup>

	<thead class="thead-light">
		<tr>
			<th scope="col">번호</th>
			<th scope="col">제목</th>
			<th scope="col" class="txt-title">작성자</th>
			<th scope="col" class="txt-title">작성일자</th>
		</tr>
	</thead>

	<tbody>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td></td>
				<td><a href="${articleUrl}&faqCode=${dto.faqCode}">${dto.subject}</a></td>
				<td>${dto.usersName}</td>
				<td>${dto.created}</td>
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
