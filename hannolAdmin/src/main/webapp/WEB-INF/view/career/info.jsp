<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<script type="text/javascript">
function deleteCareer(data) {
		var careerCode = data;
		var page = "${page}";
		var query = "careerCode="+careerCode+"&${query}";
		var url = "<%=cp%>/career/delete?" + query;
		
		if(confirm("위 자료를 삭제 하시 겠습니까 ? ")) {
				location.href=url;
		}
}

function sendOk() {
    var f = document.infoForm;

	var str = f.careerDate.value;
    if(!str || !isValidDateFormat(str)) {
        alert("날짜형식를 확인하세요[YYYY-MM-DD]. ");
        $("#inputDate").val("");
        $("#inputDate").focus();
        return;
    }
	var s = $("#dpCode option:selected").val();

	f.action="<%=cp%>/career/create";
    f.submit();
}

</script>

<div class="sub-container" align="center">

	<div class="sub-title">
		<h3>
			발령 <small>상세정보</small>
		</h3>
	</div>

	<div style="width: 900px; border-spacing: 0px;">
		<form  name="infoForm" id="infoForm" method="post" >

			<div style="float: left; width: 40%">
				<div class="form-group" style="margin: 80px auto 0px;">
					<label for="usersCode" class="col-sm-5 control-label text-right"><mark>*</mark>&nbsp;사원번호</label>
					<div class="col-sm-7">
						<input type="text" name="usersCode" class="form-control input-sm"
							id="usersCode" placeholder="사원번호" value="${usersCode}"
							readonly="readonly">
					</div>
				</div>
				<br>
				
				<div class="form-group" style="margin: 20px auto 0px;">
					<label for="careerCode" class="col-sm-5 control-label text-right"><mark>*</mark>&nbsp;발령코드</label>
					<div class="col-sm-7">
						<input type="text" name="careerCode" class="form-control input-sm"
							id="careerCode" placeholder="발령코드는 입력후 자동생성됨" value="${dto.careerCode}" disabled="disabled"
							readonly="readonly">
					</div>
				</div>
				
				<br>
				<div class="form-group" style="margin: 20px auto 0px;">
					<label for="dpCode" class="col-sm-5 control-label text-right"><mark>*</mark>&nbsp;부서</label>
					<div class="col-sm-7">
						<c:if test="${mode=='create'}">
							<select class="input-sm" id="dpCode" name="dpCode">
				                 <option value="0">:::::::: 선택 ::::::::</option>
				                 <option value="1">마케팅</option>
				                 <option value="2">영업</option>
				                 <option value="3">관리</option>
				                 <option value="4">가이드</option>
			               </select>
						</c:if>
						<c:if test="${mode=='info'}">
							<input type="text" name="dpName" class="form-control input-sm"
								id="dpName" placeholder="부서명" value="${dto.dpName}" readonly="readonly">
						</c:if>
					</div>
				</div>
				<br>
				<div class="form-group" style="margin: 20px auto 0px;">
					<label for="positionCode" class="col-sm-5 control-label text-right"><mark>*</mark>&nbsp;직위</label>
					<div class="col-sm-7">
						<c:if test="${mode=='create'}">
							<select class="input-sm" id="positionCode" name="positionCode">
								 <option value="0">:::::::: 선택 ::::::::</option>
				                 <option value="1">사장</option>
				                 <option value="2">팀장</option>
				                 <option value="3">사원</option>
				                 <option value="4">아르바이트</option>
			               </select>
						</c:if>
						<c:if test="${mode=='info'}">
							<input type="text" name="positionName"
								class="form-control input-sm" id="positionName" placeholder="직위"
								value="${dto.positionName}" readonly="readonly">
						</c:if>
					</div>
				</div>
				<br>

			</div>

				<div style="width: 30%; float: left;" class="text-center">
					<img alt="" src="<%=cp%>/resource/images/person.jpg"
						style="padding: 10px; margin-top: 10px; width: 200px; height: 250px;"><br>
				</div>


			<div style="clear: both"></div>
			<div>

				<div class="form-group"
					style="margin: 20px auto 0px; border-spacing: 0px;">
					<label for="task" class="col-sm-2 control-label text-right">업무</label>
					<div class="col-sm-6" style="padding: 0 0 15px 15px;">
						<c:if test="${mode=='create'}">
							<input type="text" class="form-control" name="task"
								placeholder="업무" value="${dto.task}"
								style='border: none;'>
						</c:if>
						<c:if test="${mode=='info'}">
							<input type="text" class="form-control" id="task" 
								placeholder="업무" value="${dto.task}" readonly="readonly"
								style='border: none;'>
						</c:if>
					</div>
				</div>

				<br>
				<br>

				<div class="form-group"
					style="margin: 20px auto 0px; border-spacing: 0px;">
					<label for="careerDate" class="col-sm-2 control-label text-right">발령일자</label>
					<div class="col-sm-6" style="padding: 0 0 15px 15px;">
						<c:if test="${mode=='create'}">
							<input type="text" class="form-control" name="careerDate" id="inputDate"
								placeholder="YYYY-MM-DD" value="${dto.careerDate}" 
								style='border: none;'>
						</c:if>
						<c:if test="${mode=='info'}">
							<input type="text" class="form-control" id="careerDate" 
								placeholder="발령일자" value="${dto.careerDate}" readonly="readonly"
								style='border: none;'>
						</c:if>
					</div>
				</div>

				<br>
				<br>

				<div class="form-group"
					style="margin: 20px auto 0px; border-spacing: 0px;">
					<label for="careerDate" class="col-sm-2 control-label text-right">메모</label>
					<div class="col-sm-6" style="padding: 0 0 15px 15px;">
						<c:if test="${mode=='create'}">
							<input type="text" class="form-control" name="memo"
								placeholder="메모" value="${dto.memo}" 
								style='border: none;'>
						</c:if>
						<c:if test="${mode=='info'}">
							<input type="text" class="form-control" id="memo"
								placeholder="메모" value="${dto.memo}" readonly="readonly"
								style='border: none;'>
						</c:if>
					</div>
				</div>
				
				<br><br>
				<br>

				<table style="margin: 0px auto; border-spacing: 0px;">
					<tr height="30">
						<td align="center">
							<c:if test="${mode=='create'}">
								
								<button type="button" name="sendButton" class="btn btn-default"
									onclick="sendOk();">입력</button>
							</c:if>
							<c:if test="${mode=='info'}">
								<button type="button" name="sendButton" class="btn btn-default"
									onclick="deleteCareer('${dto.careerCode}');">삭제</button>
							</c:if>
							<button type="button" class="btn btn-default	"
								onclick="javascript:location.href='<%=cp%>/career/list?${query }';">리스트</button>
						</td>
					</tr>
					<tr height="30">
						<td align="center" style="color: blue;">${message}</td>
					</tr>
				</table>

			</div>

			<div id="resultStaff"></div>
		</form>



	</div>
</div>
