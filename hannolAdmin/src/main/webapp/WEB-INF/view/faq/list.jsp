<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script>
$(function(){
	//탭선택 EVENT
	$(".nav-link").click(function(){
		$('.nav-item').removeClass('active');
		$(this).parent(".nav-item").addClass("active");
		
		$(".select-menu").val("attrctn");
		$("#searchValue").val("");
		
		listPage(1);
	});
	
	var msg = "${msg}";
	if(msg != ""){
		alert(msg);
	}
});

$(function(){
	//선택한 Tab으로 셋팅
	var tab = "${tab}";
	if(tab != ""){
		$('.nav-item').removeClass('active');
		$(".nav-link").each(function(){
			if($(this).attr("data-gubun") == tab){
				$(this).parent(".nav-item").addClass("active");
			}
		});
	}
	
	//page
	var page = "${page}";
	
	//body 그리기
	listPage(page);
});

//검색조건
function searchList(){
	//선택한 Tab 값 알아오기
	var tab = "";
	$(".nav-link").each(function(){
		if($(this).parent(".nav-item").hasClass("active")){
			tab = $(this).attr("data-gubun");
		}
	});
	
	$("#gubun-tab").val(tab);
	
	var f = document.searchForm;
	f.submit();
}

function listPage(page){
	var data = "page="+page;
	
	//tab 확인
	var tab = "";
	$(".nav-link").each(function(){
		if($(this).parent(".nav-item").hasClass("active")){
			tab = $(this).attr("data-gubun");
		}
	});
	data+="&tab="+tab;
	
	//searchValue 확인
	var searchValue = $("#searchValue").val();
	if(searchValue != "" && searchValue !== undefined){
		data+="&searchValue="+searchValue;
	}
	
	var url = "<%=cp%>/faq/ajaxList"
	
	$.ajax({
		type:"POST"
		,url:url
		,data: data
		,success:function(data) {
			$(".content-tb").html(data);		
		}
	    ,error:function(e) {
	    	console.log(e.responseText);
	    }
	});
}
</script>


<div class="sub-container" style="width: 960px;">
    <div class="sub-title">
	  <h3>FAQ</h3>
	</div>
	
	<div>
		<ul class="nav nav-tabs">
		  <li class="nav-item active" >
		    <a class="nav-link" data-gubun="all">전체</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" data-gubun="useinfo">이용정보</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" data-gubun="pre">우대정보</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" data-gubun="event">이벤트</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" data-gubun="years">연간회원</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" data-gubun="online">온라인예매</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" data-gubun="els">기타</a>
		  </li>
		</ul>
    </div>
    
    <div style="margin-top: 15px;">
   	  	<form name="searchForm" method="post" action="<%=cp%>/faq/list">
		    <div class="col-xs-8 col-xs-offset-2">
		  		<div class="input-group">     
		            <input type="text" class="form-control" name="searchValue" id="searchValue" placeholder="검색할 키워드를 입력해 주세요..." value="${searchValue}">
		            <span class="input-group-btn">
		                <button class="btn btn-default btn-info" type="button" onclick="searchList()"><span class="glyphicon glyphicon-search"></span></button>
		                 <input type="hidden" name="tab" id="gubun-tab">
		            </span>
		        </div>
			</div>
		</form>
    </div>
    
    <div class="content-body">
    	<div class="content-tb">
    	</div>
    	<div class="bottom-btn">
    		<button type="button" class="btn btn-default" style="float: left;" onclick="javascript:location.href='<%=cp%>/faq/list'">새로고침</button>
    		<button type="button" class="btn btn-info" style="float: right;" onclick="javascript:location.href='<%=cp%>/faq/created'">등록하기</button>
    	</div>
    	
    </div>
</div>