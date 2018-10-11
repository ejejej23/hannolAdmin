<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script>
	//대여 확인(예약->대여중)
	$(function(){        
		$("click").off().on(".rentalOk", function(){								
			var url = "<%=cp%>/assets/rentUpdate";
			var query = "bookCode="+$(this).attr("data-num")+"&stateCode=2"; //예약코드, 상태코드		
			
			$.ajax({   
				type:"post", 
				url:url,
				data:query,
				dataType:"json",
				success:function(data){
					if(data.state=="true") {
						alert("대여가 완료되었습니다.");
						location.reload();
					}else{
						alert("대여를 실패하셨습니다. 다시 시도하세요!");
					}  
				},
				error:function(e){
					console.log(e.responseText);
				} 
			});  
		});	
	});
</script>

<div class="tableBox">
	<h4>대여 신청 목록</h4>
	
	<table class="table">
		<colgroup>
			<col style="width:8%;">
			<col style="width:8%;">
			<col style="width:20%;">  
			<col style="width:10%;">   
			<col style="width:10%;">
			<col style="width:15%;">
			<col style="width:10%;">
			<col style="width:10%;">
		</colgroup> 
	
		<thead>
			<tr>
				<th scope="col">예약번호</th>
				<th scope="col">상품번호</th>
				<th scope="col">상품명</th>
				<th scope="col">아이디</th>
				<th scope="col">대여자</th>
				<th scope="col">전화번호</th>
				<th scope="col">대여시간</th>
				<th scope="col">대여확인</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${assetsReservationList}" var="dto">
				<tr>
					<td>${dto.bookCode}</td>
					<td>${dto.assetsCode}</td>
					<td>${dto.facilityName}</td>
					<td>${dto.memberId}</td>
					<td>${dto.name}</td>
					<td>${dto.tel}</td>
					<td>
						${dto.bookTime==0 ? '오후':'종일'} 
					</td>
					<td>
						<button type="button" class="btn btn-default  renBtn rentalOk" data-num="${dto.bookCode}">확인</button> 
					</td> 
				</tr>
			</c:forEach> 
		</tbody>
	</table>
	
	<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		<tr>
			<td class="listData_no">
				<c:if test="${assetsReservationDataCount==0}">
					예약한 대여 목록이 없습니다.
				</c:if>
				<c:if test="${assetsReservationDataCount!=0}">
					${reservationPaging}  
				</c:if>
			</td>  
		</tr>
	</table>
</div>

