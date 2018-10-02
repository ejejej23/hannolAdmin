<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
   String cp=request.getContextPath();
%>
<style>
	.datepickerBox{display:inline-block;}
	.datepickerBox .datepicker{width:203px;}   

	.datepicker + img{width:22px; margin:0px 0px 0px -31px; padding-left:8px; border-left:1px solid #dddddd; cursor:pointer;}

</style>


<script>
$(function(){
	listPage(1);
});

//datepicker
$(function(){
	//검색 시작날짜
	$("input[name=searchStartDate]").datepicker({
		dateFormat:'yy-mm-dd',
		showOn:"button",
        buttonImage:"<%=cp%>/resource/images/date24.png",
        buttonImageOnly:true,
        showAnim:"slideDown",
        buttonText:"선택",
        maxDate:0,
        onSelect:function(selected){
        	if(!$("input[name=searchEndDate]").val()){ 
        		$("input[name=searchEndDate]").val(selected);  
        	}
        		
        	$("input[name=searchEndDate]").datepicker("option", "minDate", selected);
        
        }
	}); 
	//검색 마지막 날짜
	$("input[name=searchEndDate]").datepicker({
		dateFormat:'yy-mm-dd',
		showOn:"button",
        buttonImage:"<%=cp%>/resource/images/date24.png",
        buttonImageOnly:true,
        showAnim:"slideDown",
        buttonText:"선택",
        maxDate:0, 
        onSelect:function(selected){
        	if(!$("input[name=searchStartDate]").val()){
        		$("input[name=searchStartDate]").val(selected);
        	}   
        	
        	 //$("input[name=searchEndDate]").datepicker("option", "minDate", selected);
        	 $("input[name=searchStartDate]").datepicker("option", "maxDate", selected); 
        } 
	});	
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

//검색
function searchList(){
	var f = document.searchForm;
	var url = "<%=cp%>/review/listReview"; 
	var divId = "listReview";
	var query = "searchStartDate=" + f.searchStartDate.value + "&searchEndDate=" + f.searchEndDate.value;
	ajaxHTML(url, "post", query, divId);
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
     
    <div>
	    <form name="searchForm" method="post">
			<table style="width: 100%; margin: 30px auto; border-spacing: 0px;">
				<tr height="40">
					<th>날짜</th>
					<td>
						<span class="datepickerBox"><input type="text" name="searchStartDate" class="boxTF datepicker" readonly="readonly" value="${searchStartDate}"></span> ~ 
						<span class="datepickerBox"><input type="text" name="searchEndDate" class="boxTF datepicker" readonly="readonly"  value="${searchEndDate}"></span>
						<button type="button" class="btn btn-default" onclick="searchList()">검색</button>
					</td>  
				</tr>
			</table>
		</form>
    </div> 

	<div align="center" id="msg"  style="color: red; font-weight: bold;"></div>
	
	<div id="listReview" style="padding: 15px;"></div>
</div>