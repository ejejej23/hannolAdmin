<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">
function memberOk() {
	var f = document.memberForm;
	var str;
	
    str = f.userName.value;
	str = str.trim();
    if(!str) {
        alert("이름을 입력하세요. ");
        f.userName.focus();
        return;
    }
    f.userName.value = str;
	
	str = f.userId.value;
	str = str.trim();
	if(!str) {
		alert("아이디를 입력하세요. ");
		f.userId.focus();
		return;
	}
	if(!/^[a-z][a-z0-9_]{4,9}$/i.test(str)) { 
		alert("아이디는 5~10자이며 첫글자는 영문자이어야 합니다.");
		f.userId.focus();
		return;
	}
	f.userId.value = str;

	str = f.userPwd.value;
	str = str.trim();
	if(!str) {
		alert("패스워드를 입력하세요. ");
		f.userPwd.focus();
		return;
	}
	if(!/^(?=.*[a-z])(?=.*[!@#$%^*+=-]|.*[0-9]).{5,10}$/i.test(str)) { 
		alert("패스워드는 5~10자이며 하나 이상의 숫자나 특수문자가 포함되어야 합니다.");
		f.userPwd.focus();
		return;
	}
	f.userPwd.value = str;

	if(str!= f.userPwdCheck.value) {
        alert("패스워드가 일치하지 않습니다. ");
        f.userPwdCheck.focus();
        return;
	}


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
    
    str = f.email1.value;
	str = str.trim();
    if(!str) {
        alert("이메일을 입력하세요. ");
        f.email1.focus();
        return;
    }

    str = f.email2.value;
	str = str.trim();
    if(!str) {
        alert("이메일을 입력하세요. ");
        f.email2.focus();
        return;
    }

    var mode="${mode}";
    
    if(mode=="created")
   		f.action = "<%=cp%>/member/member";
	else
   		f.action = "<%=cp%>/member/update";

    f.submit();
}

function changeEmail() {
    var f = document.memberForm;
	    
    var str = f.selectEmail.value;
    if(str!="direct") {
        f.email2.value=str; 
        f.email2.readOnly = true;
        f.email1.focus(); 
    }
    else {
        f.email2.value="";
        f.email2.readOnly = false;
        f.email1.focus();
    }
}

function userIdCheck() {
	var str = $("#userId").val();
	str = str.trim();
	if(!/^[a-z][a-z0-9_]{4,9}$/i.test(str)) { 
		$("#userId").focus();
		return;
	}
	
	var url="<%=cp%>/member/userIdCheck";
	var q="userId="+str;
	
	$.ajax({
		type:"post"
		,url:url
		,data:q
		,dataType:"json"
		,success:function(data) {
			var p=data.passed;
			if(p=="true") {
				var s="<span style='color:blue;font-weight:bold;'>"+str+"</span> 아이디는 사용 가능합니다.";
				$("#userId").parent().next(".help-block").html(s);
			} else {
				var s="<span style='color:red;font-weight:bold;'>"+str+"</span> 아이디는 사용할 수 없습니다.";
				$("#userId").parent().next(".help-block").html(s);
				$("#userId").val("");
				$("#userId").focus();
			}
		}
	    ,error:function(e) {
	    	console.log(e.responseText);
	    }
	});

}

function authorityUpdate(){
	alert("test");
	
}

</script>

<div class="sub-container"  align="center">
    
    <div class="sub-title">
	  <h3>직원 <small>상세정보</small></h3>
	</div> 
    
    <div style="width: 900px; border-spacing: 0px;">
		<form name="memberForm" method="post">
		
			<div style="float: left; width: 40%">	
				<div class="form-group" style="margin: 20px auto 0px;"> 
					<label for="usersCode" class="col-sm-5 control-label text-right"><mark>*</mark>&nbsp;사원번호</label> 
					<div class="col-sm-7"> 
						<input type="text" name="usersCode" class="form-control input-sm" 
						id="usersCode" placeholder="사원번호" value="${dto.usersCode}" readonly> 
					</div> 
				</div>
				<br>
				<div class="form-group" style="margin: 20px auto 0px;"> 
					<label for="authority" class="col-sm-5 control-label text-right"><mark>*</mark>&nbsp;권한</label> 
					<div class="col-sm-7"> 
						<input type="text" name="authority" class="form-control input-sm" 
						id="authority" placeholder="권한" value="${dto.authority}" readonly> 
					</div> 
				</div>
				<br>
				<div class="form-group" style="margin: 20px auto 0px;"> 
					<label for="themeName" class="col-sm-5 control-label text-right"><mark>*</mark>&nbsp;테마</label> 
					<div class="col-sm-7"> 
						<input type="text" name="themeName" class="form-control input-sm" 
						id="themeName" placeholder="테마명" value="${dto.themeName}" readonly> 
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
						<input type="text" name="positionName" class="form-control input-sm" 
						id="positionName" placeholder="직위" value="${dto.positionName}" readonly> 
					</div> 
				</div>
				<br>
				<div class="form-group" style="margin: 20px auto 0px;"> 
					<label for="staffId" class="col-sm-5 control-label text-right"><mark>*</mark>&nbsp;아이디</label> 
					<div class="col-sm-7"> 
						<input name="userId" type="text" class="form-control input-sm" 
						id="staffId" placeholder="아이디"  value="${dto.staffId}"
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
						<input type="text" class="form-control input-sm" id="birth" placeholder="YYYY-MM-DD" value="${dto.birth}"> 
					</div>
				</div>
			  	<br>
				<div class="form-group" style="margin: 20px auto 0px;"> 
					<label for="email" class="col-sm-5 control-label text-right"><mark>*</mark>&nbsp;이메일</label> 
					<div class="col-sm-7"> 
						<input type="text" class="form-control input-sm" id="email" placeholder="이메일" value="${dto.email}"	> 
					</div> 
				</div>
				
			</div>	
				
		    <c:if test="${mode=='update'}">
				<div style="width:30%; float: left;" class="text-center"> 
			    	<img alt="" src="<%=cp%>/resource/images/person.jpg" style="padding: 10px; margin-top:10px; width:200px; height:250px;"><br>
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
						</select>
						- <input type="text" class="input-sm" id="tel2" name="tel2" value="${dto.tel2}">
						- <input type="text" class="input-sm" id="tel3" name="tel3" value="${dto.tel3}"> 
					</div> 
				</div>
				<br>
				<div class="form-group" style="margin: 20px auto 0px;"> 
					<label for="post" class="col-sm-2 control-label text-right">우편번호</label> 
					<div class="col-sm-6"> 
						<div class="col-sm-4">
							<input type="text" class="form-control input-sm" id="post" name="post" value="${dto.post}" readonly="readonly" style='border:none;'> 
						</div><div class="col-sm-2">
							<button type="button" class="btn btn-default btn-sm" onclick="daumPostcode();">우편번호</button>
						</div>
					</div> 
				</div>
				
				<br>			
					
				<div class="form-group" style="margin: 20px auto 0px; border-spacing: 0px;"> 
					<label for="addr1" class="col-sm-2 control-label text-right">주소</label> 
					<div class="col-sm-6" style="padding: 0 0 15px 15px;"> 
						<input type="text" class="form-control" id="addr1" name="addr1" placeholder="기본 주소" value="${dto.addr1}" readonly="readonly" style='border:none;'> 
						<input type="text" class="form-control" id="addr2" name="addr2" placeholder="상세 주소" value="${dto.addr2}"> 
					</div> 
				</div> 
				
				<br><br><br> 
				
				<div class="form-group" style="margin: 20px auto 0px; border-spacing: 0px;"> 
					<label for="task" class="col-sm-2 control-label text-right">업무</label> 
					<div class="col-sm-6" style="padding: 0 0 15px 15px;"> 
						<input type="text" class="form-control" id="task" name="task" placeholder="업무" value="${dto.task}" readonly="readonly" style='border:none;'> 
					</div> 
				</div> 
				
				<br><br>
				
				<div class="form-group" style="margin: 20px auto 0px; border-spacing: 0px;"> 
					<label for="working" class="col-sm-2 control-label text-right">재직여부</label> 
					<div class="col-sm-6" style="padding: 0 0 15px 15px;"> 
						<input type="text" class="form-control" id="working" name="working" placeholder="재직여부" value="${dto.working == 1?'재직중':'퇴사'}" readonly="readonly" style='border:none;'> 
					</div> 
				</div> 
				
				<br><br><br>
				<table style="margin: 0px auto; border-spacing: 0px;">
				   <tr height="30"> 
				    <td align="center" >
				      <button type="button" name="authorityButton" class="btn btn-default" onclick="authorityUpdate();">권한수정</button>
				      <button type="button" name="sendButton" class="btn btn-default" onclick="memberOk();">정보수정</button>
				      <button type="reset" class="btn btn-default">다시입력</button>
				      <button type="button" class="btn btn-default	" onclick="javascript:location.href='<%=cp%>/staff/list?${query }';">수정취소</button>
				    </td>
				  </tr>
				  <tr height="30">
				      <td align="center" style="color: blue;">${message}</td>
				  </tr>
				</table>
			
			</div>
			
		</form>
       </div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> 
<script>
    function daumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
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
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('addr1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('addr2').focus();
            }
        }).open();
    }
</script>     
     
</div>