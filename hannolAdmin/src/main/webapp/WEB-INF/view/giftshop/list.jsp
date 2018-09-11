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
	float: left;
}

.col-xs-offset-2{
	margin: 15px 0px;
}

.btn-created{
	margin: 0px 15px;
	float: right;
}
</style>

<script>
var query="";

$(function(){
	query="${query}";
});

function searchList() {
	var f=document.searchForm;
	f.submit();
}

function orderList(){
	var orderList = $('.gitf-form-control option:selected').val();
	var data ="order="+orderList;
	var url = "<%=cp%>/giftshop/list"
	if(query!=''){
		data+="&"+query;
	}
	
	$.ajax({
		type:"post"
		,url:url
		,data: data
		,success:function(data) {
			
		}
	    ,error:function(e) {
	    	console.log(e.responseText);
	    }
	});
}

</script>

<div class="sub-container" style="width: 960px;">
	<div class="sub-title">
		<h3>기프트샵 상품관리 <small>${dataCount}개 (${page}/${total_page})</small></h3>
	</div>
	
	<div style="height: 30px;">
  		<form name="searchForm" method="post" action="<%=cp%>/giftshop/list">
          	<div class="col-xs-8 col-xs-offset-2">
			  		<div class="input-group">
			            <input type="hidden" name="searchKey" value="goodsName">         
			            <input type="text" style="height:30px;" class="form-control" name="searchValue" placeholder="검색할 키워드를 입력해 주세요...">
			            <span class="input-group-btn">
			                <button class="btn btn-default btn-info" type="button" onclick="searchList()"><span class="glyphicon glyphicon-search"></span></button>
			            </span>
			        </div>
			</div>
		</form>
		
		<div class="giftSelect">
			<div class="itemSelect">
				<select class="form-control gitf-form-control" onchange="orderList();">
					<option value="">↑↓정렬</option>
					<option value="minPrice">가격낮은순</option>
					<option value="maxPrice">가격높은순</option>
					<option value="likeGoods">인기상품순</option>
					<option value="newGoods">신상품순</option>
				</select>
			</div>
		</div>
  	</div>

	<div class="giftList">
		

		<c:forEach items="${list}" var="dto">
			<div style="width: 100%;">
				<div class="col-lg-4">
					<div class="thumbnail">
						<a href="${articleUrl}&goodsCode=${dto.goodsCode}"> 
						<c:if test="${not empty dto.saveFileName}">
							<img src="<%=cp%>/uploads/giftShopGoods/${dto.saveFileName.get(0)}" onerror="this.src='<%=cp%>/resource/images/noimage.png'" style="height:250px;">
						</c:if>
						<c:if test="${empty dto.saveFileName}">
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

	<div style="width: 100%; text-align: center; margin: 35px auto;">${paging}</div>
	
	<div>
		<button type="button" class="btn btn-Default btn-refresh" onclick="javascript:location.href='<%=cp%>/giftshop/list'">새로고침</button>
		<button type="button" class="btn btn-Default btn-created" onclick="javascript:location.href='<%=cp%>/giftshop/created'">등록하기</button>
	</div>
</div>








