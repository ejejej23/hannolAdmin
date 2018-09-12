<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">
    function sendOk() {
        var f = document.noticeForm;

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

    	f.action="<%=cp%>/noticeS/${mode}";

        f.submit();
    }

    
    $(function(){
    	<c:if test="${not empty dto.isNotice}">
	    	var chk = ${dto.isNotice};
	    	var chkHere = $("#isNoticeS");
	    	
	    	if(chk==1){
	    		chkHere.prop("checked",true);
	    	}
    	</c:if>
    });
</script>

<div class="sub-container" style="width: 960px;">
    <div class="sub-title">
	  <h3>글쓰기</h3>
	</div>
    
    <form role="form" name="noticeForm" method="post" enctype="multipart/form-data"> 
		<div class="form-group"> 
			<label for="subjectNoticeS" class="col-sm-2 control-label">제목</label> 
			<div class="col-sm-10"> 
				<input name="subject" type="text" class="form-control" id="subjectNoticeS" placeholder="제목"  value="${dto.subject}"> 
			</div> 
		</div> 
		<div class="form-group"> 
			<label for="usernameNoticeS" class="col-sm-2 control-label">작성자</label> 
			<div class="col-sm-10"> 
				<input type="text" class="form-control" id="usernameNoticeS" placeholder="작성자" value="${sessionScope.staff.staffName}" readonly> 
			</div>  
		</div>

		<div class="form-group"> 
			<label for="contentNoticeS" class="col-sm-2 control-label">내용</label> 
			<div class="col-sm-10"> 
				<textarea name="content" id="contentNoticeS" class="form-control" rows="10">${dto.content}</textarea>
			</div>  
		</div>
		<div class="form-group"> 
			<label for="isNoticeS" class="col-sm-2 control-label">공지</label> 
			<div class="col-sm-10"> 
				<input type="checkbox" name="isNotice" id="isNoticeS" value="1"> 공지여부 체크
			</div>  
		</div>
		
		
	 	<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		     <tr height="45"> 
		      <td align="center" >
		        <button type="button"  class="btn btn-default" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
		        <button type="reset" class="btn btn-default">다시입력</button>
		        <button type="button"  class="btn btn-default" onclick="javascript:location.href='<%=cp%>/noticeS/list?${query }';">${mode=='update'?'수정취소':'등록취소'}</button>
		         <c:if test="${mode=='update'}">
		         	 <input type="hidden" name="num" value="${dto.noticeCode}">
		        	 <input type="hidden" name="page" value="${page}">
		        </c:if>
		      </td>
		    </tr>
		</table>
	</form>
    
</div>