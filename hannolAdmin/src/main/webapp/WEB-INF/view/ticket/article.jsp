<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<div class="sub-container" style="width: 960px;">
	<div class="sub-title">
		<h3>이용권 상세정보</h3>
	</div>

	<div>
		<table
			style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			<tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
				<td width="100" bgcolor="#eeeeee" style="text-align: center;">상품명</td>
				<td style="padding-left: 10px;">${dto.goodsName}</td>
			</tr>

			<tr align="left" height="40"
				style="border-bottom: 1px solid #cccccc;">
				<td width="100" bgcolor="#eeeeee" style="text-align: center;">상품가격</td>
				<td style="padding-left: 10px;"><fmt:formatNumber value="${dto.goodsPrice}" type="number"/>원</td>
			</tr>

			<tr align="left" height="40"
				style="border-bottom: 1px solid #cccccc;">
				<td width="100" bgcolor="#eeeeee" style="text-align: center;">상태</td>
				<td style="padding-left: 10px;">${dto.state=='1'? '사용중':'사용안함' }</td>
			</tr>
			
			<tr align="left" height="40"
				style="border-bottom: 1px solid #cccccc;">
				<td width="100" bgcolor="#eeeeee" style="text-align: center;">구분</td>
				<td style="padding-left: 10px;">${dto.gubunName}</td>
			</tr>
		</table>

		<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
			<tr height="45">
			    <td width="300" align="left">
			    <c:if test="${sessionScope.staff.authority == 'ROLE_ADMIN' }">
			          <button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/ticket/update?goodsCode=${dto.goodsCode}';">수정</button>
			    </c:if>
			    </td>
			
			    <td align="right">
			        <button type="button" class="btn btn-info" onclick="javascript:location.href='<%=cp%>/ticket/list?${dataQuery}';">리스트</button>
			    </td>
			</tr>
			</table>
	</div>
</div>