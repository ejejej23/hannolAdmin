<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<%
// 여기서 값 안넘어 오면 에러~~~~~~~~~!!! 조심조심~~~!!
	Integer seatCount = (Integer)request.getAttribute("seatCount");
	List<Integer> sList = (List<Integer>)request.getAttribute("seatList");

	boolean[] seatList = new boolean[seatCount+1];
	for (int i = 1; i < seatList.length; i++) {
		seatList[i] = true;
	}
	
	if(sList != null) {
		for(Integer i : sList) {
			seatList[i] = false;
		}
	}
%>
<style>
.seat{
	cursor:pointer;
}
.noSelectSeat{
	cursor: no-drop;
	background-color: #69789d;
}
.selectedSeat{
	background-color: #550adf;
	color: white;
	cursor:pointer;
}
input {
	border: none;
	text-align: center;
}
</style>

<div style="margin: 60px auto; width: 600px; background-color: #dfe5f3; text-align: center;"><strong>stage</strong></div>
<div style="margin: -40px auto; width: 600px; height: 200px;">

	<form action="" name="seatForm" method="post">
		<table style="width: 100%; border-spacing: 1; border-collapse: collapse;">
			<%
				int row = 0;
				row = seatCount / 15 + 1;
				int k = 1; // 진짜 열
				
				jump:
				for (int i = 1; i <= row; i++) {
					out.print("<tr height='30' align='center' bgcolor='#dfe5f3'>");
					for (int col = 1; col < 18; col++) {
						if (col % 6 == 0) {
							out.print("<td width='30' bgcolor='gray'>&nbsp;</td>");
						} else {
							if (seatList[k] == false) {
								out.print("<td width='30'>" + "<input type=text name='seat' id='"+  k + "' readonly='readonly' class='noSelectSeat' size='2' value='" + k + "'></div></td>");
							} else {
								out.print("<td width='30'><input type=text name='seat' id='" + k + "' readonly='readonly' class='seat' size='2' value='" + k + "'></div></td>");
							}
							
							if(k == seatCount) {
								out.print("</tr>");
								break jump;
							}
							k++;
						}
					}
					out.print("</tr>");
				}
			%>
		</table>
	</form>
	
</div>

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