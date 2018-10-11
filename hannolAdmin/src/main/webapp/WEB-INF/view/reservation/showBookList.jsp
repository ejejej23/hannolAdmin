<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style>
	/*search*/
	.datepickerBox{display:inline-block;}
	.datepickerBox .datepicker{width:150px;}   
	.datepicker + img{width:22px; margin:0px 0px 0px -31px; padding-left:8px; border-left:1px solid #dddddd; cursor:pointer;}

</style>
<script>
$(function(){
	listPage(1);
});

function listPage(page) {
	var url = "<%=cp%>/reservation/show/list";
	
	var search = $("form[name=searchForm]").serialize();
	var query = search;
	ajaxHTML(url, "get", query, "tab-content");
}

var $sOption = $("<option value='0'>:::선택:::</option>");

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
//	var $sOption = $("<option value="0">:::선택:::</option>");
	
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
				
				$("select[name=screenDate]").append($sOption);
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
				$("select[name=startTime]").append($sOption);
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
	  <h3>공연 예약관리</h3>
	</div> 
		
		<div>
			<form name="searchForm" id="bookForm">
				
				<table style="width: 100%; margin: 30px auto; border-spacing: 0px;">
						<tr>
							<th>공연</th> 
							<td>
								<select name="showName" class="selectField">
									<option value="0">:::선택:::</option>
									<c:forEach items="${showList}" var="dto">
										<option value="${dto.showInfoCode}">${dto.showName}</option>
									</c:forEach>
								</select>  
							</td>  
						</tr>
						<tr height="40">
							<th>날짜</th>
							<td>
		<%-- 						<span class="datepickerBox">
									<input type="text" name="searchStartDate" class="boxTF datepicker" readonly="readonly" value="${searchStartDate}"></span>  --%>
								<select name="screenDate" class="selectField">
									<option value="0">:::선택:::</option>
								</select>  
		 					</td>  
						</tr>
						<tr>
							<th>시간</th> 
							<td>
								<select name="startTime" class="selectField">
									<option value="0">:::선택:::</option>
								</select>  
							</td>  
						</tr>
						<tr>
							<th>
							</th>
							<td>
								<button type="button" class="btn btn-default" onclick="searchList()" style="margin-top: 11px; margin-left:50px;">검색</button>
							</td>
						</tr>
					</table>
			
				<div id="reservationList"></div>
		
			</form>
		</div>
</div>