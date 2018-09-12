<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<div style="float:left; margin: 0px 15px; clear: both;">${dataCount}개 (${page}/${total_page})</div>
<div style="clear: both;">
	<c:forEach items="${list}" var="dto">
		<div style="width: 100%;">
			<div class="col-lg-4">
				<div class="thumbnail">
					<a href="${articleUrl}&goodsCode=${dto.goodsCode}"> 
					<c:if test="${not empty dto.thumbnail}">
						<img src="<%=cp%>/uploads/giftShopGoods/${dto.thumbnail}" onerror="this.src='<%=cp%>/resource/images/noimage.png'" style="height:250px;">
					</c:if>
					<c:if test="${empty dto.thumbnail}">
						<img src="<%=cp%>/resource/images/noimage.png" style="height:250px; width: 300px;">
					</c:if>
					 <span class="itemTitle">${dto.goodsName}</span>
					</a>
					<div class="itemPrice"><fmt:formatNumber value="${dto.price}" type="number"/>원</div>
				</div>
			</div>
		</div>
	</c:forEach>
</div>
<div style="width: 100%; text-align: center; margin: 0px auto;">${paging}</div>









