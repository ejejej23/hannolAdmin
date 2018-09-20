<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
	/**table**/
	.table{table-layout:fixed;}
	.table th,
	.table td{text-align:center;}
	.table td{text-overflow:ellipsis; overflow:hidden; white-space:nowrap;}
	.table th:nth-child(2),
	.table td:nth-child(2),
	.table th:nth-child(3),
	.table td:nth-child(3),
	.table td:nth-child(4){text-align:left;}
	
	.listData_no{text-align:center;}
	
	.noLine{border:0 none;}
	.btfTel.noLine{width:36px; padding-left:0; padding-right:0;}
	
	
	
	/**modal**/
	.modalTable{width:100%; margin-top:20px; color:#444444;}
	.modalTable th,
	.modalTable td{padding:10px 0;} 
	.modalTable th{width:110px; padding-top:13px; padding-right:20px; text-align:right; vertical-align:top;}
	
	.boxTF,
	.boxTA{width:280px; vertical-align:middle;}
	.boxTA[disabled]{background-color:#f3f3f3; padding:10px 15px;}
	.selectField{padding:5px; vertical-align:middle;}
	.boxTF.btfName{width:120px;}
	.btfTel{width:60px; text-align:center;}
	
	
	.btnBox{margin:40px 0; text-align:center;}
	.btnBox .btn{margin:0 3px;}
	
	
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

<script type="text/javascript">

$(function() {
	$(document).on("click","button[name=updateBtn]",function(){
		var modalYear = $(this).closest("tr").children().eq(1).text();
		var modalQuarter = $(this).closest("tr").children().eq(2).text();
		
		$("#yearBudget").val(modalYear);
		$("#quarterBudget").val(modalQuarter);
		
		$("#budgetModal").dialog({
			title:"예산",
			width:480,
			height:350,
			modal:true,
			show:"clip",
			hide:"clip"
		});
	});
	
});
function getList(){
	var url = "<%=cp%>/budget/sublist";
	var query = "page="+${page};
	
	$.ajax({
		type:"post"
		,url:url	//서버의 주소
		,data:query	//서버로 보내는 값
		,success:function(data){
			$("#blistLayout").html(data);
		}
		,error:function(e){
			$("#bresultLayout").html("갱신에러발생!");	
		}
	}); 
}

function sendBudget(){
	
	
	var url = "<%=cp%>/budget/update";
	var year = $("#yearBudget").val();
	var quarter =  $("#quarterBudget").val();
	var budget =  $("#budgetAmount").val();

	if(! /^(\d+)$/.test(budget)) {
		$("#sendLayout").html("숫자만 입력 가능합니다.");
		$("#budgetAmount").focus();
		$("#budgetAmount").val("");
		return false;
	}
	
 	var query = "page="+${page}+"&year="+year+"&quarter="+quarter+"&budget="+budget;
 	
	// AJAX-POST
	$.ajax({
		type:"post"
		,url:url	//서버의 주소
		,data:query	//서버로 보내는 값
		,success:function(data){
			$("#resultLayout").html("수정완료!");
			getList();
			$("#budgetModal").dialog("close");
		}
		,error:function(e){
			console.log(e.responseText);
			$("#resultLayout").html("에러발생!");	
		}
	});  
}

$(function(){
	getList(1);
});

</script>
<div class="sub-container">
    
    <div class="sub-title">
	  <h3>예산 <small>분기별 예산내역</small></h3>
	</div> 
    
    <div>

		<div id="blistLayout"></div>
		
		<div id="bresultLayout"></div>

    </div>
    
    <div id="budgetModal" class="modal">
		<form name="budgetForm">
			<table class="modalTable">
				<tr>
					<th scope="row">년도</th>
					<td><input type="text" name="year" id="yearBudget" class="boxTF" readonly="readonly"></td>
				</tr>
				<tr>
					<th scope="row">분기</th>
					<td><input type="text" name="quarter" id="quarterBudget" class="boxTF" readonly="readonly"></td>
				</tr>
				<tr>
					<th scope="row">예산 금액</th>
					<td><input type="text" name="budget" id="budgetAmount" class="boxTF"></td>
				</tr>
			</table>
			
			<div class="btnBox">
		        <button type="button" class="btn btn-default" onClick="sendBudget()" id="btnBudgetSendOk">예산등록</button>
		    </div>
		    
		    <div id="sendLayout"></div>
		</form>
	</div>
    
</div>