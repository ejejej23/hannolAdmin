<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<style>
.gitf-form-control{
	background: url(<%=cp%>/resource/images/item_list.png) no-repeat right 2px;
}

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

.custom_h2 {
    padding-left: 2px;
    margin-bottom: 8px;
    font-size: 20px;
    font-weight: 700;
    color: #333;
}

.custom_table {
    width: 100%;
    border-top: 2px solid #cecece;
}

.custom_col1 {
    width: 15%;
    background: #f8f8f8;
    border: solid #e4e4e4;
    border-width: 0 1px 1px 0;
    padding: 7px 10px 7px 15px;
    font-weight: bold;
    text-align: left;
}

.customer_col2 {
	width: 35%;
    border-bottom: 1px solid #e4e4e4;
    padding: 10px 16px;
}

.pay_price {
    border-top: 2px solid #cecece;
}

.col_title {
    vertical-align: top;
    text-align: right;
    padding-right: 10px;
    border-right: 1px solid #e4e4e4;
    border-bottom: 1px solid #e4e4e4;
    background: #f4f4f4;
}

.price {
    display: inline-block;
    padding-left: 17px;  
    padding-bottom: 10px;
    width: 100px;
}

.table_col{
	border-bottom: 1px solid #e4e4e4;
}

select {
    height: 23px;
    font-size: 12px;
    vertical-align: middle;
}

.pay-type-section {
    padding: 10px 0;
    margin: 0;
    line-height: 21px;
    border-bottom: 1px solid #e4e4e4;
}

.line-title {
    display: inline-block;
    width: 90px;
    font-size: 12px;
    font-weight: bold;
    margin: 0;
    vertical-align: middle;
    padding-left: 15px;
}

.pay-type-section .line-title:before {
    content: "";
    position: relative;
    display: inline-block;
    width: 3px;
    height: 3px;
    margin-left: 2px;
    margin-right: 4px;
    vertical-align: middle;
    background: #55575f;
}

.col_th {
    width: 20%;
    border: solid #e4e4e4;
    border-width: 0 1px 1px 0;
    padding: 7px 10px 7px 15px;
    font-weight: bold;
    text-align: left;
    background: #f4f4f4;
}

.col_td {
	width: 80%;
    border-bottom: 1px solid #e4e4e4;
    padding: 10px 16px;
}

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
	
function gradeUpdate(){
	$("#gradeModal").dialog({
		title:"등급수정",
		width:300,
		height:260,
		modal:true,
		show:"clip",
		hide:"clip"
	});
}

function sendGrade(){
	var f = document.gradeForm;
	f.action="<%=cp%>/member/gradeUpdate";
    f.submit();
}

function sendEnabled(){
	var f = document.inOutForm;
	f.action="<%=cp%>/member/inOutUpdate";
    f.submit();
}

function inOut(){
	$("#inOutModal").dialog({
		title:"탈퇴/복구",
		width:300,
		height:260,
		modal:true,
		show:"clip",
		hide:"clip"
	});
}

$(function(){
	$("#memberGrade").change(function(){
		var grade = $("#memberGrade option:selected").val();
		$("#gradeCode").val(grade);
	});
	$("#memberGrade > option[value='${dto.gradeCode}']").attr("selected","selected");
});
</script>

