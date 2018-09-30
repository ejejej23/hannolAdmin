<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
.col-xs-offset-2{
	margin-left: 0px;
}

.col-xs-8{
	width: 700px;
	padding: 0px;
	margin-bottom: 10px;
	margin-left: 10px;
}

.div-menu{
	float: left;
}

.select-menu{
	width : 130px;
	padding: 8px;
	border-radius: 5px;
}
</style>
<script>
$(function(){
	//선택한 Tab으로 셋팅
	var tab = "${tab}";
	if(tab != ""){
		$('.nav-item').removeClass('active');
		$(".nav-link").each(function(){
			if($(this).attr("data-tab") == tab){
				$(this).parent(".nav-item").addClass("active");
			}
		});
	}
	
	//검색한 key, value 셋팅
	var searchKey = "${searchKey}";
	$(".select-menu option").each(function(){
		if($(this).val()==searchKey){
			$(this).attr("selected", true);
		}
	});
	
	//page
	var page = "${page}";
	
	//body 그리기
	listPage(page);
});


$(function(){
	//탭선택 EVENT
	$(".nav-link").click(function(){
		$('.nav-item').removeClass('active');
		$(this).parent(".nav-item").addClass("active");
		
		$(".select-menu").val("attrctn");
		$("#searchValue").val("");
		
		listPage(1);
	});
});


//검색EVENT
function searchList(){
	//선택한 Tab 값 알아오기
	var tab = "";
	$(".nav-link").each(function(){
		if($(this).parent(".nav-item").hasClass("active")){
			tab = $(this).attr("data-tab");
		}
	});
	
	//hidden으로 같이 보냄
	$("#input-tab").val(tab);
	
	var f = document.searchForm;
	f.submit();
}

function listPage(page){
	var data = "page="+page;
	
	//tab 확인
	var tab = "";
	$(".nav-link").each(function(){
		if($(this).parent(".nav-item").hasClass("active")){
			tab = $(this).attr("data-tab");
		}
	});
	data+="&tab="+tab;
	
	//searchKey, searchValue 확인
	var searchKey = $("#searchKey").val();
	var searchValue = $("#searchValue").val();
	if(searchValue != ""){
		data+="&searchKey="+searchKey+"&searchValue="+searchValue;
	}
	
	var url = "<%=cp%>/magicpass/ajaxList"
	
	$.ajax({
		type:"POST"
		,url:url
		,data: data
		,success:function(data) {
			$(".content-body").html(data);		
		}
	    ,error:function(e) {
	    	console.log(e.responseText);
	    }
	});
}
</script>


<div class="sub-container" style="width: 960px;">
    <div class="sub-title">
	  <h3>매직패스 예약관리</h3>
	</div>
	
	<div>
		<ul class="nav nav-tabs">
		  <li class="nav-item">
		    <a class="nav-link" data-tab="all">전체</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" data-tab="mini">미니언즈</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" data-tab="prince">프린세스빌리지</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" data-tab="lion">라이언킹</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" data-tab="nimo">니모</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" data-tab="toy">토이스토리</a>
		  </li>
		</ul>
    </div>
    
    <div style="margin-top: 15px;">
	    <form name="searchForm" method="post" action="<%=cp%>/magicpass/list">
	    	<div class="div-menu">
	   			<select class="select-menu" name="searchKey" id="searchKey">
	   				<option value="attrctn">어트랙션명</option>
	   				<option value="ticketCode">티켓코드</option>
	   				<option value="reserveCode">사용자코드</option>
	   			</select>
	   		</div>
	    	<div class="col-xs-8 col-xs-offset-2">
		  		<div class="input-group">      
		            <input type="text" style="height:34px;" class="form-control" name="searchValue" id="searchValue" placeholder="검색할 키워드를 입력해 주세요..." value="${searchValue}">
		            <span class="input-group-btn">
		                <button class="btn btn-default btn-info" type="button" onclick="searchList()"><span class="glyphicon glyphicon-search"></span></button>
		                <input type="hidden" name="tab" id="input-tab">
		            </span>
		        </div>
			</div>
		</form>
    </div>
    
    <div class="content-body">
    </div>
</div>