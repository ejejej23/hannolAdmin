<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
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


function memberOk() {
	var f = document.staffForm;
	var test = f.length;
	var mode="${mode}";
    	
	var str="";

    str = f.birth.value;
	str = str.trim();
    if(!str || !isValidDateFormat(str)) {
        alert("생년월일를 입력하세요[YYYY-MM-DD]. ");
        f.birth.focus();
        return;
    }
    
    str = f.tel1.value;
	str = str.trim();
    if(!str) {
        alert("전화번호를 입력하세요. ");
        f.tel1.focus();
        return;
    }

    str = f.tel2.value;
	str = str.trim();
    if(!str) {
        alert("전화번호를 입력하세요. ");
        f.tel2.focus();
        return;
    }
    if(!/^(\d+)$/.test(str)) {
        alert("숫자만 가능합니다. ");
        f.tel2.focus();
        return;
    }

    str = f.tel3.value;
	str = str.trim();
    if(!str) {
        alert("전화번호를 입력하세요. ");
        f.tel3.focus();
        return;
    }
    if(!/^(\d+)$/.test(str)) {
        alert("숫자만 가능합니다. ");
        f.tel3.focus();
        return;
    }
    
    str = f.email.value;
	str = str.trim();
    if(!str) {
        alert("이메일을 입력하세요. ");
        f.email.focus();
        return;
    }

    
   	var url = "<%=cp%>/staff/update";
	var query = $("#staffForm").serialize();
	
	$.ajax({
		type:"post"
		,url:url	//서버의 주소
		,data:query	//서버로 보내는 값
		,dataType:"json"
		,success:function(data){
			$("#resultStaff").html("수정완료!");
		}
		,error:function(e){
			alert(e.responseText);
			$("#resultStaff").html("갱신에러발생!");	
		}
	}); 
}

function authorityUpdate(){
	$("#authorityModal").dialog({
		title:"권한수정",
		width:300,
		height:260,
		modal:true,
		show:"clip",
		hide:"clip"
	});
}

function inoutUpdate(){
	$("#inoutModal").dialog({
		title:"입사/퇴사처리",
		width:460,
		height:440, 
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
			직원 <small>상세정보</small>
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
								onclick="javascript:location.href='<%=cp%>/staff/list?${query }';">수정취소</button>
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

		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	</div>
</div>

	<script>
		function daumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullAddr = ''; // 최종 주소 변수
					var extraAddr = ''; // 조합형 주소 변수

					// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						fullAddr = data.roadAddress;

					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						fullAddr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
					if (data.userSelectedType === 'R') {
						//법정동명이 있을 경우 추가한다.
						if (data.bname !== '') {
							extraAddr += data.bname;
						}
						// 건물명이 있을 경우 추가한다.
						if (data.buildingName !== '') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
						fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')'
								: '');
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('post').value = data.zonecode; //5자리 새우편번호 사용
					document.getElementById('addr1').value = fullAddr;

					// 커서를 상세주소 필드로 이동한다.
					document.getElementById('addr2').focus();
				}
			}).open();
		}
	</script>