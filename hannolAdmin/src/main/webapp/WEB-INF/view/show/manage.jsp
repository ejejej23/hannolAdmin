<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
   String cp=request.getContextPath();
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
<script type="text/javascript">
$(function() {
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
	var gubunCode = $tab.attr("data-gubuncode");
	var url = "<%=cp%>/show/" + gubunCode + "/list";
	
	var query = "pageNo="+page+"&tab="+tab;
	var search = $("form[name=searchForm]").serialize();
	query += "&" + search;
	ajaxHTML(url, "get", query);
}

// ajax 공통함수
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

function insertShowInfo() {
	var checked = $("input[name=showRadio]:checked");
	if(!checked.val()) {
		alert('공연을 선택하세요');
		return;
	}
	
	var showCode = checked.attr("data-showCode");
	
	var url = '<%=cp%>/show/article?showCode=' + showCode;
	location.href = url;
}
</script>


<div class="sub-container" style="width: 960px;">
   
   <div class="sub-title">
     <h3>공연 리스트</h3> 
   </div> 
   
     <div>
        <form name="searchForm" method="post" action="<%=cp%>/">
             <div class="col-xs-8 col-xs-offset-2" style="width: 100%">
              <div class="input-group" style="width:70%; float: left;">
                 <div style="float: left;">
                     <select name="searchKey" class="selectField" style="height:30px;">
                           <option value="all">전체</option>
                           <option value="experience">체험</option>
                           <option value="parade">퍼레이드</option>
                           <option value="stage">무대공연</option>
                     </select>
                 </div> 
                 <div style="float: left;">&nbsp;</div> 
                 <div style="margin-left: 10px;">
                     <input type="text" style="height:30px; width: 50%" class="form-control" name="searchValue" placeholder="검색할 공연명를 입력해 주세요">
                     <span class="input-group-btn">
                         <button class="btn btn-default btn-info" type="button" onclick="searchList()"><span class="glyphicon glyphicon-search"></span></button>
                     </span>
                 </div>         
             </div>
             <div align="right" style="float: left; width: 30%">
                <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/show/list';">돌아가기</button>
                <c:if test="${sessionScope.staff.authority == 'ROLE_ADMIN'}">
	                <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/show/created';">공연 등록</button>
                </c:if>
             </div>
         </div>
      </form>
     </div>
     
   <div>
       <div style="clear: both;">
           <ul class="tabs">
		       <li id="tab-all" data-tab="all" data-gubuncode="0">전체</li>
		       <li id="tab-experience" data-tab="experience" data-gubuncode="1">체험</li>
		       <li id="tab-parade" data-tab="parade" data-gubuncode="2">퍼레이드</li>
		       <li id="tab-stage" data-tab="stage" data-gubuncode="3">무대공연</li>
		   </ul>
	   </div>
	   <div id="tab-content" style="clear:both; padding: 20px 10px 0px;"></div>
    </div>
   
   <table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
		<tr height="40">
			<td align="left" width="100">
				<button type="button" class="btn"
					onclick="javascript:location.href='<%=cp%>/show/manage';">새로고침</button>
			</td>

			<td align="right" width="100">
				<button type="button" class="btn" onclick="insertShowInfo();">상세정보 등록</button>
			</td>
		</tr>
	</table>
   
</div>