<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script type="text/javascript">
var gubun = "${gubun}";
var page = "${page}";

$(function(){
	$('.nav-item').removeClass('active');
	$(".nav-item").each(function(){
		if( $(this).attr("data-gubun") == gubun){
			$(this).addClass("active");
			return;
		}
	});
	
	listPage("${page}");
	
	$(".nav-link").click(function(){
		$('.nav-item').removeClass('active');
		$(this).parent(".nav-item").addClass("active");
		
		gubun = $(this).parent(".nav-item").data("gubun"); 
		
		listPage(1);
	});
});

$(function(){
	$("input:checkbox[id='sortCheck']").click(function(){
		listPage(page);
	});
});

function listPage(pagep){	
	page = pagep;
	
	var url = "<%=cp%>/payment/ajaxList";
	var data = "page="+page;
	
	data+="&gubun="+gubun;
	
	if($("input:checkbox[id='sortCheck']").is(":checked")){
		data+="&sortCheck=1";
	}else{
		data+="&sortCheck=0";
	}
	
	$.ajax({
		type:"GET"
		,url:url
		,data: data
		,success:function(data) {
			$(".questionList").html(data);			
		}
	    ,error:function(e) {
	    	console.log(e.responseText);
	    }
	});
}
</script>


<div class="sub-container" style="width: 960px;">
    <div class="sub-title">
	  <h3>1:1문의</h3>
	</div> 
	
	<input type="checkbox" id="sortCheck" name="sortCheck" style="vertical-align: middle;"><label style="margin-left: 3px;">답변 없는 글만 보기</label>
	
	<div>
		<ul class="nav nav-tabs">
		  <li class="nav-item active" data-gubun="요금 문의">
		    <a class="nav-link">요금 문의</a>
		  </li>
		  <li class="nav-item" data-gubun="제휴 할인">
		    <a class="nav-link">제휴 할인</a>
		  </li>
		  <li class="nav-item" data-gubun="온라인 예매">
		    <a class="nav-link">온라인 예매</a>
		  </li>
		  <li class="nav-item" data-gubun="연간 회원">
		    <a class="nav-link">연간 회원</a>
		  </li>
		  <li class="nav-item" data-gubun="예약 문의">
		    <a class="nav-link">예약 문의</a>
		  </li>
		  <li class="nav-item" data-gubun="기타 문의">
		    <a class="nav-link">기타 문의</a>
		  </li>
		</ul>
    </div>
    
    <div class="questionList" style="width: 100%;">
    </div>
</div>