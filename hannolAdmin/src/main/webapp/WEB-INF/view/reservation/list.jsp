<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<link rel="stylesheet" href="<%=cp%>/resource/css/tabs.css" type="text/css">
<style>
.alert-info {
    border: 1px solid #9acfea;
    border-radius: 4px;
    background-color: #d9edf7;
    color: #31708f;
    padding: 15px;
    margin-top: 10px;
    margin-bottom: 20px;
}
.gitf-form-control{
   background: url(<%=cp%>/resource/images/item_list.png) no-repeat right 2px;
}
.col-xs-8:after{
   content:''; display:block; clear:both;
}

.col-xs-offset-2{
   width: 40%;
}

.col-xs-8{
    float: none;
    margin: 10px auto;
}
</style>
<script>
$(function(){
	
	var pageNo = ${pageNo};
	
	$("#tab-${tab}").addClass("active");
	listPage(pageNo);
	
	$("ul.tabs li").click(function() {
		var tab = $(this).attr("data-tab");
		
		$("ul.tabs li").each(function() {
			$(this).removeClass("active");
		});
		
		$("#tab-"+tab).addClass("active");
		listPage(1);
	});
	
});

function listPage(page) {
	var $tab = $(".tabs .active");
	var tab = $tab.attr("data-tab");
	var url = "<%=cp%>/reservation/" + tab + "/list";
	
	var query = "pageNo="+page+"&tab="+tab;
	var search = $("form[name=searchForm]").serialize();
	query += "&" + search;
	ajaxHTML(url, "get", query);
}

//ajax 공통함수
function ajaxHTML(url, type, query) {
	$.ajax({
		type:type,
		url:url,
		data:query,
		success:function(data){
			if($.trim(data)=="error"){
				listPage(1);
				return;
			}
			$("#tab-content").html(data);
		},
		beforeSend:function(jqXHR){
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR){
			if(jqXHR.status==403){
				location.href="<%=cp%>/member/login";
				return;
			}
			console.log(jqXHR.responseText);
		}
	});
}
</script>


<div class="sub-container" style="width: 960px;">
    <div class="sub-title">
	  <h3>예약관리</h3>
	</div> 
	
	<div>
		<ul class="tabs">
		  <li id="tab-show" data-tab="show" class="nav-item active">
		    <a class="nav-link">무대공연</a>
		  </li>
		  <li id="tab-facility" data-tab="facility" class="nav-item">
		    <a class="nav-link">편의시설</a>
		  </li>
		</ul>
		
		 <div id="tab-content" style="clear:both; padding: 20px 10px 0px;"></div>
    
    </div>
</div>