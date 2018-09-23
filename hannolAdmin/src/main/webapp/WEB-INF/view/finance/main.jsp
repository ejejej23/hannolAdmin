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

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>

<script type="text/javascript">
// http://www.highcharts.com/demo

$(function(){
	var url="<%=cp%>/finance/line1";
	$.getJSON(url, function (csv) {
		$('#lineContainer1').highcharts({
	        title: {
	            text: '서울 2015년 월별 평균 기온',
	        },
	        xAxis: {
	            categories: ['1월', '2월', '3월', '4월', '5월', '6월',
	                '7월', '8월', '9월', '10월', '11월', '12월']
	        },
	        yAxis: {
	            title: {
	                text: '기온 (°C)'
	            },
	        },
	        credits:{
	        	enabled:false
	        	},
	        series:csv
		});
	});
});

$(function(){
	var url="<%=cp%>/finance/line2";
	$.getJSON(url, function (csv) {
		var year=csv.year;
		
		$('#lineContainer2').highcharts({
	        title: {
	            text: year+'년 월별 평균 기온',
	        },
	        xAxis: {
	            categories: ['1월', '2월', '3월', '4월', '5월', '6월',
	                '7월', '8월', '9월', '10월', '11월', '12월']
	        },
	        yAxis: {
	            title: {
	                text: '기온 (°C)'
	            },
	        },
	        credits:{
	        	enabled:false
	        	},
	        series:csv.series
		});
	});
});

$(function(){
	var url="<%=cp%>/finance/bar";
	$.getJSON(url, function (csv) {
		var year=csv.year;
		
		$('#barContainer').highcharts({
			chart: {
	            type: 'column'
	        },			
	        title: {
	            text: year+'년 월별 평균 기온',
	        },
	        xAxis: {
	            categories: ['1월', '2월', '3월', '4월', '5월', '6월',
	                '7월', '8월', '9월', '10월', '11월', '12월']
	        },
	        yAxis: {
	            title: {
	                text: '기온 (°C)'
	            },
	        },
	        credits:{
	        	enabled:false
	        	},
	        series:csv.series
		});
	});
});

$(function(){
	var url="<%=cp%>/finance/pie3d";
	$.getJSON(url, function (csv) {
		$('#pie3dContainer').highcharts({
			chart: {
	            type: 'pie',
	            options3d: {
	                enabled: true,
	                alpha: 45
	            }
	        },			
	        title: {
	            text: '시간별 접속자 수',
	        },
	        plotOptions: {
	            pie: {
	                innerSize: 100,
	                depth: 45
	            }
	        },
	        credits:{
	        	enabled:false
	        	},
	        series:csv
		});
	});
});

$(function(){
	var url="<%=cp%>/finance/paymetBar";
	$.getJSON(url, function (csv) {
		var year=csv.year;
		
		$('#paymetBar').highcharts({
			chart: {
	            type: 'column'
	        },			
	        title: {
	            text: year+'분기별 매출',
	        },
	        xAxis: {
	            categories: ['1분기', '2분기', '3분기', '4분기']
	        },
	        yAxis: {
	            title: {
	                text: '매출(원)'
	            },
	        },
	        credits:{
	        	enabled:false
	        	},
	        series:csv.series
		});
	});
});

//datepicker
$(function(){
	$("input[name=repairDate]").datepicker({
		dateFormat:'yy-mm-dd',
		showOn:"button",
        buttonImage:"<%=cp%>/resource/images/date24.png",
        buttonImageOnly:true,
        showAnim:"slideDown",
        buttonText:"선택",
        maxDate:0
	});
	
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
		<h3>재정<small>매출/지출</small></h3>
	</div>

	<div class="sub_contents">
		<form name="searchForm" method="post">
			<table style="width: 100%; margin: 30px auto; border-spacing: 0px;">
				<tr height="40">
					<th>날짜</th>
					<td>
						<span class="datepickerBox"><input type="text" name="searchStartDate" class="boxTF datepicker" readonly="readonly" value="${searchStartDate}"></span> ~ 
						<span class="datepickerBox"><input type="text" name="searchEndDate" class="boxTF datepicker" readonly="readonly"  value="${searchEndDate}"></span>
					</td>  
				</tr>
				<tr>
					<th>검색</th> 
					<td>
						<select name="searchKey" class="selectField"> 
							<option value="kind" <c:if test="${searchKey=='kind'}">selected="selected"</c:if>>분류</option>
							<option value="name" <c:if test="${searchKey=='name'}">selected="selected"</c:if>>시설명</option> 
							<option value="company" <c:if test="${searchKey=='company'}">selected="selected"</c:if>>업체명</option> 
							<option value="content" <c:if test="${searchKey=='content'}">selected="selected"</c:if>>수리내역</option>
						</select>  
						<input type="text" name="searchValue" class="boxTF" value="${searchValue}"> 
						<button type="button" class="btn btn-default" onclick="searchList()">검색</button>
					</td>  
				</tr>
			</table>
		</form>
	
	
		<div id="paymetBar" 
            style="width: 100%; height: 500px; float: left; margin: 10px;"></div>
	
	</div>
</div>

</body>
</html>