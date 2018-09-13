<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<script type="text/javascript">
function authorityUpdate(){
	$("#authorityModal").dialog({
		title:"권한수정",
		width:300,
		height:300, 
		modal:true,
		show:"clip",
		hide:"clip"
	});
}

function inoutUpdate(){
	$("#inoutModal").dialog({
		title:"입사/퇴사처리",
		width:300,
		height:300, 
		modal:true,
		show:"clip",
		hide:"clip"
	});
}

function sendAuth(){
	
	var authority = $("#staffAuth option:selected").val();
	
	var url = "<%=cp%>/staff/updateAuth";
		var query = "usersCode=" + ${dto.usersCode}+"&authority=" + authority;

		$.ajax({
			type : "post"
			,url : url //서버의 주소
			,data : query //서버로 보내는 값
			,success : function(data) {
				$("#resultStaff").html("권한수정완료!");

				if(data.authority=="ROLE_ADMIN"){
					$("#authority").val("관리자");
				}else{
					$("#authority").val("일반직원");
				}
				
				$("#authorityModal").dialog("close");
			}
			,error : function(e) {
				alert(e.responseText);
				$("#resultStaff").html("갱신에러발생!");
			}
		});
	}
	
function sendInout(){
	
	var str="";

    str = $("#inoutDate").val();
    if(!str || !isValidDateFormat(str)) {
        alert("날짜형식를 확인하세요[YYYY-MM-DD]. ");
        $("#inoutDate").val("");
        $("#inoutDate").focus();
        return;
    }
	
    str = $("#memoInout").val();
    
    if(!str) {
        $("#setMemoInout").html("사유를 입력하세요. ");
        $("#memoInout").focus();
        return;
    }
	
	var staffInout = $("#staffInout").val();
	var inoutDate = $("#inoutDate").val();
	var memoInout = $("#memoInout").val();
	
	var url = "<%=cp%>/staff/updateInout";
		var query = "usersCode=" + ${dto.usersCode}+"&gubun="+staffInout+"&inoutDate=" + inoutDate + "&memo=" + memoInout;

		$.ajax({
			type : "post"
			,url : url //서버의 주소
			,data : query //서버로 보내는 값
			,dataType : "json"
			,success : function(data) {
				$("#resultStaff").html("입사/퇴사 처리완료!");
				
				//입사퇴사일 변경 , 재직여부 표시변경
				if(data.working == 1){
					$("#working").html("재직중");
					$("#inDate").html(data.epDate);
				}else{
					$("#working").html("퇴사");
					$("#outDate").html(data.epDate);
				}
				
				$("#inoutModal").dialog("close");
			},
			error : function(e) {
				alert(e.responseText);
				$("#resultStaff").html("갱신에러발생!");
			}
		});
	}
</script>

