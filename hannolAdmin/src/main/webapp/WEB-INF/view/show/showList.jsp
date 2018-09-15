<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<div>
	<table class="table">
		<colgroup>
			<col style="width: 10%; text-align: center">
			<col style="width: 15%; text-align: center">
			<col style="width: 10%; text-align: center">
			<col style="width: 10%; text-align: center">
			<col style="width: 5%; text-align: center">
			<col style="width: 10%; text-align: center">
			<col style="width: 30%; text-align: center">
			<col style="width: 5%; text-align: center">
		</colgroup>

		<thead class="thead-light">
			<tr>
				<th scope="col">구분</th>
				<th scope="col">공연명</th>
				<th scope="col">시작날짜</th>
				<th scope="col">종료날짜</th>
				<th scope="col">상영시간</th>
				<th scope="col">공연장소</th>
				<th scope="col">시작시간</th>
				<th scope="col">선택</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="vo" items="${list}">
				<tr>
					<th scope="row">${vo.gubunName}</th>
					<td><a href="${articleUrl}?showCode=${vo.showCode}&pageNo=${pageNo}&tab=${tab}">${vo.showName}</a></td>
					<td>${vo.startdate}</td>
					<td>${vo.enddate}</td>
					<td>
						<c:if test="${vo.runningTime!=null}">
							${vo.runningTime}분
						</c:if>
					</td>	
					<td>${vo.name}</td>
					<td class="st">
						<c:forEach var="a" items="${vo.showTime}" varStatus="status">
							${a}&nbsp;${(status.last) ? "" : " , "}
						</c:forEach>
					</td> 
					<td><input type="radio" name="showRadio" data-showCode="${vo.showCode}"></td>
				</tr>
			</c:forEach>

		</tbody>

	</table>


	<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		<tr height="35">
			<td align="center"><c:if test="${dataCount==0 }">등록된 게시물이 없습니다.</c:if>
				<c:if test="${dataCount!=0 }">${paging}</c:if></td>
		</tr>
	</table>

	
	<div></div>
</div>

