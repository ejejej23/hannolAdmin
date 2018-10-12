<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script>
	//반납(대여중->반납)  
	$(function(){        
		$("body").off().on("click", ".rt_return", function(){
			var url = "<%=cp%>/assets/rentUpdate";
			var query = "bookCode="+$(this).attr("data-num")+"&stateCode=1"; //예약코드, 상태			
			
			$.ajax({ 
				type:"post",  
				url:url,  
				data:query, 
				dataType:"json",
				success:function(data){
					if(data.state=="true") {
						alert("반납이 완료되었습니다.");
						location.reload();
					}else{
						alert("반납을 실패하셨습니다. 다시 시도하세요!");
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
	<h4>대여 완료 목록</h4> 
	
	<table class="table">
		<colgroup> 
			<col style="width:8%;">
			<col style="width:8%;">
			<col style="width:20%;"> 
			<col style="width:10%;">   
			<col style="width:10%;">
			<col style="width:15%;"> 
			<col style="width:8%;">  
			<col style="width:8%;"> 
			<col style="width:8%;">
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
				<th scope="col">상태</th> 
				<th scope="col">반납</th> 
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${rentalOkList}" var="dto"> 
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
					<td <c:if test="${dto.state==2}"> class="rentWarning" </c:if>>  
						${dto.state==0 ? '예약': (dto.state==1 ? '반납완료' : (dto.state==2 ? '대여중' : '기간만료'))}  
					</td>
					<td>
						<c:if test="${dto.state==2}">     
							<button type="button" class="btn btn-danger renBtn rt_return" data-num="${dto.bookCode}">반납</button> 
						</c:if>  
					</td> 
				</tr>
			</c:forEach> 
		</tbody>
	</table> 
	
	<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		<tr>
			<td class="listData_no"> 
				<c:if test="${rentalOkDataCount==0}">
					반납된 목록이 없습니다.
				</c:if>
				<c:if test="${rentalOkDataCount!=0}">
					${rentalOkpaging} 
				</c:if>
			</td>
		</tr>
	</table>
</div>
