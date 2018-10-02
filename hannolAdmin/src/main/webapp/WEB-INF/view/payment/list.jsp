<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style type="text/css">
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

.note{
	border: 1px solid #e1e1e1;
    background: #f8f8f8;
    padding: 20px;
    margin-top: 30px;
}

th {
    width: 30%;
    border: solid #e4e4e4; 
    border-width: 0 1px 1px 0;
    background: #f8f8f8;
    padding: 7px 15px 7px 15px;
    font-weight: bold;
    text-align: center;    
}

td {
    width: 30%;
    border: solid #e4e4e4; 
    border-width: 0 1px 1px 0;
    padding: 7px 15px 7px 15px;
    text-align: center;    
}

.modal_th {
    width: 40%;
    border: solid #e4e4e4;
    border-width: 0 1px 1px 0;
    padding: 7px 10px 7px 15px;
    font-weight: bold;
    text-align: left;
    background: #f4f4f4;
}

.modal_td {
	width: 60%;
    border-bottom: 1px solid #e4e4e4;
    padding: 10px 16px;
}

.custom_table {
    width: 100%;
    border-top: 2px solid #cecece;
}

.custom_col1 {
    width: 50%;
    border: solid #e4e4e4;
    border-width: 0 1px 1px 0;
    padding: 7px 10px 7px 15px;
    font-weight: bold;
    text-align: left;
}

.customer_col2 {
	width: 50%;
    border-bottom: 1px solid #e4e4e4;
    padding: 10px 16px;
}

.custom_h2 {
    padding-left: 2px;
    margin-bottom: 8px;
    font-weight: 700;
    color: #333;
    text-align: left;
}

.div-menu{
	float: left;
}

.select-menu{
	width : 130px;
	padding: 8px;
	border-radius: 5px;
}
</style>

<script type="text/javascript">
var dataQuery ="";
var thema = "${thema}";
var page = "${page}";
var searchKey = "${searchKey}";
var searchValue = "${searchValue}";
var year = "${year}";

$(function(){
	$('.nav-item').removeClass('active');
	$(".nav-item").each(function(){
		if( $(this).attr("data-thema") == thema){
			$(this).addClass("active");
			return;
		}
	});
	
	if(searchValue != ''){
		dataQuery = "searchKey="+searchKey+"&searchValue="+encodeURIComponent(searchValue)+"&year="+year;
	}
	
	listPage("${page}", dataQuery);
	
	$(".nav-link").click(function(){
		$('.nav-item').removeClass('active');
		$(this).parent(".nav-item").addClass("active");
		
		thema = $(this).parent(".nav-item").data("thema"); 
		
		listPage(1, dataQuery);
	});
});


function listPage(pagep, dataQuery){	
	page = pagep;
	
	var url = "<%=cp%>/payment/ajaxPaymentList";
	var data = "page="+page;
	
	if(dataQuery != ''){
		data+="&"+dataQuery;
	}
	
	data+="&thema="+thema+"&year="+year;
	
	$.ajax({
		type:"GET"
		,url:url
		,data: data
		,success:function(data) {
			$(".paymentList").html(data);			
		}
	    ,error:function(e) {
	    	console.log(e.responseText);
	    }
	});
}

function refundCheck(payCode){
    $("#refundModal"+payCode).modal();
}

function refund(){
	var f = document.submitForm;
	f.action="<%=cp%>/payment/refundPay?thema="+thema;
    f.submit();
}

function searchList() {
	var searchValue = $("#searchValue").val();
	dataQuery = "searchKey=all&searchValue="+encodeURIComponent(searchValue);
	
	listPage(1, dataQuery);
}

$(function(){
	$("#selectYear").change(function(){
		var year = $("#selectYear option:selected").val();
		location.href="<%=cp%>/payment/list?year="+year+"&thema="+thema;
	});
	$("#selectYear > option[value='${year}']").attr("selected","selected");
});
</script>


<div class="sub-container" style="width: 960px;">
    <div class="sub-title">
	  <h3>구매관리</h3>
	</div> 
	
	<div>
		<ul class="nav nav-tabs">
		  <li class="nav-item active" data-thema="0">
		    <a class="nav-link">이용권</a>
		  </li>
		  <li class="nav-item" data-thema="1">
		    <a class="nav-link">기프트샵</a>
		  </li>
		</ul>
    </div>
    
    <div style="margin-top: 15px;">
	    <form name="searchForm" method="post" action="<%=cp%>/payment/list">
	    	<div class="div-menu">
	   			<select class="select-menu" name="selectYear" id="selectYear">
	   				<option value="0">:::::::: 년도 ::::::::</option>
	   				<c:forEach var="vo" items="${yearList}">
						<option value="${vo.year}">${vo.year}</option>
					</c:forEach>
	   			</select>
	   		</div>
	    	<div class="col-xs-8 col-xs-offset-2">
		  		<div class="input-group">   
		  			<input type="hidden" name="searchKey" value="all">
		            <input type="text" style="height:34px;" class="form-control" name="searchValue" id="searchValue" placeholder="검색할 키워드를 입력해 주세요..." value="${searchValue}">
		            <span class="input-group-btn">
		                <button class="btn btn-default btn-info" type="button" onclick="searchList()"><span class="glyphicon glyphicon-search"></span></button>
		                <input type="hidden" name="tab" id="input-tab">
		            </span>
		        </div>
			</div>
		</form>
    </div>
    
    <div class="paymentList" style="width: 100%;">
    </div>
</div>