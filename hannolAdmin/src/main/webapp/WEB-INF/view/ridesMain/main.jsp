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

//검색조건 event
$(function(){
	$(".search-thema").change(function(){
		if($(this).val() != ""){
			$(".search-gubun").attr("disabled", false);
			$(".search-gubun").val("");
			
			//년도 가져오기
			getYear($(this).val());
		}else{
			$(".search-gubun").attr("disabled", true);
			$(".search-gubun").val("");
		}
		
		$(".search-year").css("display", "none");
		$(".search-self").css("display", "none");
		$(".btn-search").css("display", "none");
		
		reset();
	});
	
	$(".search-gubun").change(function(){
		if($(this).val()=="self"){
			$(".search-year").css("display", "none");
			$(".search-self").css("display", "inline-block");
			$(".btn-search").css("display", "inline-block");
		}else if($(this).val() != ""){
			$(".search-self").css("display", "none");
			$(".search-year").css("display", "inline-block");
			$(".btn-search").css("display", "inline-block");
		}
		
		reset();
	});
});

function getYear(themaCode){
	var url = "<%=cp%>/rides/getYear";
	var data = "themaCode="+themaCode;
	$("#years").html("");
	$("#years").append("<option value=''>::::년도::::</option>");
	
	$.ajax({
		type:"POST"
		,url:url
		,data: data
		,success:function(data) {
			for(var i=0; i<data.yearList.length; i++){
				$("#years").append("<option value="+data.yearList[i].year+">"+data.yearList[i].year+"</option>");
			}
		}
	    ,error:function(e) {
	    	console.log(e.responseText);
	    }
	});
}

function reset(){
	
	$("#years").val("");
}

//search버튼 Event
$(function(){
	$(".btn-search-submit").click(function(){
		//검색조건이 만족하는지 확인
		if($("#thema").val()==""){
			alert("테마를 선택해 주세요");
			$("#thema").focus();
			return;
		}
		
		if($("#searchGubun").val()==""){
			alert("조회구분를 선택해 주세요");
			$("#searchGubun").focus();
			return;
		}
		
		if($("#searchGubun").val() != "self"){
			if($("#years").val()==""){
				alert("년도를 선택해 주세요");
				return;
			}
		}
		
		//AJAX-CHART
		getChartData();
	});
});

//Chart Data 구하는 function
function getChartData(){
	var data = "thema="+$("#thema").val();
	
	var searchGubun = $("#searchGubun").val();
	data+="&searchGubun="+searchGubun;
	
	data+="&years="+$("#years").val();
	
	var url="<%=cp%>/rides/chartData?"+data;
	$.getJSON(url, function (csv) {
		var list = csv.chartX;

		$('#ridesMainLine').highcharts({
			chart: {
	            type: 'line'
	        },			
	        title: {
	            text: '놀이기구 이용현황',
	        },
	        xAxis: {
	            categories: list
	        },
	        yAxis: {
	            title: {
	                text: '인원(명)'
	            },
	        },
	        credits:{
	        	enabled:false
	        	},
	        series:csv.series
		});
	});
}

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
						<select id="thema" name="thema" class="boxTF select-search search-thema">
							<option value="">::테마선택::</option>
							<option value="4">전체</option>
							<c:forEach items="${thema}" var="dto">
							<option value="${dto.themaCode}">${dto.themaName}</option>
							</c:forEach>
						</select>
					</p>
					
					<p class="tit" style="margin-left: 15px;">조회구분</p>
					<p>
						<select id="searchGubun" name="searchGubun" class="boxTF select-search search-gubun" disabled="disabled">
							<option value="">::구분선택::</option>
							<option value="quarter">분기별</option>
							<option value="month">월별</option>
						</select>
					</p>
				</div>
				
				<div style="margin-top: 15px;">
					<p class="tit search-year" style="display: none;">년도</p>
					<p class="search-year" style="display: none;">
						<select id="years" name="years" class="boxTF select-search">
							<option value="">::::년도::::</option>
						</select>
					</p>
					
					<p>
						<span class="input-group-btn btn-search" style="display: none;">
							<button type="button" class="btn btn-info btn-search-submit" style="border-radius: 5px;">
								<span class="glyphicon glyphicon-search"></span>
							</button>			
						</span>
					</p>
				</div>
			</div>
			
			<div id="ridesMainLine" style="width: 100%; height: 500px; float: left; margin: 10px;"></div>
	</div>
</div>

</body>
</html>