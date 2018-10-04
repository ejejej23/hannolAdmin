<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style>
	/*search*/
	.datepickerBox{display:inline-block;}
	.datepickerBox .datepicker{width:150px;}   
	.datepicker + img{width:22px; margin:0px 0px 0px -31px; padding-left:8px; border-left:1px solid #dddddd; cursor:pointer;}

</style>

<script>

//datepicker
$(function(){
	//검색 시작날짜
	$("input[name=searchStartDate]").datepicker({
		dateFormat:'yy-mm-dd',
		showOn:"button",
        buttonImage:"<%=cp%>/resource/images/date24.png",
        buttonImageOnly:true,
        showAnim:"slideDown",
        buttonText:"선택",
        onSelect:function(selected){
        	if(!$("input[name=searchEndDate]").val()){ 
        		$("input[name=searchEndDate]").val(selected);  
        	}
        		
        	$("input[name=searchEndDate]").datepicker("option", "minDate", selected);
        
        }
	}); 
});
</script>

<div>
	<form name="bookForm" id="bookForm">
		
		<table style="width: 100%; margin: 30px auto; border-spacing: 0px;">
				<tr>
					<th>공연</th> 
					<td>
						<select name="showName" class="selectField">
							<c:forEach items="${showList}" var="dto">
								<option value="${dto.showInfoCode}">${dto.showName}</option>
							</c:forEach>
						</select>  
					</td>  
				</tr>
				<tr height="40">
					<th>날짜</th>
					<td>
						<span class="datepickerBox"><input type="text" name="searchStartDate" class="boxTF datepicker" readonly="readonly" value="${searchStartDate}"></span> 
					</td>  
				</tr>
				<tr>
					<th>검색</th> 
					<td>
						<select name="searchKey" class="selectField">
							<option value="kind" <c:if test="${searchKey=='kind'}">selected="selected"</c:if>>분류</option>
							<option value="name" <c:if test="${searchKey=='name'}">selected="selected"</c:if>>시설명</option> 
							<option value="content" <c:if test="${searchKey=='content'}">selected="selected"</c:if>>점검내역</option>
						</select>  
					</td>  
				</tr>
				<tr>
					<th>
					</th>
					<td>
						<button type="button" class="btn btn-default" onclick="searchList()" style="margin-top: 11px; margin-left:50px;">검색</button>
					</td>
				</tr>
			</table>
	
	
	
		<table class="table">
		    <colgroup>
		        <col style="width: 5%; text-align:center">
		        <col style="width: 20%; text-align:center">
		        <col style="width: 20%; text-align:center">
		        <col style="width: 20%; text-align:center">
		        <col style="width: 20%; text-align:center">
		        <col style="width: 15%; text-align:center">
		    </colgroup>
    
		  <thead class="thead-light">
		    <tr style="text-align: center;">
		      <th scope="col"><input type="checkbox" name="chkAll" id="chkAll" value="chkAll" onclick="checkAll();"></th>
		      <th scope="col">예약번호</th>
		      <th scope="col">예약일자</th>
		      <th scope="col">회원명</th>
		      <th scope="col">전화번호</th>
		      <th scope="col">좌석</th>
		    </tr>
		  </thead>
		  <tbody>
			  	<c:forEach var="dto" items="${list}">
				    <tr>
				      <th><input type="checkbox" name="chk" value="chk" onclick="chkSingle();" data-showBookCode="${dto.showBookCode}"></th>
				      <th scope="row">${dto.bookDate}</th>
				      <td>${dto.screenDate}</td>
				      <td>${dto.showName}</td>
				      <td>${dto.name}</td>
				      <td>
					      <c:forEach items="${dto.seatNum}" var="vo" varStatus="status">
					      	${vo}&nbsp;${(status.last) ? "" : " , "}
					      </c:forEach>
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
				<td align="right" width="100">
						<button type="button" id="btnShowDelete" name="btnShowDelete" class="btn btn-default">예약삭제</button>
				</td>
		   </tr>
		</table>
	</form>
</div>