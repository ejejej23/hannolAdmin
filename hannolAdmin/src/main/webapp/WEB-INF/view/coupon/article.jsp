<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<style>
tr {
	margin: 5px;
}

.td_title {
	font-weight: bold;
	text-align: left;
}

.btnBox{
	text-align: center;
}

.btnBox button{
	width: 150px;
    margin-top: 10px;
}

.td_gubun{
	padding-left: 10px;
}
</style>

<script>
function searchList() {
	var f=document.searchForm;
	f.submit();
}

$(function(){
	var gubunCode = "${dto.goodsCode}";
	
	<c:forEach items="${list}" var="item">
		console.log("${item.goodsCode}");
		console.log(gubunCode);
		
		if("${item.goodsCode}" == gubunCode){
			$(".txt_coupon").html("${item.goodsName}");
		}
	</c:forEach>
	
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
		<h3>쿠폰발송</h3>
	</div>

	<div>
	<form action="<%=cp%>/coupon/created" method="POST" id="couponForm">
			<table>
				<tr>
					<td class="td_title">발급유형</td>
					<td class="td_gubun">
						<c:if test="${dto.userGubun==1}">
							전체
						</c:if>
						<c:if test="${dto.userGubun==2}">
							일반
						</c:if>
						<c:if test="${dto.userGubun==3}">
							GOLD
						</c:if>
						<c:if test="${dto.userGubun==4}">
							VIP
						</c:if>
					</td>
				</tr>
				
				<tr height="40">
					<td class="td_title">쿠폰명</td>
					<td class="td_gubun">
						${dto.mngName}
					</td>
				</tr>
				
				<tr height="40">
					<td class="td_title">유효기간</td>
					<td class="td_gubun">
						${dto.startDate} 
						~ 
						${dto.endDate}
					</td>
				</tr>
				<tr height="40">
					<td class="td_title">발급쿠폰</td>
					<td class="td_gubun txt_coupon">
						
					</td>
				</tr>
				
				<tr height="40">
					<td class="td_title">수량</td>
					<td class="td_gubun">
						${dto.count}
					</td>
				</tr>
				
				<tr>
					<td class="td_title">상세</td>
					<td class="td_gubun">${dto.memo}</td>
				</tr>
			</table>
		</form>
		<div class="btnBox">
			<button class="btn btn-default" onclick="javascript:location.href='<%=cp%>/coupon/list?${dataQuery}'">돌아가기</button>
			<c:if test="${sessionScope.staff.authority == 'ROLE_ADMIN' }">
			<button class="btn btn-danger btn-delete" data-num="${dto.mngCode}">삭제</button>
			</c:if>
		</div>
		
		<div>
			${msg}
		</div>
	</div>
</div>