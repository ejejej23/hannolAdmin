<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>
.selectField{
	margin-left: 15px;
	width: 200px;
}

#faqSelector {
	width: 100%;
}
</style>

<script type="text/javascript">
    function sendOk() {
        var f = document.faqForm;
        
        var gubun = f.gubunCode.value;
        if(!gubun){
        	 alert("구분을 선택해 주세요.");
             f.gubunCode.focus();
             return;
        }

    	var str = f.subject.value;
        if(!str) {
            alert("제목을 입력하세요. ");
            f.subject.focus();
            return;
        }

    	str = f.content.value;
        if(!str) {
            alert("내용을 입력하세요. ");
            f.content.focus();
            return;
        }

    	f.action="<%=cp%>/faq/${mode}";

        f.submit();
    }
    
    $(function(){
    	var msg = "${msg}";
    	if(msg != ""){
    		alert(msg);
    	}
    });
    
    <c:if test="${mode=='update'}">
	    $(function(){
	    	var faqGubun = "${dto.gubunCode}";
	    	$("#faqSelector").val(faqGubun);
	    });
    </c:if>
</script>

<div class="sub-container" style="width: 960px;">
    <div class="sub-title">
	  <h3>${mode=='created'? 'FAQ등록' : 'FAQ수정'}</h3>
	</div>
    
    <form role="form" name="faqForm" method="post"> 
    	<div class="form-group"> 
			<label for="subjectNoticeS" class="col-sm-2 control-label">구분</label> 
			<div class="col-sm-10"> 
				<select class="form-control" id="faqSelector" name="gubunCode">
				  <option value="">::구분::</option>
				<c:forEach items="${gubunlist}" var="gubun">
			      <option value="${gubun.gubunCode}">${gubun.gubunName}</option>
			     </c:forEach>
			    </select>
			</div> 
		</div>
		<div class="form-group"> 
			<label for="subjectNoticeS" class="col-sm-2 control-label">제목</label> 
			<div class="col-sm-10"> 
				<input name="subject" type="text" class="form-control" placeholder="제목을 작성해 주세요..."  value="${dto.subject}"> 
			</div> 
		</div> 
		<c:if test="${mode=='update'}">
		<div class="form-group"> 
			<label for="usernameNoticeS" class="col-sm-2 control-label">기존작성자</label> 
			<div class="col-sm-10"> 
				<input type="text" class="form-control" value="${dto.usersName}" readonly> 
			</div>  
		</div>
		</c:if>
		<div class="form-group"> 
			<label for="usernameNoticeS" class="col-sm-2 control-label">작성자</label> 
			<div class="col-sm-10"> 
				<input type="text" class="form-control" value="${sessionScope.staff.staffName}" readonly> 
			</div>  
		</div>
		<div class="form-group"> 
			<label for="contentNoticeS" class="col-sm-2 control-label">내용</label> 
			<div class="col-sm-10"> 
				<textarea name="content" class="form-control" rows="10">${dto.content}</textarea>
			</div>  
		</div>		
		
	 	<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		     <tr height="45"> 
		      <td align="center" >
		        <button type="button"  class="btn btn-info" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
		        <button type="reset" class="btn btn-default">다시입력</button>
		        <button type="button"  class="btn btn-default" onclick="javascript:location.href='<%=cp%>/faq/list?${query}';">${mode=='update'?'수정취소':'등록취소'}</button>
		        
		        <c:if test="${mode=='update'}">
		        	<input type="hidden" name="faqCode" value="${dto.faqCode}">
		        	<input type="hidden" name="page" value="${page}">
		        	<input type="hidden" name="searchValue" value="${searchValue}">
		        	<input type="hidden" name="tab" value="${tab}">
		        </c:if>
		      </td>
		    </tr>
		</table>
	</form>
    
</div>