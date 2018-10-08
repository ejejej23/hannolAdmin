<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<script type="text/javascript">
function deleteGuide(data) {
		var query = "${query}";
		var url = "<%=cp%>/guide/delete?" + query+"&usersCodeM=${dto.usersCodeM}";
		
		if(confirm("위 자료를 삭제 하시 겠습니까 ? ")) {
				location.href=url;
		}
}

function sendOk() {
	
    <%-- var f = document.infoForm;

	var str = f.careerDate.value;
    if(!str || !isValidDateFormat(str)) {
        alert("날짜형식를 확인하세요[YYYY-MM-DD]. ");
        $("#inputDate").val("");
        $("#inputDate").focus();
        return;
    }
	var s = $("#dpCode option:selected").val();

	f.action="<%=cp%>/guide/createBook";
    f.submit(); --%>
}
</script>

<div class="sub-container" align="center">

	<div class="sub-title">
		<h3>
			가이드 <small>상세정보</small>
		</h3>
	</div>

	<div style="width: 900px; border-spacing: 0px;">
		<form  name="infoForm" id="infoForm" method="post" >

			<div style="float: left; width: 40%">
				<div class="form-group" style="margin: 80px auto 0px;">
					<label for="usersCode" class="col-sm-5 control-label text-right"><mark>*</mark>&nbsp;일정코드</label>
					<div class="col-sm-7">
						<input type="text" name="schCode" class="form-control input-sm"
							id="schCode" placeholder="스케쥴코드" value="${dto.schCode}"
							readonly="readonly">
					</div>
				</div>
				<br><br>
				
				<div class="form-group" style="margin: 10px auto 0px;">
					<label for="workDate" class="col-sm-5 control-label text-right"><mark>*</mark>&nbsp;근무일자</label>
					<div class="col-sm-7">
						<input type="text" name="workDate" class="form-control input-sm"
							id="workDate" placeholder="근무일자" value="${dto.workDate}" disabled="disabled"
							readonly="readonly">
					</div>
				</div>
				
				<br>
				<div class="form-group" style="margin: 20px auto 0px;">
					<label for="timezone" class="col-sm-5 control-label text-right"><mark>*</mark>&nbsp;구분</label>
					<div class="col-sm-7">
							<input type="text" name="timezone" class="form-control input-sm"
								id="timezone" placeholder="(오전/오후)" value="${dto.timezone==1?'오전':'오후'}" readonly="readonly">
					</div>
				</div>
				<br>
				<div class="form-group" style="margin: 20px auto 0px;">
					<label for="role" class="col-sm-5 control-label text-right"><mark>*</mark>&nbsp;역할</label>
					<div class="col-sm-7">
							<input type="text" name="role"
								class="form-control input-sm" id="role" placeholder="역할"
								value="${dto.role}" readonly="readonly">
					</div>
				</div>
				<br>
				<div class="form-group" style="margin: 20px auto 0px;">
					<label for="memo" class="col-sm-5 control-label text-right"><mark>*</mark>&nbsp;상세정보</label>
					<div class="col-sm-7">
							<input type="text" name="memo"
								class="form-control input-sm" id="memo" placeholder="상세정보"
								value="${dto.memo}" readonly="readonly">
					</div>
				</div>
				<br>
			</div>

				<div style="width: 30%; float: left;" class="text-center">
					<img alt="" src="<%=cp%>/resource/images/${roleImg}"
						style="padding: 10px; margin-top: 60px; width: 200px; height: 250px;"><br>
				</div>


			<div style="clear: both"></div>
			<div>
			
				<div class="form-group"
					style="margin: 20px auto 0px; border-spacing: 0px;">
					<label for="memberId" class="col-sm-2 control-label text-right">예약자회원아이디</label>
					<div class="col-sm-6" style="padding: 0 0 15px 15px;">
						<c:if test="${mode=='create'}">
							<input type="text" class="form-control" name="memberId"
								placeholder="예약자회원아이디" value="${dto.memberId}"
								style='border: none;'>
						</c:if>
						<c:if test="${mode=='info'}">
							<input type="text" class="form-control" id="memberId" 
								placeholder="예약자회원아이디" value="${dto.usersCodeM==0?'없음':dto.memberId}" readonly="readonly"
								style='border: none;'>
						</c:if>
					</div>
				</div>

				<br>
				<br>

				<div class="form-group"
					style="margin: 20px auto 0px; border-spacing: 0px;">
					<label for="nameM" class="col-sm-2 control-label text-right">예약자이름</label>
					<div class="col-sm-6" style="padding: 0 0 15px 15px;">
						<c:if test="${mode=='create'}">
							<input type="text" class="form-control" name="nameM"
								placeholder="예약자이름" value="${dto.nameM}"
								style='border: none;'>
						</c:if>
						<c:if test="${mode=='info'}">
							<input type="text" class="form-control" id="nameM" 
								placeholder="예약자이름" value="${dto.nameM}" readonly="readonly"
								style='border: none;'>
						</c:if>
					</div>
				</div>

				<br>
				<br>
				
				<div class="form-group"
					style="margin: 20px auto 0px; border-spacing: 0px;">
					<label for="tel" class="col-sm-2 control-label text-right">예약자 연락처</label>
					<div class="col-sm-6" style="padding: 0 0 15px 15px;">
						<c:if test="${mode=='create'}">
							<input type="text" class="form-control" name="tel"
								placeholder="연락처" value="${dto.tel}" 
								style='border: none;'>
						</c:if>
						<c:if test="${mode=='info'}">
							<input type="text" class="form-control" id="tel"
								placeholder="연락처" value="${dto.tel}" readonly="readonly"
								style='border: none;'>
						</c:if>
					</div>
				</div>

				<br>
				<br>

				<div class="form-group"
					style="margin: 20px auto 0px; border-spacing: 0px;">
					<label for="bookDate" class="col-sm-2 control-label text-right">예약일자</label>
					<div class="col-sm-6" style="padding: 0 0 15px 15px;">
						<c:if test="${mode=='create'}">
							<input type="text" class="form-control" name="bookDate" id="inputDate"
								placeholder="YYYY-MM-DD" value="${dto.bookDate}" 
								style='border: none;'>
						</c:if>
						<c:if test="${mode=='info'}">
							<input type="text" class="form-control" id="bookDate" 
								placeholder="예약일자" value="${dto.bookDate}" readonly="readonly"
								style='border: none;'>
						</c:if>
					</div>
				</div>
				
				<br><br>
				<br>
				
				<input type="hidden" id="usersCode" name="usersCode" value="${dto.usersCode }">
				<input type="hidden" id="usersCodeM" name="usersCodeM" value="${dto.usersCodeM }">
				

				<table style="margin: 0px auto; border-spacing: 0px;">
					<tr height="30">
						<td align="center">
							<c:if test="${mode=='create'}">
								
								<button type="button" name="sendButton" class="btn btn-default"
									onclick="sendOk();">입력</button>
							</c:if>
							<c:if test="${mode=='info'}">
							<c:if test="${sessionScope.staff.authority == 'ROLE_ADMIN' }">
								<button type="button" name="sendButton" class="btn btn-default"
									onclick="deleteGuide('${dto.schCode}');">삭제</button>
							</c:if>
							</c:if>
							<button type="button" class="btn btn-default	"
								onclick="javascript:location.href='<%=cp%>/guide/list?${query }';">리스트</button>
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
