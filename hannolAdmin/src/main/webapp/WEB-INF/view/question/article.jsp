<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
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

.custom_table {
    width: 100%;
    border-top: 2px solid #cecece;
    margin-top: 15px;
}

select {
    height: 30px;
    font-size: 12px;
    vertical-align: middle;
}

th {
    width: 25%;
    border: solid #e4e4e4;
    border-width: 0 1px 1px 0;
    padding: 7px 10px 7px 15px;
    font-weight: bold;
    text-align: left;
    background: #f4f4f4;
}

td {
	width: 75%;
    border-bottom: 1px solid #e4e4e4;
    padding: 10px 16px;
}

.td_custom {
	width: 75%;
	border-bottom: #ffffff;
    padding: 10px 16px;
}
</style>

<script>
$("body").on("click", "#delete", function(){
	$("#deleteModal").modal();
});

$("body").on("click", "#answerShow", function(){
	$("#answerTable").show();
});

$("body").on("click", "#answerCancel", function(){
	$("#answerContent").val("");
	$("#answerTable").hide();
});

$("body").on("click", "#answerUpdateBtn", function(){
	$("#answer1").hide();
	$("#answer2").show();
});

$("body").on("click", "#modifyCancel", function(){
	$("#answer2").hide();
	$("#answer1").show();
});

function validOk() {
    var f = document.questionForm;
    
    var str = f.answerContent.value;
    if(!str) {
        f.answerContent.focus();
        return; 
    }
    
	f.action="<%=cp%>/question/insertAnswer";
    f.submit();
}

function updateOK(){
	var f = document.questionForm;
	var str = f.answerUpdate.value;
    if(!str) {
        f.answerUpdate.focus();
        return; 
    }
	
    f.action="<%=cp%>/question/updateAnswer";
    f.submit();
}
</script>

<div class="sub-container" style="width: 960px;">
    <div class="sub-title">
          <h3><span class="glyphicon glyphicon-pencil"></span> 문의내역</h3>
    </div>

    <div align="center">
    <form name="questionForm" method="post">
    	<table class="custom_table">
		    <colgroup width="144">
		    </colgroup>
		  
		  <tbody>
				<tr>
					<th>문의유형</th>
					<td>
						${dto.gubun}
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						${dto.subject}
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td align="left" valign="top" height="300">
						${dto.content}
					</td>
				</tr>
		  </tbody>
		</table>
		
		<div style="display: none;" id="deleteModal" role="dialog" class="modal" tabindex="-1">
					<div class="modal-dialog modal-sm">
						<div class="modal-content">
		    				<div class="modal-header">
 								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
  								<span aria-hidden="true">×</span></button>
 								<div align="center">
 									<h5 class="modal-title" id="myModalLabel">해당 문의글을 삭제하시겠습니까?</h5>
 								</div>
							</div>
							<div class="modal-body">
									<div align="center" style="margin: 30px auto;">
										<p>[${dto.gubun}]</p>
										<p>${dto.subject}</p>
									</div>
									<div align="center" style="width: 100%; margin: 30px auto; border-spacing: 0px;">
		   								<button id="deleteButton" type="button" class="btn btn-info" style="font-weight: bold;" onclick="javascript:location.href='<%=cp%>/question/delete?num=${dto.qnaCode}&page=${page}&gubun=${dto.gubun}';">삭제</button>
		     	 						<button type="button" class="btn btn-default" data-dismiss="modal" style="font-weight: bold;">취소</button>
									</div>
							</div>
						</div>
					</div>
				</div>
		
		<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
			<tr height="40">
			    <td width="300" align="left" class="td_custom">
			    <c:if test="${sessionScope.staff.authority == 'ROLE_ADMIN' }">
			         <button id="delete" type="button" class="btn btn-default" style="font-weight: bold;">삭제하기</button>
			         <c:if test="${empty adminAnswer || empty adminAnswer.content}">
			         	<button id="answerShow" type="button" class="btn btn-default" style="font-weight: bold;">답변달기</button>
			    </c:if>
			   	</c:if>
			    </td>
			
			    <td align="right" class="td_custom">
			        <button type="reset" class="btn btn-default" data-dismiss="modal" style="font-weight: bold;" onclick="javascript:location.href='<%=cp%>/question/list?page=${page}&gubun=${dto.gubun}';">리스트</button>
			    </td>
			</tr>
		</table>
	
	
	<c:if test="${not empty adminAnswer}">
	<table id="answer1" class="custom_table">
		    <colgroup width="144">
		    </colgroup>
		  
		  <tbody>
				<tr>
					<th>답변</th>
					<td align="left" valign="top" height="100">
						<div id="adminAswerContent">
						${adminAnswer.content}
						</div>
					</td>
					<td>
						<c:if test="${usersCode == adminAnswer.usersCode}">
						<button id="answerUpdateBtn" type="button" class="btn btn-default" style="font-weight: bold;">답변수정</button>
						</c:if>
						<button type="button" class="btn btn-default" style="font-weight: bold; margin-top: 5px;" onclick="javascript:location.href='<%=cp%>/question/deleteAnswer?num=${dto.qnaCode}&page=${page}&gubun=${dto.gubun}';">답변삭제</button>
					</td>
				</tr>
		  </tbody>
	</table>
	
	<table id="answer2" class="custom_table" style="display: none"> 
		    <colgroup width="144">
		    </colgroup>
		  
		  <tbody>
				<tr>
					<th>답변</th>
					<td align="left" valign="top" height="100">
						<textarea id="answerUpdate" name="answerUpdate" rows="6" style="width: 100%; resize: none;">${brRemoveAnswer}</textarea>
					</td>
					<td>
						<button id="answerUpdateBtn" type="button" class="btn btn-default" style="font-weight: bold;" onclick="updateOK();">수정완료</button>
						<button id="modifyCancel" type="button" class="btn btn-default" style="font-weight: bold; margin-top: 5px;">취소하기</button>
					</td>
				</tr>
		  </tbody>
	</table>
	</c:if>
	
	<table id="answerTable" class="custom_table" style="display: none;">
		    <colgroup width="144">
		    </colgroup>
		  
		  <tbody>
				<tr>
					<th>답변달기</th>
					<td align="left" valign="top" height="100">
						<textarea id="answerContent" name="answerContent" rows="6" style="width: 100%; resize: none;"></textarea>
					</td>
					<td>
						<button type="button" class="btn btn-default" style="font-weight: bold;" onclick="validOk()">답변등록</button>
						<button id="answerCancel" type="button" class="btn btn-default" style="font-weight: bold; margin-top: 5px;">등록취소</button>
						<input type="hidden" name="usersCode" value="${usersCode}">
						<input type="hidden" name="gubun" value="${gubun}">
						<input type="hidden" name="page" value="${page}">
						<input type="hidden" name="num" value="${dto.qnaCode}">
						<input type="hidden" name="subject" value="${dto.subject}">
					</td>
				</tr>
		  </tbody>
	</table>
	</form>
    </div>
</div>