<div class="sub-container" align="center">

	<div class="sub-title">
		<h3>
			발령 <small>상세정보</small>
		</h3>
	</div>

	<div style="width: 900px; border-spacing: 0px;">
		<form name="staffForm" id="staffForm" method="post">

			<div style="float: left; width: 40%">
				<div class="form-group" style="margin: 20px auto 0px;">
					<label for="usersCode" class="col-sm-5 control-label text-right"><mark>*</mark>&nbsp;사원번호</label>
					<div class="col-sm-7">
						<input type="text" name="usersCode" class="form-control input-sm"
							id="usersCode" placeholder="사원번호" value="${dto.usersCode}"
							readonly>
					</div>
				</div>
				<br>
				<div class="form-group" style="margin: 20px auto 0px;">
					<label for="authority" class="col-sm-5 control-label text-right"><mark>*</mark>&nbsp;권한</label>
					<div class="col-sm-7">
						<input type="text" name="authority" class="form-control input-sm"
							id="authority" placeholder="권한"
							value="${dto.authority=='ROLE_ADMIN'?'관리자':'일반직원'}" readonly>
					</div>
				</div>
				<br>
				<div class="form-group" style="margin: 20px auto 0px;">
					<label for="themeName" class="col-sm-5 control-label text-right"><mark>*</mark>&nbsp;테마</label>
					<div class="col-sm-7">
						<input type="text" name="themeName" class="form-control input-sm"
							id="themeName" placeholder="테마명" value="${dto.themeName}"
							readonly>
					</div>
				</div>
				<br>
				<div class="form-group" style="margin: 20px auto 0px;">
					<label for="dpName" class="col-sm-5 control-label text-right"><mark>*</mark>&nbsp;부서</label>
					<div class="col-sm-7">
						<input type="text" name="dpName" class="form-control input-sm"
							id="dpName" placeholder="부서명" value="${dto.dpName}" readonly>
					</div>
				</div>
				<br>
				<div class="form-group" style="margin: 20px auto 0px;">
					<label for="positionName" class="col-sm-5 control-label text-right"><mark>*</mark>&nbsp;직위</label>
					<div class="col-sm-7">
						<input type="text" name="positionName"
							class="form-control input-sm" id="positionName" placeholder="직위"
							value="${dto.positionName}" readonly>
					</div>
				</div>
				<br>
				<div class="form-group" style="margin: 20px auto 0px;">
					<label for="staffId" class="col-sm-5 control-label text-right"><mark>*</mark>&nbsp;아이디</label>
					<div class="col-sm-7">
						<input name="userId" type="text" class="form-control input-sm"
							id="staffId" placeholder="아이디" value="${dto.staffId}"
							onchange="userIdCheck();" readonly>
					</div>
				</div>
				<br>
				<div class="form-group" style="margin: 20px auto 0px;">
					<label for="name" class="col-sm-5 control-label text-right"><mark>*</mark>&nbsp;이름</label>
					<div class="col-sm-7">
						<input type="text" name="name" class="form-control input-sm"
							id="userName" placeholder="이름" value="${dto.name}">
					</div>
				</div>
				<br>



				<div class="form-group" style="margin: 20px auto 0px;">
					<label for="birth" class="col-sm-5 control-label text-right"><mark>*</mark>&nbsp;생년월일</label>
					<div class="col-sm-7">
						<input type="text" class="form-control input-sm" id="birth"
							name="birth" placeholder="YYYY-MM-DD" value="${dto.birth}">
					</div>
				</div>
				<br>
				<div class="form-group" style="margin: 20px auto 0px;">
					<label for="email" class="col-sm-5 control-label text-right"><mark>*</mark>&nbsp;이메일</label>
					<div class="col-sm-7">
						<input type="text" class="form-control input-sm" id="email"
							name="email" placeholder="이메일" value="${dto.email}">
					</div>
				</div>

			</div>

			<c:if test="${mode=='update'}">
				<div style="width: 30%; float: left;" class="text-center">
					<img alt="" src="<%=cp%>/resource/images/person.jpg"
						style="padding: 10px; margin-top: 10px; width: 200px; height: 250px;"><br>
				</div>
			</c:if>


			<div style="clear: both"></div>
			<div>
				<div class="form-group" style="margin: 20px auto 0px;">
					<label for="tel2" class="col-sm-2 control-label text-right">전화번호</label>
					<div class="col-sm-6">
						<select class="input-sm" id="tel1" name="tel1">
							<option ${dto.tel1=="010" ? "selected='selected'" : ""}>010</option>
							<option ${dto.tel1=="011" ? "selected='selected'" : ""}>011</option>
							<option ${dto.tel1=="016" ? "selected='selected'" : ""}>016</option>
							<option ${dto.tel1=="017" ? "selected='selected'" : ""}>017</option>
							<option ${dto.tel1=="018" ? "selected='selected'" : ""}>018</option>
							<option ${dto.tel1=="019" ? "selected='selected'" : ""}>019</option>
						</select> - <input type="text" class="input-sm" id="tel2" name="tel2"
							value="${dto.tel2}"> - <input type="text"
							class="input-sm" id="tel3" name="tel3" value="${dto.tel3}">
					</div>
				</div>
				<br>
				<div class="form-group" style="margin: 20px auto 0px;">
					<label for="post" class="col-sm-2 control-label text-right">우편번호</label>
					<div class="col-sm-6">
						<div class="col-sm-4">
							<input type="text" class="form-control input-sm" id="post"
								name="post" value="${dto.post}" readonly="readonly"
								style='border: none;'>
						</div>
						<div class="col-sm-2">
							<button type="button" class="btn btn-default btn-sm"
								onclick="daumPostcode();">우편번호</button>
						</div>
					</div>
				</div>

				<br>

				<div class="form-group"
					style="margin: 20px auto 0px; border-spacing: 0px;">
					<label for="addr1" class="col-sm-2 control-label text-right">주소</label>
					<div class="col-sm-6" style="padding: 0 0 15px 15px;">
						<input type="text" class="form-control" id="addr1" name="addr1"
							placeholder="기본 주소" value="${dto.addr1}" readonly="readonly"
							style='border: none;'> <input type="text"
							class="form-control" id="addr2" name="addr2" placeholder="상세 주소"
							value="${dto.addr2}">
					</div>
				</div>

				<br>
				<br>
				<br>

				<div class="form-group"
					style="margin: 20px auto 0px; border-spacing: 0px;">
					<label for="task" class="col-sm-2 control-label text-right">업무</label>
					<div class="col-sm-6" style="padding: 0 0 15px 15px;">
						<input type="text" class="form-control" id="task" name="task"
							placeholder="업무" value="${dto.task}" readonly="readonly"
							style='border: none;'>
					</div>
				</div>

				<br>
				<br>

				<div class="form-group"
					style="margin: 20px auto 0px; border-spacing: 0px;">
					<label for="working" class="col-sm-2 control-label text-right">재직여부</label>
					<div class="col-sm-6" style="padding: 0 0 15px 15px;">
						<input type="text" class="form-control" id="working"
							placeholder="재직여부" value="${dto.working == 1?'재직중':'퇴사'}"
							readonly="readonly" style='border: none;'>
					</div>
				</div>

				<br>
				<br>

				<div class="form-group"
					style="margin: 20px auto 0px; border-spacing: 0px;">
					<label for="inDate" class="col-sm-2 control-label text-right">입사일</label>
					<div class="col-sm-6" style="padding: 0 0 15px 15px;">
						<input type="text" class="form-control" id="inDate" name="inDate"
							placeholder="입사일" value="${dto.inDate}" readonly="readonly"
							style='border: none;'>
					</div>
				</div>

				<br>
				<br>

				<div class="form-group"
					style="margin: 20px auto 0px; border-spacing: 0px;">
					<label for="outDate" class="col-sm-2 control-label text-right">퇴사일</label>
					<div class="col-sm-6" style="padding: 0 0 15px 15px;">
						<input type="text" class="form-control" id="outDate"
							name="outDate" placeholder="퇴사일" value="${dto.outDate}"
							readonly="readonly" style='border: none;'>
					</div>
				</div>

				<br>
				<br>
				<br>
				<br>
				<table style="margin: 0px auto; border-spacing: 0px;">
					<tr height="30">
						<td align="center">
							<button type="button" name="inoutButton" class="btn btn-default"
								onclick="inoutUpdate();">입사/퇴사</button>
							<button type="button" name="authorityButton"
								class="btn btn-default" onclick="authorityUpdate();">권한수정</button>
							<button type="button" name="sendButton" class="btn btn-default"
								onclick="memberOk();">정보수정</button>
							<button type="reset" class="btn btn-default">다시입력</button>
							<button type="button" class="btn btn-default	"
								onclick="javascript:location.href='<%=cp%>/career/list?${query }';">수정취소</button>
						</td>
					</tr>
					<tr height="30">
						<td align="center" style="color: blue;">${message}</td>
					</tr>
				</table>

			</div>

			<div id="resultStaff"></div>
		</form>

		<div id="authorityModal" class="modal">
			<form name="authForm">
				<table class="modalTable">
					<tr>
						<th scope="row">권한</th>
						<td><select class="input-sm" id="staffAuth" name="staffAuth">
								<option value="ROLE_ADMIN">관리자</option>
								<option value="ROLE_STAFF">일반직원</option>
						</select></td>
					</tr>
				</table>

				<div class="btnBox">
					<button type="button" class="btn btn-default" onClick="sendAuth()"
						id="btnAuthSendOk">권한수정</button>
				</div>

				<div id="setMemoAuth"></div>
			</form>
		</div>

		<div id="inoutModal" class="modal">
			<form name="inoutForm">
				<table class="modalTable">
					<tr>
						<th scope="row">구분</th>
						<td><select class="input-sm" id="staffInout" name="staffInout">
								<option value="1">입사</option>
								<option value="0">퇴사</option>
						</select></td>
					</tr>
					<tr>
						<th scope="row">처리일</th>
						<td><input type="text" name="inoutDate" id="inoutDate" class="boxTF" placeholder="YYYY-MM-DD"></td>
					</tr>
					<tr>
						<th scope="row">사유</th>
						<td><textarea name="memo" id="memoInout" rows="5" cols="22" class="boxTF"
								style="resize: none;"></textarea></td>
					</tr>
				</table>

				<div class="btnBox">
					<button type="button" class="btn btn-default" onClick="sendInout()"
						id="btnInoutSendOk">확인</button>
				</div>

				<div id="setMemoInout"></div>

			</form>
		</div>

	</div>
</div>
