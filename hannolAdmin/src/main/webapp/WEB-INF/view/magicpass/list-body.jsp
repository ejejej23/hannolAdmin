<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>
.txt-title, .txt-content {
	text-align: center;
}

td{
	vertical-align: middle !important;
}

.btn-cancle{
	padding: 5px;
	font-size: 12px;
}
</style>

<table class="table">
	<colgroup>
		<col style="width: 5%; text-align:center">
		<col style="text-align:center">
		<col style="width: 15%; text-align:center">
		<col style="width: 15%; text-align:center">
		<col style="width: 15%; text-align:center">
		<col style="width: 15%; text-align:center">
		<col style="width: 10%; text-align:center">
	</colgroup>

	<thead class="thead-light">
		<tr>
			<th scope="col" style="text-align: center;"><input type="checkbox"></th>
			<th scope="col">어트랙션명</th>
			<th scope="col" class="txt-title">티켓코드</th>
			<th scope="col" class="txt-title">예약자명</th>
			<th scope="col" class="txt-title">예약시간</th>
			<th scope="col" class="txt-title">예약날짜</th>
			<th scope="col" class="txt-title">상태</th>
		</tr>
	</thead>
	
	<tbody>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td class="txt-content"><input type="checkbox"></td>
				<td>${dto.name}</td>
				<td class="txt-content">${dto.ticketCode}</td>
				<td class="txt-content">${dto.usersCode }</td>
				<td class="txt-content">${dto.mpTime}:00~${dto.mpTime+1}:00</td>
				<td class="txt-content">${dto.mpDate}</td>
				<td class="txt-content">
					<c:if test="${dto.state==0}">
						<button type="button" class="btn btn-danger btn-cancle">예약취소</button>	
					</c:if>
					<c:if test="${dto.state==1}">
						탑승완료
					</c:if>
				</td>
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
