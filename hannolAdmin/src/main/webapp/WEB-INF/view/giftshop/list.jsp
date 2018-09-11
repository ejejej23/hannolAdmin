<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style>
.gitf-form-control{
	width : 250px;
	float: right;
}

.giftSelect{
	height: 30px;
	margin: 15px;
}
</style>

<div class="sub-container" style="width: 960px;">
	<div class="sub-title">
		<h3>기프트샵 상품관리</h3>
	</div>

	<div class="giftList">
		<div class="giftSelect">
			<div class="itemSelect">
				<select class="form-control gitf-form-control">
					<option>↑↓정렬</option>
					<option>가격낮은순</option>
					<option>가격높은순</option>
					<option>인기상품순</option>
					<option>신상품순</option>
				</select>
			</div>
		</div>

		<c:forEach items="${list}" var="dto">
			<div style="width: 100%;">
				<div class="col-lg-4">
					<div class="thumbnail">
						<a href="<%=cp%>/giftshop/article"> 
						<c:if test="${not empty dto.saveFileName}">
							<img src="<%=cp%>/uploads/giftShopGoods/${dto.saveFileName.get(0)}" alt="" style="width: 100%">
						</c:if>
						<c:if test="${empty dto.saveFileName}">
							<img src="<%=cp%>/resource/images/noimage.png" alt="Lights" style="width: 100%">
						</c:if>
						 <span class="itemTitle">${dto.goodsName}</span>
						</a>
						<div class="itemPrice">${dto.price}원</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

	<div style="width: 100%; text-align: center;">123</div>


	<div class="col-xs-8 col-xs-offset-2">
		<div class="input-group">
			<input type="hidden" name="search_param" value="all"
				id="search_param"> <input type="text" class="form-control"
				name="x" placeholder="검색할 키워드를 입력해 주세요..."> <span
				class="input-group-btn">
				<button class="btn btn-default btn-info" type="button">
					<span class="glyphicon glyphicon-search"></span>
				</button>
			</span>
		</div>
	</div>
</div>








