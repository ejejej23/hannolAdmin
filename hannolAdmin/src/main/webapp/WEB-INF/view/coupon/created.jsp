<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<style>
table{
	margin: 0px auto;
}

tr {
	margin: 5px;
}

.td_title {
	font-weight: bold;
	text-align: left;
}

.td_gubun input[type=checkbox] {
	vertical-align: middle;
	margin: 0px 0px 0px 10px;
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

.stCouponBox {
	margin: 0px 0px 0px 10px;
	padding: 5px;
	min-width: 205px;
}

.inputCount, .inputCouponName {
	margin: 0px 0px 0px 10px;
	text-align: center;
	width: 205px;
}

.txtCoupon {
	margin: 5px 0px 0px 10px;
	width: 420px;
}

input[type=radio].boxR {
	margin: 0 0px 0 11px;
	vertical-align: middle;
}

.btnBox{
	text-align: center;
}

.btnBox button{
	width: 150px;
    margin-top: 10px;
}

</style>

<script>
function searchList() {
	var f=document.searchForm;
	f.submit();
}

$(function(){
	
	//시작날짜
	$("input[name=startDate]").datepicker({
		dateFormat:'yy-mm-dd',
		showOn:"both",
        buttonImage:"<%=cp%>/resource/images/date24.png",
        buttonImageOnly:true,
        showAnim:"slideDown",
        buttonText:"선택",
        minDate:0,
        onSelect:function(selected){
        	var selectDate = selected.split("-");
        	var setDate = Number(selectDate[0])+1
        	setDate+=("-"+selectDate[1]+"-"+selectDate[2]);
        	
        	if(!$("input[name=endDate]").val()){ 
        		$("input[name=endDate]").val(setDate);  
        	}
        }
	}); 
	
	//마지막 날짜
	$("input[name=endDate]").datepicker({
		dateFormat:'yy-mm-dd',
		showOn:"both",
        buttonImage:"<%=cp%>/resource/images/date24.png",
		buttonImageOnly : true,
		showAnim : "slideDown",
		buttonText : "선택",
		minDate : 0,
		onSelect : function(selected) {

		}
	});
	
	$(".boxR").change(function(){
		$("input[name=userGubun]").prop("checked", false);
		$(this).prop("checked", true);
	});
	
	$(".btnCoupon").click(function(){
		$("#couponForm").submit();
	});
});
</script>

<div class="sub-container" style="width: 960px;">
	<div class="sub-title">
		<h3>쿠폰발송</h3>
	</div>

	<div>
	<form action="<%=cp%>/coupon/created" method="POST" id="couponForm">
			<table>
				<tr>
					<td class="td_title">발급유형</td>
					<td class="td_gubun">
					<input type="radio" class="boxR" name="usersGubun" value="all">전체 
					<input type="radio" class="boxR" name="usersGubun" value="normal">일반 
					<input type="radio" class="boxR" name="usersGubun" value="gold">GOLD 
					<input type="radio" class="boxR" name="usersGubun" value="vip">VIP</td>
				</tr>
				
				<tr height="40">
					<td class="td_title">쿠폰명</td>
					<td>
						<input type="text" class="boxTF inputCouponName" name="mngName">
					</td>
				</tr>
				
				<tr height="40">
					<td class="td_title">유효기간</td>
					<td class="td_gubun">
						<span class="datepickerBox"><input type="text" name="startDate" class="boxTF datepicker" readonly="readonly"></span> 
						~ 
						<span class="datepickerBox"><input type="text" name="endDate" class="boxTF datepicker" readonly="readonly"></span>
					</td>
				</tr>
				<tr height="40">
					<td class="td_title">발급쿠폰</td>
					<td class="td_gubun">
						<select class="boxTF stCouponBox" name="goodsCode">
							<option value="">::선택::</option>
							<c:forEach items="${list}" var="item">
								<option value="${item.goodsCode}">${item.goodsName}</option>
							</c:forEach>
							
							
						</select>
					</td>
				</tr>
				
				<tr height="40">
					<td class="td_title">수량</td>
					<td class="td_gubun">
						<input type="text" class="boxTF inputCount" name="count">
					</td>
				</tr>
				
				<tr>
					<td class="td_title">상세</td>
					<td><textarea name="memo" class="boxTA txtCoupon"></textarea></td>
				</tr>
			</table>
		</form>
		<div class="btnBox">
			<button class="btn btn-default" onclick="javascript:location.href='<%=cp%>/coupon/list'">취소</button>
			<button class="btn btn-info btnCoupon">발송</button>
		</div>
		
		<div>
			${msg}
		</div>
	</div>
</div>