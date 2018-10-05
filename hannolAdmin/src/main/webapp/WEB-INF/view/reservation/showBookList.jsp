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

<div>
	<form name="searchForm" id="bookForm">
		
		<table style="width: 100%; margin: 30px auto; border-spacing: 0px;">
				<tr>
					<th>공연</th> 
					<td>
						<select name="showName" class="selectField">
							<option value="0">:::선택:::</option>
							<c:forEach items="${showList}" var="dto">
								<option value="${dto.showInfoCode}">${dto.showName}</option>
							</c:forEach>
						</select>  
					</td>  
				</tr>
				<tr height="40">
					<th>날짜</th>
					<td>
<%-- 						<span class="datepickerBox">
							<input type="text" name="searchStartDate" class="boxTF datepicker" readonly="readonly" value="${searchStartDate}"></span>  --%>
						<select name="screenDate" class="selectField">
							<option value="0">:::선택:::</option>
						</select>  
 					</td>  
				</tr>
				<tr>
					<th>시간</th> 
					<td>
						<select name="startTime" class="selectField">
							<option value="0">:::선택:::</option>
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
	
		<div id="reservationList"></div>

	</form>
</div>