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
	ajaxHTML(url, "get", query, "tab-content");
}


$(function(){
	$(document).on("change","select[name=showName]", function(){
		// 제거
		$("select[name=screenDate] option").remove();
		$("select[name=startTime] option").remove();
		
		var showInfoCode = $(this).val();
		if(showInfoCode == 0) {
			return;
		}
		var url = "<%=cp%>/reservation/show/screenDate";
		var type = "get";
		var query = "showInfoCode=" + showInfoCode;
		ajaxJSON(url, type, query);
	});

	$(document).on("change","select[name=screenDate]", function(){
		// 제거
		$("select[name=startTime] option").remove();
		
		var schCode = $(this).val();
		if(schCode == 0) {
			return;
		}
		var url = "<%=cp%>/reservation/show/startTime";
		var type = "get";
		var query = "schCode=" + schCode;
		ajaxJSON(url, type, query);
	});
	
	
});

var arr = [];	// SCHCODE, SCREENDATE - 선택 가능한 날짜

/* function selectableDays(date) { 
	var ymd = dateToString(date);

    if ($.inArray(ymd, arr) >= -1) {
        return [true,"",""];
    } else {
        return [false,"",""];
    }
}  
 */
 
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
 
//ajax-json 공통함수
function ajaxJSON(url, type, query) {
	$.ajax({
		type:type
		,url:url
		,data:query
		,dataType:"json"
		,success : function(data) {
			var state=data.state;
			if(state=="screenDatetrue") {
				arr = data.list;
//				var dataArr = [];
				for(var i = 0; i < arr.length; i++) {
//					dataArr.push(arr[i].SCREENDATE);
					var $option = $("<option value=" + arr[i].SCHCODE + ">" + arr[i].SCREENDATE + "</option>");
					$("select[name=screenDate]").append($option);
				}				
				
				//검색 시작날짜
				<%-- $("input[name=searchStartDate]").datepicker({
					showOn:"button",
			        buttonImage:"<%=cp%>/resource/images/date24.png",
			        buttonImageOnly:true,
			        showAnim:"slideDown",
			        buttonText:"선택",
					dateFormat:'yy-mm-dd',
			        beforeShowDay: selectableDays
				}); --%> 
			} else if(state=="startTimetrue") {
				var stArr = data.list;
				for(var i = 0; i < stArr.length; i++) {
					var $option = $("<option value=" + stArr[i].SSTARTCODE + ">" + stArr[i].STARTTIME + "</option>");
					$("select[name=startTime]").append($option);
				}				
			} else if(state=="false") {
				alert(data.msg);
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

function searchList() {
	var f = document.searchForm;
	
	var showInfoCode = f.showName.value;
	if(showInfoCode == 0 || !showInfoCode) {
		alert('공연을 선택하세요');
		return;
	}
	
	var schCode = f.screenDate.value;
	if(schCode == 0 || !schCode) {
		alert('날짜를 선택하세요'); 
		return;
	}
	
	var sStartCode = f.startTime.value;
	if(sStartCode == 0 || !sStartCode) {
		alert('시간을 선택하세요');
		return;
	}
	
	
	var screenDate = $("select[name=screenDate] option:selected").text();
	var startTime = $("select[name=startTime] option:selected").text();
	
	var url = "<%=cp%>/reservation/reservationList";
	var type = "get";
	var query = "showInfoCode=" + showInfoCode + "&screenDate=" + screenDate + "&startTime=" + startTime + "&sStartCode=" + sStartCode;
	var divId = "reservationList";
	
	ajaxHTML(url, type, query, divId);
}

//전체 체크박스
function checkAll(){
	if($("#chkAll").is(':checked')){      
		$("input[name=chk]").not(':disabled').prop("checked",true);
	}else{
		$("input[name=chk]").not(':disabled').prop("checked",false);
	}  
}

// 무대 공연 - 예약 취소
$(function(){
	$(document).on("click","button[name=btnShowDelete]", function(){
		
		var showBookCode = new Array();
		$("input[name='chk']:checked").each(function(i){   //jQuery로 for문 돌면서 check 된값 배열에 담는다
			showBookCode.push($(this).attr('data-showBookCode'));
		});
		
		if(showBookCode.length == 0){
			$("#resultLayout").html("삭제할 예약정보를 선택해주세요");
			return;
		}
		
		// check 된 애들의 개수
	 	var url="<%=cp%>/reservation/deleteShow";
		var query = {"showBookCode":showBookCode};

		$.ajax({
			type:"post"
			,url:url
			,data:query
			,dataType:"json"
			,success:function(data) {
				var state=data.state;
				if(state=="true") {		
					alert('예약이 취소되었습니다.');
					location.reload();
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
	});
});
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