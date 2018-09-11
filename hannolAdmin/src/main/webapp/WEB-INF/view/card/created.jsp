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
        var f = document.cardForm;

    	var str = f.cardCo.value;
        if(!str) {
            alert("카드사를 입력하세요. ");
            f.subject.focus();
            return;
        }

    	str = f.cardName.value;
        if(!str) {
            alert("카드명을 입력하세요. ");
            f.content.focus();
            return;
        } 
        
        str = f.startDate.value;
        str = str.trim();
        if(!str || !isValidDateFormat(str)) {
            alert("시작일을 입력하세요. ");
            f.content.focus();
            return;
        } 
        
        str = f.endDate.value;
        str = str.trim();
        if(!str || !isValidDateFormat(str)) {
            alert("종료일을 입력하세요. ");
            f.content.focus();
            return;
        } 
        
        str = f.discount.value;
        if(!str) {
            alert("할인율을 입력하세요. ");
            f.content.focus();
            return;
        } 
        
        str = f.memo.value;
        if(!str) {
            alert("상세내용을 입력하세요. ");
            f.content.focus();
            return;
        } 
        
        if(${mode=='created'}){
        str = f.cardupload.value;
        if(!str) {
            alert("카드 이미지를 첨부하세요. ");
            f.content.focus();
            return;
        }
        
        str = f.logoupload.value;
        if(!str) {
            alert("로고 이미지를 첨부하세요. ");
            f.content.focus();
            return;
        }
        }
        
    	f.action="<%=cp%>/card/${mode}";
        f.submit();
    }
    
    $(function(){
    	$("#startDate").datepicker({
    		showOn:"button"
    		,buttonImage:"<%=cp%>/resource/images/calendar.gif"
    		,buttonImageOnly:true
    		,showMonthAfterYear:true
    		,minDate:0
    		,onClose: function( selectedDate ) {
    		 	$("#endDate").datepicker( "option", "minDate", selectedDate );
    		 }
    	});
    	
    	$("#endDate").datepicker({
    		showOn:"button"
    		,buttonImage:"<%=cp%>/resource/images/calendar.gif"
    		,buttonImageOnly:true
    		,showMonthAfterYear:true
    		,minDate:0
    		,onClose: function( selectedDate ) {
    			  $("#startDate").datepicker( "option", "maxDate", selectedDate );
    		 }
    	});
    });
</script>

<div class="body-container" style="width: 960px;">
    <div class="body-title">
        <h3><span class="glyphicon glyphicon-credit-card"></span> 제휴카드 </h3>
    </div>
    
    
    <form role="form" name="cardForm" method="post" enctype="multipart/form-data"> 
		<div class="form-group"> 
			<label for="cardCo" class="col-sm-2 control-label">카드사</label> 
			<div class="col-sm-10"> 
				<input name="cardCo" type="text" class="form-control" id="cardCo" placeholder="카드사"  value="${dto.cardCo}"> 
			</div> 
		</div> 
		<div class="form-group"> 
			<label for="cardName" class="col-sm-2 control-label">카드명</label> 
			<div class="col-sm-10"> 
				<input name="cardName" type="text" class="form-control" id="cardName" placeholder="카드명"  value="${dto.cardName}"> 
			</div> 
		</div>
		<div class="form-group"> 
			<label for="startDate" class="col-sm-2 control-label">기간</label> 
			<div class="col-sm-10"> 
				<input style="width: 46%;" name="startDate" type="text" class="form-control" id="startDate" placeholder="시작일(YYYY-MM-DD)"  value="${dto.startDate}" readonly="readonly">
				~ 
				<input style="width: 46%;" name="endDate" type="text" class="form-control" id="endDate" placeholder="종료일(YYYY-MM-DD)"  value="${dto.endDate}" readonly="readonly"> 
			</div> 
		</div>  
		<div class="form-group"> 
			<label for="discount" class="col-sm-2 control-label">할인율</label> 
			<div class="col-sm-10"> 
				<input style="width: 20%;" name="discount" type="text" class="form-control" id="discount" placeholder="50" value="${dto.discount}">% 
			</div>  
		</div>

		<div class="form-group"> 
			<label for="memo" class="col-sm-2 control-label">상세 내용</label> 
			<div class="col-sm-10"> 
				<textarea name="memo" id="memo" class="form-control" rows="10">${dto.memo}</textarea>
			</div>  
		</div>
		
		<div class="form-group"> 
			<label for="cardFile" class="col-sm-2 control-label">카드 이미지 첨부</label> 
			<div class="col-sm-10"> 
				<input type="file" name="cardupload" class="form-control" id="cardFile" > 
			</div> 
		</div>
		
		<div class="form-group"> 
			<label for="logoFile" class="col-sm-2 control-label">카드사 로고 첨부</label> 
			<div class="col-sm-10"> 
				<input type="file" name="logoupload" class="form-control" id="logoFile" > 
			</div> 
		</div>
		
		<c:if test="${mode=='update'}">
           <c:if test="${not empty dto.saveFilename}">
            <div class="form-group"> 
				<label for="logoFile" class="col-sm-2 control-label">첨부된 카드 이미지</label> 
             		<div class="col-sm-10"> 
                   		<img src="<%=cp%>/uploads/card/${dto.saveFilename}" width="70" height="40" style="padding: 1px;"> 
                	</div>
           	</div> 
           	<div class="form-group"> 
				<label for="logoFile" class="col-sm-2 control-label">첨부된 로고 이미지</label> 
             		<div class="col-sm-10"> 
                   		<img src="<%=cp%>/uploads/card/${dto.logoSaveFilename}" width="40" height="40" style="padding: 1px;">
                	</div>
           	</div> 
          </c:if>
       </c:if>
		
	 	<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		     <tr height="45"> 
		      <td align="center" >
		        <button type="button" class="btn" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
		        <button type="reset" class="btn">다시입력</button>
		        <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/card/list?${query}';">${mode=='update'?'수정취소':'등록취소'}</button>
		         <c:if test="${mode=='update'}">
		         	 <input type="hidden" name="cardCode" value="${dto.cardCode}">
		        	 <input type="hidden" name="page" value="${page}">
		        	 <input type="hidden" name="saveFilename" value="${dto.saveFilename}">
		        	 <input type="hidden" name="originalFilename" value="${dto.originalFilename}">
		        	 <input type="hidden" name="logoSaveFilename" value="${dto.logoSaveFilename}">
		        	 <input type="hidden" name="logoOriginalFilename" value="${dto.logoOriginalFilename}">
		        	 <input type="hidden" name="searchKey" value="${searchKey}">
		        	 <input type="hidden" name="searchValue" value="${searchValue}">
		        </c:if>
		      </td>
		    </tr>
		</table>
	</form>
    
</div>