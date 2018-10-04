<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
* {
	margin:0px;
	padding:0px;
}

body {
	font-size: 9pt;
	font-family:돋움;
}	

.search-box, .search-box p{
	display: inline-block;
}

.tit{
	font-size: 14px;
	font-weight: bold;
	vertical-align : middle;
	width: 70px;
}

.datepicker+img {
	width: 22px;
	margin: 0px 0px 0px -31px;
	padding-left: 8px;
	border-left: 1px solid #dddddd;
	cursor: pointer;
}

.datepickerBox {
	display: inline-block;
}

.datepickerBox input[name=startDate] {
	margin: 0px 0px 0px 10px;
}

.datepickerBox .datepicker {
	width: 203px;
}

.boxTF[readonly] {
	background-color: #ffffff;
}

.select-search{
	padding: 5px 5px 7px;
	width : 150px;
}
</style>

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/highchart/highcharts.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/highchart/highcharts-3d.js"></script>
<script>

//datepicker
$(function(){
	//시작날짜
	$("input[name=searchStartDate]").datepicker({
		dateFormat:'yy-mm-dd',
		showOn:"both",
	    buttonImage:"<%=cp%>/resource/images/date24.png",
	    buttonImageOnly:true,
	    showAnim:"slideDown",
	    buttonText:"선택",
	    maxDate:0,
	    onSelect:function(selected){
	    	$("input[name=searchEndDate]").datepicker('option', 'minDate', new Date(selected));
	    }
	}); 

	//마지막 날짜
	$("input[name=searchEndDate]").datepicker({
		dateFormat:'yy-mm-dd',
		showOn:"both",
	    buttonImage:"<%=cp%>/resource/images/date24.png",
		buttonImageOnly : true,
		showAnim : "slideDown",
		buttonText : "선택",
		maxDate : 0,
		onSelect : function(selected) {

		}
	});
});

$(function(){
	$(".search-thema").change(function(){
		$(".search-gubun").attr("disabled", false);
		$(".search-gubun").val("quarter");
		
		$(".search-year").css("display", "none");
		$(".search-self").css("display", "none");
		$(".btn-search").css("display", "none");
	});
	
	$(".search-gubun").change(function(){
		if($(this).val()=="self"){
			$(".search-year").css("display", "none");
			$(".search-self").css("display", "inline-block");
			$(".btn-search").css("display", "inline-block");
		}else{
			$(".search-self").css("display", "none");
			$(".search-year").css("display", "inline-block");
			$(".btn-search").css("display", "inline-block");
		}
	});
});

</script>

</head>
<body>




<div class="sub-container">
	<div class="sub-title">
		<h3>놀이기구 통계</h3>
	</div>

	<div class="sub_contents">
		<div class="search-box">
			<div>
				<p class="tit">테마</p>
				<p>
					<select name="thema" class="boxTF select-search search-thema">
						<option value="all">전체</option>
						<option value="mini">미니언즈</option>
						<option value="toy">토이스토리</option>
					</select>
				</p>
				
				<p class="tit" style="margin-left: 15px;">조회구분</p>
				<p>
					<select name="searchGubun" class="boxTF select-search search-gubun" disabled="disabled">
						<option value="quarter">분기별</option>
						<option value="month">월별</option>
						<option value="self">직접기간설정</option>
					</select>
				</p>
			</div>
			
			<div style="margin-top: 15px;">
				<p class="tit search-year" style="display: none;">년도</p>
				<p class="search-year" style="display: none;">
					<select name="years" class="boxTF select-search">
						<option>::::년도::::</option>
						<option>2011</option>
						<option>2012</option>
					</select>
				</p>
				
				<p class="tit search-self" style="display: none;">기간설정</p>
				<p class="search-self" style="display: none;">
					<span class="datepickerBox"><input type="text" name="searchStartDate" class="boxTF datepicker" readonly="readonly" value="${searchStartDate}"></span> ~ 
					<span class="datepickerBox"><input type="text" name="searchEndDate" class="boxTF datepicker" readonly="readonly"  value="${searchEndDate}"></span>
				</p>
				
				<p>
					<span class="input-group-btn btn-search" style="display: none;">
						<button type="button" class="btn btn-info" style="border-radius: 5px;">
							<span class="glyphicon glyphicon-search"></span>
						</button>			
					</span>
				</p>
			</div>
		</div>
	</div>
</div>

</body>
</html>