<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
	
	.storageCount_box{margin:20px 0; padding:15px; text-align:center; background-color:#fafafa; border:1px solid #efefef;}
	
	.storage_box{margin:50px auto;}
	.storage_box td{position:relative; width:120px; height:120px; text-align:center; color:#757575; background-color:#ffffff; border:1px solid #ccc; cursor:pointer;}
	.storage_box td:hover{background-color:#f8f8f8; z-index:1;} 
	.storage_box .st_rent{font-weight:600; color:#ffffff; background-color:#676fa2;}
	.storage_box .st_rent:hover{background-color:#636b9d;}
	.storage_box td span{display:block;}
	.storage_num{position:absolute; top:10px; width:100%; font-size:12px;}
	.storage_rant{font-size:13px;}

</style>

<script type="text/javascript">


$(function(){
	
	var themeName = '${themeName}';
	var day = '${day}';
	
	listPage(themeName, day);
});

	function check(){
		var themeName = document.getElementById('theme');
		themeName=themeName.value;
		alert(themeName);

		var day = document.getElementById('day');
		day=day.value;
		alert(day);
		
		listPage(themeName, day);
	};

	function listPage(themeName, day){
		var url = "<%=cp%>/amenity/storage1";
		
		ajaxHTML(url,"post",themeName, day);
	};
	
	function ajaxHTML(url, type, themeName, day){
		$.ajax({
			type:type,
			url:url,
			data:{themeName:themeName,day:day},
			success:function(data){
				if($.trim(data)=="error"){
					listPage("프린세스빌리지","에러");
					alert("에러남");
					return;
				}
				$("#showlayout").html(data);
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
	
	function back(){
		
		
	}

</script>

<div class="sub-container">
	<div class="sub-title">
		<h3>보관함</h3>
	</div>
	
	<div class="sub_contents">
		<div>
			테마존 :
			<select class="selectField" name="theme" id="theme">
				<option value="프린세스빌리지">프린세스빌리지</option>
				<option value="토이스토리">토이스토리</option>
				<option value="라이온킹">라이온킹</option>
				<option value="미니언즈">미니언즈</option>
				<option value="니모">니모</option>
			</select>
			<select class="selectField" name="day" id="day">
				<option value="종일">종일</option>
				<option value="오후">오후</option>
			</select>
			<button class="btn" onclick="check();">조회</button>
		</div>
		
		<div id="showlayout"></div>
		
			<button class="btn" onclick="back();">반납하기</button>
	</div>
</div>