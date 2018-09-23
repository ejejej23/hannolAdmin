<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>
.td_title{
	font-weight: bold;
	text-align: left;
}

.td_gubun input[type=checkbox]{
	vertical-align: middle;
	margin: 0px 0px 0px 10px;
}

.datepicker + img{width:22px; margin:0px 0px 0px -31px; padding-left:8px; border-left:1px solid #dddddd; cursor:pointer;}
.datepickerBox{display:inline-block;}
.datepickerBox .datepicker{width:203px;}   
</style>

<script>
function searchList() {
	var f=document.searchForm;
	f.submit();
}

$(function(){
	//검색 시작날짜
	$("input[name=searchStartDate]").datepicker({
		dateFormat:'yy-mm-dd',
		showOn:"both",
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
		showOn:"both",
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

<div class="sub-container" style="width: 960px;">
	<div class="sub-title">
		<h3>쿠폰발송</h3>
	</div>

	<div>
		<table>
			<tr>
				<td class="td_title">발급유형</td>
				<td class="td_gubun">
					<input type="checkbox">전체
					<input type="checkbox">일반
					<input type="checkbox">GOLD
					<input type="checkbox">VIP
				</td>
			</tr>
			<tr>
				<td class="td_title">유효기간</td>
				<td>
					<span class="datepickerBox"><input type="text" name="searchStartDate" class="boxTF datepicker" readonly="readonly" value="${searchStartDate}"></span> ~ 
					<span class="datepickerBox"><input type="text" name="searchEndDate" class="boxTF datepicker" readonly="readonly"  value="${searchEndDate}"></span>
				</td>
			</tr>
			<tr>
			</tr>
		</table>
	</div>
</div>