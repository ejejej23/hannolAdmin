<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>
th, td {
	text-align: center;
	vertical-align: middle !important; 
}

.btn-update, .btn-delete{
	padding: 3px;
	font-size: 12px;
}
</style>

<script>
function searchList() {
	var f=document.searchForm;
	f.submit();
}

</script>

<div class="sub-container" style="width: 960px;">
	<div class="sub-title">
		<h3>쿠폰발송</h3>
	</div>

	<div>
		<form name="searchForm" method="post" action="<%=cp%>/coupon/list">
			<div class="col-xs-8 col-xs-offset-2">
				<div class="input-group">
					<input type="hidden" name="searchKey" value="all"> <input
						type="text" class="form-control" name="searchValue"
						placeholder="검색할 키워드를 입력해 주세요..."> <span
						class="input-group-btn">
						<button class="btn btn-default btn-info" type="button"
							onclick="searchList()">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</span>
				</div>
			</div>
		</form>
	</div>

	<div>
		<table class="table">
			<colgroup>
				<col style="width: 10%; text-align: center">
				<col style="text-align: center">
				<col style="width: 10%; text-align: center">
				<col style="width: 15%; text-align: center">
			</colgroup>

			<thead class="thead-light">
				<tr>
					<th scope="col" style="width: 10%">번호</th>
					<th scope="col">쿠폰명</th>
					<th scope="col">발급일자</th>
					<th scope="col" style="width: 10%">수정</th>
					<th scope="col" style="width: 10%">삭제</th>
				</tr>
			</thead>
			<tbody>

				<tr>
					<td scope="row">1</td>
					<td><a href="#">힘들어</a></td>
					<td>2018-09-23</td>
					<td><button type="button" class="btn btn-default btn-update">수정</button></td>
					<td><button type="button" class="btn btn-danger btn-delete">삭제</button></td>
				</tr>

				<c:forEach var="dto" items="${list}">
					<tr>
						<td scope="row">${dto.listNum}</td>
						<td><a href="${articleUrl}&num=${dto.noticeCode}">${dto.subject}</a></td>
						<td>${dto.name}</td>
						<td>${dto.created}</td>
						<td>${dto.created}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
			        123
			 </td>
		   </tr>
		</table>
		
		<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
		   <tr height="40">
		      <td align="left" width="100">
		          <button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/coupon/list';">새로고침</button>
		      </td>
		      <td align="center">
		      	&nbsp;
		      </td>
		      <td align="right" width="100">
		          <button type="button" class="btn btn-info" onclick="javascript:location.href='<%=cp%>/coupon/created';">쿠폰발송</button>
		      </td>
		   </tr>
		</table>
	</div>
</div>