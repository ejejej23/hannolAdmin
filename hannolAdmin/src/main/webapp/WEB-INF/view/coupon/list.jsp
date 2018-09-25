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

$(function(){
	$(".btn-delete").click(function(){
		var num = $(this).attr("data-num");
		var url = "<%=cp%>/coupon/delete";
		var data = "mngCode="+num;
		
		$.ajax({
			type:"POST"
			,url:url
			,data: data
			,success:function(data) {
				if(data.state=="success"){
					location.href="<%=cp%>/coupon/list";
				}else{
					alert("이미 사용한 쿠폰이 있어서 삭제가 불가능 합니다.");
				}
			}
		    ,error:function(e) {
		    	console.log(e.responseText);
		    }
		});
	});
});

</script>

<div class="sub-container" style="width: 960px;">
	<div class="sub-title">
		<h3>쿠폰발송 <small>${dataCount}개(${page}/${total_page} 페이지)</small></h3>
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
					<th scope="col" style="width: 10%">삭제</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="item">
				<tr>
					<td scope="row">${item.listNum}</td>
					<td><a href="<%=cp%>/coupon/article?mngCode=${item.mngCode}">${item.mngName}</a></td>
					<td>${item.mngDate}</td>
					<td><button type="button" class="btn btn-danger btn-delete" data-num="${item.mngCode}">삭제</button></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
			        ${paging}
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