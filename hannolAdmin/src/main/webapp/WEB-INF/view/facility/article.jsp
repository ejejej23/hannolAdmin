<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<div class="sub-container" style="width: 960px;">
	<div class="sub-title">
		<h3>시설 상세정보</h3>
	</div>
		<div>
			<table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
				
				<tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
					<td width="100" bgcolor="#eeeeee" style="text-align: center;">시설구분명</td>
					<td style="padding-left: 10px;">${dto.gubunName}</td>
				</tr>
				
				<tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
					<td width="100" bgcolor="#eeeeee" style="text-align: center;">테마명</td>
					<td style="padding-left: 10px;">${dto.themeName}</td>
				</tr>
	
				<tr align="left" height="40"
					style="border-bottom: 1px solid #cccccc;">
					<td width="100" bgcolor="#eeeeee" style="text-align: center;">시설상태</td>
					<td style="padding-left: 10px;">${dto.state==0?"이용불가":"이용가능"}</td>
				</tr>
	
				<tr align="left" height="40"
					style="border-bottom: 1px solid #cccccc;">
					<td width="100" bgcolor="#eeeeee" style="text-align: center;">설치일</td>
					<td style="padding-left: 10px;">${dto.installDate}</td>
				</tr>
				
				<tr align="left" height="40"
					style="border-bottom: 1px solid #cccccc;">
					<td width="100" bgcolor="#eeeeee" style="text-align: center;">제거일</td>
					<td style="padding-left: 10px;">${dto.removeDate}</td>
				</tr>
	
				<tr align="left" height="40"
					style="border-bottom: 1px solid #cccccc;">
					<td width="100" bgcolor="#eeeeee" style="text-align: center;">시설사진</td>
					<td style="padding-left: 10px;"><img src="<%=cp%>/uploads/facility/${dto.saveMainFilename}" width="70" height="40" style="padding: 1px;"></td>
				</tr>
				
				<tr align="left" height="40"
					style="border-bottom: 1px solid #cccccc;">
					<td width="100" bgcolor="#eeeeee" style="text-align: center;">시설위치사진</td>
					<td style="padding-left: 10px;"><img src="<%=cp%>/uploads/facility/${dto.saveLocFilename}" width="70" height="40" style="padding: 1px;"></td>
				</tr>
				
				<tr align="left" height="40"
					style="border-bottom: 1px solid #cccccc;">
					<td width="100" bgcolor="#eeeeee" style="text-align: center;">설명</td>
					<td style="padding-left: 10px;">${dto.memo}</td>
				</tr>
	
			</table>
	
			<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
				<tr height="45">
				    <td width="300" align="left">
				          <button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/facility/update?page=${page}&facilityCode=${dto.facilityCode}';">수정</button>
				    </td>
				
				    <td align="right">
				        <button type="button" class="btn btn-info" onclick="javascript:location.href='<%=cp%>/facility/list?';">리스트</button>
				    </td>
				</tr>
			</table>
		</div>
</div>	   