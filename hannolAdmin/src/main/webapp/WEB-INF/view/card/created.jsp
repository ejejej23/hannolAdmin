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

    	/* var str = f.subject.value;
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
        } */

    	f.action="<%=cp%>/card/${mode}";

        f.submit();
    }
</script>

<div class="body-container" style="width: 960px;">
    <div class="body-title">
        <h3><span class="glyphicon glyphicon-credit-card"></span> 카드등록 </h3>
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
				<input style="width: 46%;" name="startDate" type="text" class="form-control" id="startDate" placeholder="시작일"  value="${dto.startDate}">
				<img src="<%=cp%>/resource/images/calendar.gif">
				~ 
				<input style="width: 46%;" name="endDate" type="text" class="form-control" id="endDate" placeholder="종료일"  value="${dto.endDate}"> 
				<img src="<%=cp%>/resource/images/calendar.gif">
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
		
	 	<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		     <tr height="45"> 
		      <td align="center" >
		        <button type="button" class="btn" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
		        <button type="reset" class="btn">다시입력</button>
		        <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/card/list';">${mode=='update'?'수정취소':'등록취소'}</button>
		         <c:if test="${mode=='update'}">
		         	 <input type="hidden" name="num" value="${dto.num}">
		        	 <input type="hidden" name="page" value="${page}">
		        </c:if>
		      </td>
		    </tr>
		</table>
	</form>
    
</div>