<div class="sub-container" style="width: 960px;">
    <div class="sub-title">
		<h3>
			회원 <small>상세정보</small>
		</h3>
	</div>

	<div>
		<h2 class="custom_h2">기본정보</h2>
		<table class="custom_table">
		  <tbody>
				<tr>
					<th class="custom_col1">
						회원 코드
					</th>
					<td class="customer_col2">
						${dto.usersCode}
					</td>
					<th class="custom_col1">
						등급
					</th>
					<td class="customer_col2">
						${dto.gradeName}
					</td>
				</tr>
				<tr>
					<th class="custom_col1">
						아이디
					</th>
					<td class="customer_col2">
						${dto.memberId}
					</td>
					<th class="custom_col1">
						이름
					</th>
					<td class="customer_col2">
						${dto.memberName}
					</td>
				</tr>
				<tr>
					<th class="custom_col1">
						생년월일
					</th>
					<td class="customer_col2">
						${dto.birth}
					</td>
					<th class="custom_col1">
						전화번호
					</th>
					<td class="customer_col2">
						${dto.tel}
					</td>
				</tr>
		  </tbody>
		</table>
		
		<h2 class="custom_h2" style="margin-top: 35px;">상세정보</h2>
		<table class="custom_table">
			<tr>
				<th class="col_th">
					이메일
				</th>
				<td colspan="3" class="col_td">
					${dto.email}
				</td>
			</tr>
			<tr>
				<th class="col_th">
					우편번호
				</th>
				<td colspan="3" class="col_td">
					${dto.post}
				</td>
			</tr>
			<tr>
				<th class="col_th">
					주소
				</th>
				<td colspan="3" class="col_td">
					${dto.addr1}
				</td>
			</tr>
			<tr>
				<th class="col_th">
					상세주소
				</th>
				<td colspan="3" class="col_td">
					${dto.addr2}
				</td>
			</tr>
			<tr>
				<th class="col_th">
					가입일
				</th>
				<td class="col_td" style="width: 30%;">
					${dto.joinDate}
				</td>
				<th class="col_th">
					가입경로
				</th>
				<td class="col_td" style="width: 30%;">
					${dto.joinPath}
				</td>
			</tr>
			<tr>
				<th class="col_th">
					우대사항
				</th>
				<td colspan="3" class="col_td">
					${dto.help}
				</td>
			</tr>
			<tr>
				<th class="col_th">
					탈퇴여부
				</th>
				<td colspan="3" class="col_td">
					${dto.isMember}
				</td>
			</tr>
		</table>
		
		<table style="margin: 35px auto; border-spacing: 0px;">
			<tr height="30">
				<td align="center">
				<button type="button" name="gradeButton" class="btn btn-default" onclick="gradeUpdate();">등급수정</button>
					<button type="button" name="InOutButton" class="btn btn-default" onclick="inOut()">탈퇴/복구</button>
					<button type="button" class="btn btn-default	"
						onclick="javascript:location.href='<%=cp%>/member/list?page=${page}';">리스트</button>
				</td>
			</tr>
		</table>
		
		<div id="gradeModal" class="modal">
			<form name="gradeForm">
				<table class="modalTable">
					<tr>
						<th scope="row">등급</th>
						<td><select class="input-sm" id="memberGrade" name="memberGrade">
							<c:forEach var="dto" items="${list}">
								<option value="${dto.gradeCode}">${dto.gradeName}</option>
							</c:forEach>
						</select></td>
					</tr>
				</table>

				<div class="btnBox">
					<button type="button" class="btn btn-default" onClick="sendGrade()"
						id="btnGradeSendOk">등급수정</button>
					<input type="hidden" id="gradeCode" name="gradeCode">
					<input type="hidden" name="num" value="${dto.usersCode}">
					<input type="hidden" name="page" value="${page}">
				</div>

				<div id="setMemoAuth"></div>
			</form>
		</div>
		
		<div id="inOutModal" class="modal">
			<form name="inOutForm">
				<table class="modalTable">
					<tr>
						<td align="center">
							<c:if test="${dto.enabled == 1}">
								이 회원을 탈퇴시키겠습니까?
							</c:if>
							<c:if test="${dto.enabled == 0}">
								이 회원의 계정을 복구시키겠습니까?
							</c:if>
						</td>
					</tr>
				</table>

				<div class="btnBox">
					<button type="button" class="btn btn-default" onClick="sendEnabled()" id="btnEnabledSendOk">${dto.enabled == 1?'탈퇴시키기':'복구시키기'}</button>
					<input type="hidden" name="num" value="${dto.usersCode}">
					<input type="hidden" name="page" value="${page}">
					<c:if test="${dto.enabled == 1}">
						<input type="hidden" name="enabled" value="0">
					</c:if>
					<c:if test="${dto.enabled == 0}">
						<input type="hidden" name="enabled" value="1">
					</c:if>
				</div>
			</form>
		</div>
		
	</div>
</div>