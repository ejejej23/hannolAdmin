<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style type="text/css">
.form-control{
	display: inline;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075); 
    -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
    -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
}
</style>

<script type="text/javascript">
    function sendOk() {
        var f = document.gradeForm;

    	str = f.gradeName.value;
        if(!str) {
            f.gradeName.focus();
            return;
        } 
        
        str = f.condition.value;
        if(!str) {
            f.condition.focus();
            return;
        } 
        
        str = f.benefit.value;
        if(!str) {
            f.benefit.focus();
            return;
        } 
        
        if(${mode=='created'}){
        str = f.upload.value;
        if(!str) {
        	f.upload.focus();
            return;
        }
        }
        
    	f.action="<%=cp%>/grade/${mode}";
        f.submit();
    }
</script>

<div class="sub-container" >
    <div class="sub-title">
	  <h3>등급관리</h3>
	</div> 
    
    
    <form role="form" name="gradeForm" method="post" enctype="multipart/form-data">  
		<div class="form-group"> 
			<label for="gradeName" class="col-sm-2 control-label">등급명</label> 
			<div class="col-sm-10"> 
				<input name="gradeName" type="text" class="form-control" id="gradeName" placeholder="등급명"  value="${dto.gradeName}"> 
			</div> 
		</div>
		<div class="form-group"> 
			<label for="condition" class="col-sm-2 control-label">등급조건</label> 
			<div class="col-sm-10"> 
				<input name="condition" type="text" class="form-control" id="condition" placeholder="등급조건" value="${dto.condition}"> 
			</div>  
		</div>

		<div class="form-group"> 
			<label for="benefit" class="col-sm-2 control-label">등급혜택</label> 
			<div class="col-sm-10"> 
				<textarea name="benefit" id="benefit" class="form-control" rows="5">${dto.benefit}</textarea>
			</div>  
		</div>
		
		<div class="form-group"> 
			<label for="upload" class="col-sm-2 control-label">등급 이미지 첨부</label> 
			<div class="col-sm-10"> 
				<input type="file" name="upload" class="form-control" id="upload" > 
			</div> 
		</div>
		
		<c:if test="${mode=='update'}">
           <c:if test="${not empty dto.saveFileName}">
            <div class="form-group"> 
				<label for="logoFile" class="col-sm-2 control-label">첨부된 이미지</label> 
             		<div class="col-sm-10"> 
                   		<img src="<%=cp%>/uploads/grade/${dto.saveFileName}" width="60" height="60" style="padding: 1px;"> 
                	</div>
           	</div> 
          </c:if>
       </c:if>
		
	 	<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		     <tr height="45"> 
		      <td align="center" >
		        <button type="button" class="btn btn-default" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
		        <button type="reset" class="btn btn-default">다시입력</button>
		        <button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/grade/list';">${mode=='update'?'수정취소':'등록취소'}</button>
		        <input type="hidden" name="gradeCode" value="${dto.gradeCode}">
		        <input type="hidden" name="saveFileName" value="${dto.saveFileName}">
		        <input type="hidden" name="originalFileName" value="${dto.originalFileName}">
		      </td>
		    </tr>
		</table>
	</form>
    
</div>