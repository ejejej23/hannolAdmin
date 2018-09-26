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
	var url="<%=cp%>/statistic/line1";
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
        	
        	 $("input[name=searchStartDate]").datepicker("option", "maxDate", selected); 
        } 
	});	
});
</script>

</head>
<body>

<div class="sub-container">
	<div class="sub-title">
		<h3>놀이기구<small>통계</small></h3>
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
				
				<!-- 라디오 버튼으로 기간설정 -->
				<tr>
					<th>기간</th> 
					<td>
						<input type="radio" name="year" value="년"/> 년
						<input type="radio" name="month" value="월"/> 월
						<input type="radio" name="week" value="요일"/> 요일
						<input type="radio" name="day" value="일"/> 일
						<input type="radio" name="hour" value="시간"/> 시간
					</td>
				</tr>
				
			</table>
		</form>
		
		<button type="button" class="btn_1" onclick="searchList()">조회</button>
	
	
		<div id="lineContainer1" style="width: 100%; height: 500px; float: left; margin: 10px;"></div>
            
	</div>
</div>

</body>
</html>