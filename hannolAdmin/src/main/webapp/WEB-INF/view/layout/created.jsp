<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">
    function sendOk() {
        var f = document.boardForm;

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

    	f.action="<%=cp%>/layout/${mode}";

        f.submit();
    }
</script>

<div class="body-container" style="width: 960px;">
    <div class="body-title">
        <h3><span style="font-family: Webdings">2</span> 글쓰기 </h3>
    </div>
    
    
    <form role="form" name="layoutForm" method="post" enctype="multipart/form-data"> 
		<div class="form-group"> 
			<label for="subjectLayout" class="col-sm-2 control-label">제목</label> 
			<div class="col-sm-10"> 
				<input name="subject" type="text" class="form-control" id="subjectLayout" placeholder="제목"  value="${dto.subject}"> 
			</div> 
		</div> 
		<div class="form-group"> 
			<label for="usernameLayout" class="col-sm-2 control-label">작성자</label> 
			<div class="col-sm-10"> 
				<input type="text" class="form-control" id="usernameLayout" placeholder="작성자" value="${sessionScope.staff.staffName}" readonly> 
			</div>  
		</div>
		<div class="form-group"> 
			<label for="contentLayout" class="col-sm-2 control-label">내용</label> 
			<div class="col-sm-10"> 
				<textarea name="content" id="contentLayout" class="form-control" rows="10">${dto.content}</textarea>
			</div>  
		</div>
		<div class="form-group"> 
			<label for="exampleInputFile" class="col-sm-2 control-label">첨부</label> 
			<div class="col-sm-10"> 
				<input type="file" name="upload" class="form-control" id="exampleInputFile" > 
			</div> 
		</div>
	
	 	<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		     <tr height="45"> 
		      <td align="center" >
		        <button type="button" class="btn" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
		        <button type="reset" class="btn">다시입력</button>
		        <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/layout/list';">${mode=='update'?'수정취소':'등록취소'}</button>
		         <c:if test="${mode=='update'}">
		         	 <input type="hidden" name="num" value="${dto.num}">
		         	 <input type="hidden" name="saveFilename" value="${dto.saveFilename}">
		         	 <input type="hidden" name="originalFilename" value="${dto.originalFilename}">
		        	 <input type="hidden" name="page" value="${page}">
		        </c:if>
		      </td>
		    </tr>
		  </table>
	</form>
    
</div>