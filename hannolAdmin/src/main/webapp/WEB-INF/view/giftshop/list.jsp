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
var dataQuery ="";
$(function(){
	listPage(1, "");
});

function searchList() {
	var searchValue = $("#searchValue").val();
	dataQuery = "searchKey=goodsName&searchValue="+encodeURIComponent(searchValue);
	
	$('.gitf-form-control option:eq(0)').attr("selected", "selected");
	listPage(1, dataQuery);
}

function orderList(){
	var orderList = $('.gitf-form-control option:selected').val();
	
	if(dataQuery != ''){
		if(dataQuery.indexOf("order=") == -1){
			dataQuery=dataQuery+"&order="+orderList;
		}else{
			var index = dataQuery.indexOf("order=");
			if(index == 0){
				dataQuery="order="+orderList;
			}else{
				var str = dataQuery.substring(0,index).trim();
				dataQuery=str+"&order="+orderList;
			}
		}
	}else{
		dataQuery="order="+orderList;
	}
	
	listPage(1, dataQuery);
	
}

function listPage(page, query){
	if (query === undefined || query === null) {
		query = dataQuery;
	}
	console.log(query);
	
	var url = "<%=cp%>/giftshop/aJaxList"
	var data = "page="+page;
	
	if(query!=''){
		data+="&"+query;
	}
	
	
	$.ajax({
		type:"GET"
		,url:url
		,data: data
		,success:function(data) {
			$(".giftList").html(data);			
			
		}
	    ,error:function(e) {
	    	console.log(e.responseText);
	    }
	});
}

</script>

<div class="sub-container" style="width: 960px;">
	<div class="sub-title">
		<h3>기프트샵 상품관리</h3>
	</div>
	
	<div style="height: 30px;">
          	<div class="col-xs-8 col-xs-offset-2">
			  		<div class="input-group">      
			            <input type="text" style="height:30px;" class="form-control" name="searchValue" id="searchValue" placeholder="검색할 키워드를 입력해 주세요..." value="${searchValue}">
			            <span class="input-group-btn">
			                <button class="btn btn-default btn-info" type="button" onclick="searchList()"><span class="glyphicon glyphicon-search"></span></button>
			            </span>
			        </div>
			</div>
		
		<div class="giftSelect">
			<div class="itemSelect">
				<select class="form-control gitf-form-control" onchange="orderList();">
					<option value="newGoods" selected="selected">신상품순</option>
					<option value="minPrice">가격낮은순</option>
					<option value="maxPrice">가격높은순</option>
					<option value="likeGoods">인기상품순</option>
				</select>
			</div>
		</div>
  	</div>

	<div class="giftList">

	</div>
	<div style="margin-left : 15px;">
		<button type="button" class="btn btn-default btn-refresh" onclick="javascript:location.href='<%=cp%>/giftshop/list'">새로고침</button>
		<button type="button" class="btn btn-info btn-created" onclick="javascript:location.href='<%=cp%>/giftshop/created'">등록하기</button>
	</div>
</div>








