<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div class="sub-container" style="width: 960px;">
	<div class="sub-title">
		<h3>어트랙션 상세정보</h3>
	</div>

	<div>
		<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			
			<tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
				<td width="100" bgcolor="#eeeeee" style="text-align: center;">어트랙션명</td>
				<td style="padding-left: 10px;">${dto.name}</td>
			</tr>


			<tr align="left" height="40"
				style="border-bottom: 1px solid #cccccc;">
				<td width="100" bgcolor="#eeeeee" style="text-align: center;">탑승시간</td>
				<td style="padding-left: 10px;">${dto.boardingTime}</td>
			</tr>

			<tr align="left" height="40"
				style="border-bottom: 1px solid #cccccc;">
				<td width="100" bgcolor="#eeeeee" style="text-align: center;">탑승인원</td>
				<td style="padding-left: 10px;">${dto.passengers}</td>
			</tr>
			
			<tr align="left" height="40"
				style="border-bottom: 1px solid #cccccc;">
				<td width="100" bgcolor="#eeeeee" style="text-align: center;">키 제한</td>
				<td style="padding-left: 10px;">${dto.minHeight}~${dto.maxHeight}</td>
			</tr>

			<tr align="left" height="40"
				style="border-bottom: 1px solid #cccccc;">
				<td width="100" bgcolor="#eeeeee" style="text-align: center;">제한조건</td>
				<td style="padding-left: 10px;">${dto.limit}</td>
			</tr>
			
			<tr align="left" height="40"
				style="border-bottom: 1px solid #cccccc;">
				<td width="100" bgcolor="#eeeeee" style="text-align: center;">혼잡도</td>
				<td style="padding-left: 10px;">${dto.congestion}</td>
			</tr>
			
			<tr align="left" height="40"
				style="border-bottom: 1px solid #cccccc;">
				<td width="100" bgcolor="#eeeeee" style="text-align: center;">장르</td>
				<td style="padding-left: 10px;">${dto.genreName}</td>
			</tr>
			
			<tr align="left" height="40"
				style="border-bottom: 1px solid #cccccc;">
				<td width="100" bgcolor="#eeeeee" style="text-align: center;">시설상세</td>
				<td style="padding-left: 10px;">${dto.ridesInfoCode}</td>
			</tr>
		</table>

		<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
			<tr height="45">
			    <td width="300" align="left">
			          <button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/rides/update?facilityCode=${dto.facilityCode}';">수정</button>
			    </td>
			
			    <td align="right">
			        <button type="button" class="btn btn-info" onclick="javascript:location.href='<%=cp%>/rides/list?';">리스트</button>
			    </td>
			</tr>
			</table>
	</div>
</div>	   