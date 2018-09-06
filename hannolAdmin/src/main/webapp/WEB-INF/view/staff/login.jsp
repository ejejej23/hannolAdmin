<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style type="text/css">
.lbl {
   position:absolute; 
   margin-left:15px; margin-top: 17px;
   color: #999999; font-size: 11pt;
}
.loginTF {
  width: 300px; height: 35px;
  padding: 5px;
  padding-left: 15px;
  border:1px solid #999999;
  color:#333333;
  margin-top:5px; margin-bottom:5px;
  font-size:14px;
  border-radius:4px;
}
</style>

<script type="text/javascript">
function bgLabel(ob, id) {
    if(!ob.value) {
	    document.getElementById(id).style.display="";
    } else {
	    document.getElementById(id).style.display="none";
    }
}

function sendLogin() {
    var f = document.loginForm;

	var str = f.staffId.value;
    if(!str) {
        alert("아이디를 입력하세요. ");
        f.staffId.focus();
        return;
    }

    str = f.staffPwd.value;
    if(!str) {
        alert("패스워드를 입력하세요. ");
        f.staffPwd.focus();
        return;
    }

    f.action = "<%=cp%>/staff/login";
    f.submit();
}
</script>

<div class="body-container">
    <div style="margin: 0px auto; padding-top:90px; width:440px;" align="center">
		<form name="loginForm" method="post" action="">
		  <table style="margin: 15px auto; width: 360px; border-spacing: 0px;" >
		  <tr align="center"> 
		      <td height="60"> 
		        <input type="text" name="staffId" id="staffId" class="loginTF" maxlength="15"
		                   tabindex="1"
                           onfocus="document.getElementById('lblStaffId').style.display='none';"
                           onblur="bgLabel(this, 'lblStaffId');" style="border: none; border-bottom: 1px solid #ccc" placeholder="아이디">
		      </td>
		      <td rowspan="2">
		        <button type="button" onclick="sendLogin();" class="btnConfirm">로그인</button>
		      </td>
		  </tr>
		  <tr align="center" height="60"> 
		      <td>
		        <input type="password" name="staffPwd" id="staffPwd" class="loginTF" maxlength="20" 
		                   tabindex="2"
                           onfocus="document.getElementById('lblStaffPwd').style.display='none';"
                           onblur="bgLabel(this, 'lblStaffPwd');" style="border: none; border-bottom: 1px solid #ccc" placeholder="패스워드">
		      </td>
		  </tr>

		  <tr align="center" height="45">
		      <td colspan="2">
		       		<a href="<%=cp%>/">아이디찾기</a>
		       		&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
		       		<a href="<%=cp%>/">패스워드찾기</a>
		      </td>
		  </tr>
		  
		  <tr align="center" height="40" >
		    	<td><span style="color: blue;">${message}</span></td>
		  </tr>
		  </table>
		</form>           
	</div>
</div>