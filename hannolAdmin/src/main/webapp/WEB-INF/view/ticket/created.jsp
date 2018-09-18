<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>
.btn-giftImg{
    padding: 5px;
    font-size: 12px;
    color: black;
    margin: 0px 10px 0px 5px;
}


.span-gift{
	display: block;
	border-bottom: 1px solid #e2e2e2;
}

hr{
	margin: 0px;
}
/* 
.aGiftImg:hover, .aGiftImg:focus {
    vertical-align: middle;
}

.aGiftImg:link, .aGiftImg:visited {
    color : blue;
} */

.aGiftImg {
    vertical-align: middle;
}
</style>

<script>
$(function(){
	$("#gubunCode option").each(function(){
		if( $(this).val() == "${dto.gubunCode}"){
			$(this).attr("selected", "selected");
			return;
		}
	});
});

function check() {
    var f = document.goodsForm;
    
    var giftName = f.goodsName.value;
    if(!giftName){
    	alert("상품명을 입력하세요. ");
    	f.goodsName.focus();
    	return false;
    }
    
    var price =  f.goodsPrice.value;
    if(!price){
    	alert("상품 가격을 입력하세요. ");
    	f.price.focus();
    	return false;
    }
    
    var gubunCode =  f.gubunCode.value;
    if(!gubunCode){
    	alert("상품 구분을 선택하세요. ");
    	f.gubunCode.focus();
    	return false;
    }
    
    
	f.action="<%=cp%>/ticket/${mode}";
	f.submit();
}
</script>

<div class="sub-container" style="width: 960px;">
    <div class="sub-title">
	  <h3>이용권등록하기</h3>
	</div>
    
    <div>
			<form name="goodsForm" method="post" enctype="multipart/form-data">
			  <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">상품명</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="goodsName" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.goodsName}">
			      </td>
			  </tr>
			
			  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">상품가격</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="goodsPrice" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.goodsPrice}">
			      </td>
			  </tr>
			  
			  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">상태</td>
			      <td style="padding-left:10px;"> 
			      <c:if test="${mode=='update' }">
			      	<input type="checkbox" name="state" id="giftState" value="1" ${dto.state=='1' ? 'checked' : ''}> 사용
			      </c:if>
			      <c:if test="${mode=='created' }">
			      	<input type="checkbox" name="state" id="giftState" value="1"> 사용
			      </c:if>
			        
			      </td>
			  </tr>
			  
			   <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center; ">구분</td>
			      <td style="padding-left:10px;"> 
				        <select name="gubunCode" id="gubunCode" style="padding: 5px;">
				         	<option value="">::구분선택::</option>
					        <c:forEach var="gubunDto" items="${gubunList}">
			                    <option value="${gubunDto.GUBUNCODE}"> ${gubunDto.GUBUNNAME }</option>
			                 </c:forEach>
					    </select>
			      </td>
			  </tr>

			  </table>
			
			  <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			     <tr height="45"> 
			      <td align="center" >
			        <button type="button" class="btn" onclick="check();">${mode=='update'?'수정완료':'등록하기'}</button>
			        <button type="reset" class="btn">다시입력</button>
			        <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/ticket/list';">${mode=='update'?'수정취소':'등록취소'}</button>
			      </td>
			    </tr>
			  </table>
			  
			  <c:if test="${mode=='update'}">
			 	 <input type="hidden" name="goodsCode" value="${dto.goodsCode}">
			  </c:if>
			</form>
    </div>
</div>