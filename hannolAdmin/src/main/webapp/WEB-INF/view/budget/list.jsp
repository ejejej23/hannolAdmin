<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script type="text/javascript">


$(function() {
	$(document).on("click","button",function(){
		
		alert("test");
		<%-- var url = "<%=cp%>/budget/update";
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
		});   --%>
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
			console.log(e.responseText);
			$("#bresultLayout").html("갱신에러발생!");	
		}
	}); 
}
$(function(){
	getList(1);
});

$(function(){
	$("#budgetModal").dialog({
		title:"업체추가",
		width:480,
		height:480, 
		modal:true,
		show:"clip",
		hide:"clip"
	});
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
				<th scope="row">업체명</th>
				<td><input type="text" name="name" class="boxTF"></td>
			</tr>
			<tr>
				<th scope="row">상세설명</th>
				<td><textarea class="boxTA"></textarea></td>
			</tr>
			<tr>
				<th scope="row">연락처</th>
				<td>
					<select class="selectField btfTel" name="tel1">
						<option value="">선택</option>
						<option value="010">010</option>
						<option value="010">011</option>
						<option value="010">016</option>
						<option value="010">017</option>
						<option value="010">018</option>
						<option value="010">019</option>
					</select> - <input type="text" name="tel2" class="boxTF btfTel" maxlength="4"> - <input type="text" name="tel3" class="boxTF btfTel" maxlength="4">
				</td>
			</tr>
		</table>
		
		<div class="btnBox">
	        <button type="button" class="btn" id="btnScheduleSendOk">업체등록</button>
	        <button type="reset" class="btn">다시입력</button>
	        <button type="button" class="btn" id="btnScheduleSendCancel">등록취소</button>
	    </div>
	</form>
</div>
    
</div>