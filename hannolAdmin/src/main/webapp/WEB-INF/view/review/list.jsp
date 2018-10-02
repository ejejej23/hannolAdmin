<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
   String cp=request.getContextPath();
%>
<script>
$(function(){
	listPage(1);
});

function listPage(page) {
	var url = "<%=cp%>/review/listReview";
	var query = "pageNo=" + page;
	var divId = "listReview";
	ajaxHTML(url, "get", query, divId);
}

function deleteReview(reviewCode) {
	var url = "<%=cp%>/review/delete";
	var query = "reviewCode=" + reviewCode;
	ajaxJSON(url, "get", query);
}

//ajax-json 공통함수
function ajaxJSON(url, type, query) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,dataType:"json"
		,success:function(data) {
			var state=data.state;
			if(state=="true") {
				listPage(1);			
//				var count = data.boardLikeCount;
//				$("#boardLikeCount").text(count);
			} else if(state=="false") {
				$("#msg").text(data.msg);
			}
		}
		,beforeSend : function(jqXHR) {
	        jqXHR.setRequestHeader("AJAX", true);
	    }
	    ,error:function(jqXHR) {
	    	if(jqXHR.status==403) {
	    		login();
	    		return;
	    	}
	    	console.log(jqXHR.responseText);
	    }
	});
}

//ajax-text 공통함수
function ajaxHTML(url, type, query, divId) {
	$.ajax({
		type:type,
		url:url,
		data:query,
		success:function(data){
			if($.trim(data)=="error"){
				alert('잘못된 요청입니다.');
				listPage(1);
				return;
			}
			$("#"+divId).html(data);
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
     <h3>이용 후기</h3> 
   </div> 
     
    <div></div> 

	<div align="center" id="msg"  style="color: red; font-weight: bold;"></div>
	
	<div id="listReview" style="padding: 15px;"></div>
</div>