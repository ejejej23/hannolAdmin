<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script type="text/javascript">


$(function() {
	$(document).on("click","button[name=updateBtn]",function(){
		var modalYear = $(this).closest("tr").children().eq(1).text();
		var modalQuarter = $(this).closest("tr").children().eq(2).text();
		
		$("#yearBudget").val(modalYear);
		$("#quarterBudget").val(modalQuarter);
		
		$("#budgetModal").dialog({
			title:"예산",
			width:300,
			height:300, 
			modal:true,
			show:"clip",
			hide:"clip"
		});
	});
	
	<%-- $(document).on("click","button[name=btnBudgetSendOk]",function(){
		console.log("testtttt");
		
		var url = "<%=cp%>/budget/update";
		var year = $(this).closest("tr").children().eq(1).text();
		var quarter = $(this).closest("tr").children().eq(2).text();
	 	var query = "page="+${page}+"&year="+year+"&quarter="+quarter;
	 	
		// AJAX-POST
		$.ajax({
			type:"post"
			,url:url	//서버의 주소
			,data:query	//서버로 보내는 값
			,success:function(data){
				$("#resultLayout").html("수정완료!");
				getList();
			}
			,error:function(e){
				console.log(e.responseText);
				$("#resultLayout").html("에러발생!");	
			}
		});   
	}); --%>

	
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
			console.log(e.responseText);
			$("#bresultLayout").html("갱신에러발생!");	
		}
	}); 
}

function sendBudget(){
	var url = "<%=cp%>/budget/update";
	var year = $("#yearBudget").val();
	var quarter =  $("#quarterBudget").val();
	var budget =  $("#budgetAmount").val();
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
<div class="sub-container" style="width: 960px;">
    
    <div class="sub-title">
	  <h3>예산 <small>분기별 예산내역</small></h3>
	</div> 
    
    <div>

		<div id="blistLayout"></div>
		
		<div id="bresultLayout"></div>

    </div>
    
    <div id="budgetModal" class="modal">
	<form>
		<table class="modalTable">
			<tr>
				<th scope="row">년도</th>
				<td><input type="text" name="year" id="yearBudget" class="boxTF" readonly></td>
			</tr>
			<tr>
				<th scope="row">분기</th>
				<td><input type="text" name="quarter" id="quarterBudget" class="boxTF" readonly></td>
			</tr>
			<tr>
				<th scope="row">예산 금액</th>
				<td><input type="text" name="budget" id="budgetAmount" class="boxTF"></td>
			</tr>
		</table>
		
		<div class="btnBox">
	        <button type="button" class="btn" onClick="sendBudget()" id="btnBudgetSendOk">예산등록</button>
	    </div>
	</form>
</div>
    
</div>