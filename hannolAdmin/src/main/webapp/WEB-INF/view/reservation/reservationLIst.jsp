<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<div>
	<form name="bookForm" id="bookForm">
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
				      <th scope="row">${dto.showBookCode}</th>
				      <td>${dto.bookDate}</td>
				      <td>${dto.memberName}</td>
				      <td>${dto.tel}</td>
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
				        <c:if test="${dataCount==0 }">등록된 예약이 없습니다.</c:if>
				   		<c:if test="${dataCount!=0 }">${paging}</c:if>
				</td>
				<td align="right" width="100">
						<button type="button" id="btnShowDelete" name="btnShowDelete" class="btn btn-default">예약삭제</button>
				</td>
		   </tr>
		</table>
	</form>
		
</div>