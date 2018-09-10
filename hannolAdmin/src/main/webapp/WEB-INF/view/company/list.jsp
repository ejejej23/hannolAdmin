<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
	.table{font-size:13px;}
	.table th,
	.table td{text-align:center;}
	.table th:nth-child(2),
	.table td:nth-child(2),
	.table th:nth-child(3),
	.table td:nth-child(3){text-align:left;}
	
</style>

<div class="sub-container">
	<div class="sub-title">
		<h3>업체 정보</h3>
	</div>

	<div class="sub_contents">
		<table class="table">
			<colgroup>
				<col style="width:6%;">
				<col style="width:18%;">
				<col style="">
				<col style="width:10%;">
				<col style="width:10%;">
				<col style="width:15%;">
			</colgroup>

			<thead class="thead-light">
				<tr>
					<th scope="col">번호</th>
					<th scope="col">업체명</th>
					<th scope="col">상세설명</th>
					<th scope="col">담당부서</th>
					<th scope="col">담당자</th>
					<th scope="col">연락처</th>
				</tr>
				
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>미츠바시 엘리베이터</td>
					<td><a href="#">엘리베이터 정비 업체</a></td>
					<td>정비팀</td>
					<td>김김</td>
					<td>02-5555-5555</td>
				</tr>
				<tr>
					<td>2</td>
					<td>미츠바시 엘리베이터</td>
					<td><a href="#">엘리베이터 정비 업체</a></td>
					<td>정비팀</td>
					<td>김김김</td>
					<td>010-5555-5555</td>
				</tr>
			</tbody>
		</table>


		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			<%-- <tr height="35">
				<td align="center"><c:if test="${dataCount==0 }">등록된 게시물이 없습니다.</c:if>
					<c:if test="${dataCount!=0 }">${paging}</c:if></td>
			</tr> --%>
		</table>

		<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
			<tr height="40">
				<td align="left" width="100">
					<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/company/list';">새로고침</button>
				</td>
				<td align="center">
					<form name="searchForm" method="post">
						<div class="col-xs-8 col-xs-offset-2">
							<div class="input-group">
								<input type="hidden" name="searchKey" value="all"> 
								<input type="text" class="form-control" name="searchValue" placeholder="검색할 키워드를 입력해 주세요..."> 
								<span class="input-group-btn">
									<button class="btn btn-default btn-info" type="button" onclick="searchList()">
										<span class="glyphicon glyphicon-search"></span>
									</button>
								</span>
							</div>
						</div>
					</form>
				</td>
				<td align="right" width="100">
					<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/company/companyCreated';">업체추가</button>
				</td>
			</tr>
		</table>
	</div>
</div>