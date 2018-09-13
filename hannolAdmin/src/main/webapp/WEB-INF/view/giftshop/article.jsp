<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<div class="sub-container" style="width: 960px;">
	<div class="sub-title">
		<h3>상품상세정보</h3>
	</div>

	<div>

		<table
			style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			<tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;">
				<td width="100" bgcolor="#eeeeee" style="text-align: center;">상품명</td>
				<td style="padding-left: 10px;">미니언즈는 팝콘이지</td>
			</tr>

			<tr align="left" height="40"
				style="border-bottom: 1px solid #cccccc;">
				<td width="100" bgcolor="#eeeeee" style="text-align: center;">상품가격</td>
				<td style="padding-left: 10px;">40,000원</td>
			</tr>

			<tr align="left" height="40"
				style="border-bottom: 1px solid #cccccc;">
				<td width="100" bgcolor="#eeeeee" style="text-align: center;">상태</td>
				<td style="padding-left: 10px;">사용중</td>
			</tr>

			<tr align="left" height="40"
				style="border-bottom: 1px solid #cccccc;">
				<td width="100" bgcolor="#eeeeee" style="text-align: center;">구분</td>
				<td style="padding-left: 10px;">구분명</td>
			</tr>

			<tr align="left" height="40"
				style="border-bottom: 1px solid #cccccc;">
				<td width="100" bgcolor="#eeeeee" style="text-align: center;">썸네일사진</td>
				<td style="padding-left: 10px;">
					<img alt="" src="<%=cp%>/uploads/giftShopGoods/noimage.png" onerror="this.src='<%=cp%>/resource/images/noimage.png'">
				</td>
			</tr>

			<tr align="left" style="border-bottom: 1px solid #cccccc;">
				<td width="100" bgcolor="#eeeeee"
					style="text-align: center; padding-top: 5px;" valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
				<td valign="top" style="padding: 5px 0px 5px 10px;">상세내용</td>
			</tr>
		</table>

		<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
			<tr height="45">
			    <td width="300" align="left">
			          <button type="button" class="btn" onclick="updateBoard();">수정</button>
			          <button type="button" class="btn" onclick="deleteBoard();">삭제</button>
			    </td>
			
			    <td align="right">
			        <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/giftshop/list?${dataQuery}';">리스트</button>
			    </td>
			</tr>
			</table>
	</div>
</div>