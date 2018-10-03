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
/**table**/
	.table{table-layout:fixed;}
	.table th,
	.table td{text-align:center;}
	.table td{text-overflow:ellipsis; overflow:hidden; white-space:nowrap;}
	.table td:nth-child(5){text-align:left;}  
	.table td:nth-child(6){text-align:right;}   
	
	.listData_no{text-align:center;}
	
	.noLine{padding-left:0; border:0 none;}
	select.noLine{padding:0; appearance:none; -webkit-appearance:none; -moz-appearance:none; cursor:default;}
	.datepicker.noLine+img{display:none;}
	input[name=state].noLine,
	input[name=state].noLine+label{display:none;}
	.stateView{display:block !important; padding-top:3px;}	
	
	/*search*/
	.datepickerBox{display:inline-block;}
	.datepickerBox .datepicker{width:203px;}   
	input[type=radio].boxR{margin:0 0px 0 11px; vertical-align:middle;} 
	input[type=radio].boxR:first-child{margin-left:0;} 
	 
	.datepicker + img{width:22px; margin:0px 0px 0px -31px; padding-left:8px; border-left:1px solid #dddddd; cursor:pointer;}

	/**modal**/
	.modalTable{width:100%; margin-top:20px; color:#444444;}
	.modalTable th,
	.modalTable td{padding:10px 0;} 
	.modalTable th{width:110px; padding-top:13px; padding-right:20px; text-align:right; vertical-align:top;}
	
	.boxTF,
	.boxTA,
	.modalTable .selectField{width:280px; vertical-align:middle;}
	.boxTF[readonly]{background-color:#ffffff;}
	.boxTA[disabled]{background-color:#f3f3f3; padding:10px 15px;}
	.selectField{padding:5px; vertical-align:middle;}
	.boxTF.btfName{width:120px;}
	.btfTel{width:60px; text-align:center;}
	
	
	.btnBox{margin:40px 0; text-align:center;}
	.btnBox .btn{margin:0 3px;}
	
	.modalTable input[type=radio],
	.modalTable label{margin:0 3px 0 0; vertical-align:middle; font-weight:500;}


	
	
	
	/**dialog new style**/
	.ui-widget{font-family:"Nanum Gothic";}
	.ui-widget input, 
	.ui-widget select, 
	.ui-widget textarea, 
	.ui-widget button{font-family:"Nanum Gothic"; font-size:13px;}
	.ui-widget-header{color:#ffffff; background:#4c4c4c;}
	.ui-dialog .ui-dialog-title{font-size:16px;}
	.ui-dialog .ui-dialog-titlebar{padding:11px 1em;}
	.ui-dialog{padding:0;}
	.ui-draggable .ui-dialog-titlebar{border-bottom-left-radius:0; border-bottom-right-radius:0;}
	
</style>

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>

<script type="text/javascript" src="<%=cp%>/resource/highchart/highcharts.js"></script>
<script type="text/javascript" src="<%=cp%>/resource/highchart/highcharts-3d.js"></script>

<script type="text/javascript">
// http://www.highcharts.com/demo

$(function(){
	var year = new Date().getFullYear();
	var gubun = "quarter";//기본설정 (year:올해, gubun:분기별)
	getchart(year,gubun);
	
	$("input[name=gubun]").change(function(){
		var yearCh = $("#yearCode").val();
		if(yearCh == 0){
			alert("조회할 년도를 선택해주세요");
			return;
		}
		
		var gubunCh = $(this).val();
		
		getchart(yearCh, gubunCh);
	});
});

function getchart(year,gubun){
	var url="<%=cp%>/visitor/visitorChart?year="+year+"&gubun="+gubun;
	$.getJSON(url, function (csv) {
		var year=csv.year;
		var list = csv.chartX;

		$('#visitorLine').highcharts({	
	        title: {
	            text: year+'년 이용객 수',
	        },
	        xAxis: {
	            categories: list
	        },
	        yAxis: {
	            title: {
	                text: '이용객(명)'
	            },
	        },
	        credits:{
	        	enabled:false
	        	},
	        series:csv.series
		});
	});
}

function searchList(){
	var startDate = $("input[name=searchStartDate]").val();
	var endDate = $("input[name=searchEndDate]").val();

	var url="<%=cp%>/visitor/visitorLinePeriod?startDate="+startDate+"&endDate="+endDate;
	$.getJSON(url, function (csv) {
		var list = csv.chartX;

		$('#visitorLine').highcharts({		
	        title: {
	        	text: '조회기간 이용객 수'
	        },
	        xAxis: {
	            categories: list
	        },
	        yAxis: {
	            title: {
	                text: '이용객(명)'
	            },
	        },
	        credits:{
	        	enabled:false
	        	},
	        series:csv.series
		});
	});
}

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

</script>

</head>
<body>




<div class="sub-container">
	<div class="sub-title">
		<h3>이용객 현황 관리</h3>
	</div>

	<div class="sub_contents">
		<form name="searchForm" method="post">
			<table style="width: 100%; margin: 30px auto; border-spacing: 0px;">
				<tr height="40">
					<th>조회구분</th>
					<td>
						<span>
							<select class="input-sm" id="yearCode" name="yearCode">
							 <option value="0">:::::::: 년도 ::::::::</option>
							 <c:forEach var="vo" items="${yearList }">
								<option value="${vo.year }">${vo.year }</option>
							 </c:forEach>
		                	</select>
		                </span>
						<span>
							<input type="radio" name="gubun" value="quarter"> 분기별
							<input type="radio" name="gubun" value="month"> 월별
		                </span>
					</td>  
				</tr>
				<tr height="40">
					<th>기간설정</th>
					<td>
						<span class="datepickerBox"><input type="text" name="searchStartDate" class="boxTF datepicker" readonly="readonly" value="${searchStartDate}"></span> ~ 
						<span class="datepickerBox"><input type="text" name="searchEndDate" class="boxTF datepicker" readonly="readonly"  value="${searchEndDate}"></span>
						<button type="button" class="btn btn-default" onclick="searchList()">검색</button>
					</td>  
				</tr>
			</table>
			</form>
	
	
		<div id="visitorLine" 
            style="width: 100%; height: 500px; float: left; margin: 10px;"></div>
	
	</div>
</div>

</body>
</html>