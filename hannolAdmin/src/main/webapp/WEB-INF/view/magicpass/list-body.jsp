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

<script>
$(function(){
	$(".btn-cancle").click(function(){
		if(!confirm("예약을 취소하시겠습니까?")){
			return;
		}
		
		var mpCode =$(this).attr("data-mpCode"); 
		var data = "mpCodes="+mpCode;
		var url = "<%=cp%>/magicpass/deleteReserve"
			
		$.ajax({
			type:"POST"
			,url:url
			,data: data
			,dataType : "json"
			,success:function(data) {	
				if(data.state=="success"){
					alert("예약을 취소했습니다.");
				}
				location.reload();
			}
		    ,error:function(e) {
		    	console.log(e.responseText);
		    }
		});
	});
	
	$(".checkbox-all").click(function(){
		var $checkBoxs = $(".checkbox-content");
		if($checkBoxs.length != undefined){
			if($(this).is(":checked")){
				for(var i=0; i<$checkBoxs.length; i++){
					if(! $($checkBoxs[i]).is(":disabled")){
						$($checkBoxs[i]).prop("checked", true);						
					}
				}
			}else{
				for(var i=0; i<$checkBoxs.length; i++){
					$($checkBoxs[i]).prop("checked", false);
				}
			}
		}
	});
	
	$(".btn-delete-all").click(function(){
		var data = "";
		var $checkBoxs = $(".checkbox-content");
		
		if($checkBoxs.length != undefined){
			for(var i=0; i<$checkBoxs.length; i++){
				if($($checkBoxs[i]).is(":checked")){
					data+="mpCodes="+$($checkBoxs[i]).attr("data-mpCode")+"&";
				}
			}
			
			if(data==""){
				alert("삭제할 데이터가 없습니다.");
				return;
			}
			
			data = data.substring(0, data.length-1);
			var url = "<%=cp%>/magicpass/deleteReserve"
				
				$.ajax({
					type:"POST"
					,url:url
					,data: data
					,dataType : "json"
					,success:function(data) {	
						if(data.state=="success"){
							alert("예약을 취소했습니다.");
						}
						location.reload();
					}
				    ,error:function(e) {
				    	console.log(e.responseText);
				    }
				});
		}else{
			alert("삭제할 데이터가 없습니다.");
		}
	});
});
</script>

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
			<th scope="col" style="text-align: center;"><input type="checkbox" class="checkbox-all"></th>
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
				<td class="txt-content">
					<c:if test="${dto.state==0}">
					<input type="checkbox" name="select_item" class="checkbox-content" data-mpCode="${dto.mpCode}">
					</c:if>
					<c:if test="${dto.state==1}">
					<input type="checkbox" name="select_item" class="checkbox-content" data-mpCode="${dto.mpCode}" disabled="disabled">
					</c:if>
				</td>
				<td>${dto.name}</td>
				<td class="txt-content">${dto.ticketCode}</td>
				<td class="txt-content">${dto.usersCode }</td>
				<td class="txt-content">${dto.mpTime}:00~${dto.mpTime+1}:00</td>
				<td class="txt-content">${dto.mpDate}</td>
				<td class="txt-content">
					<c:if test="${dto.state==0}">
						<button type="button" name="select_item" class="btn btn-danger btn-cancle" data-mpCode="${dto.mpCode}">예약취소</button>	
					</c:if>
					<c:if test="${dto.state==1}">
						탑승완료
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<button type="button" class="btn btn-default btn-delete-all">선택예약취소</button>

<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
   <tr height="35">
	<td align="center">
	        <c:if test="${dataCount==0 }">등록된 게시물이 없습니다.</c:if>
	        <c:if test="${dataCount!=0 }">${paging}</c:if>
	 </td>
   </tr>
</table>
