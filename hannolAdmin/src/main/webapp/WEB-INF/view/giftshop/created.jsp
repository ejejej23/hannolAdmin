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


<script type="text/javascript">
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
	    
	    var price =  f.price.value;
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
	    
	    
		f.action="<%=cp%>/giftshop/${mode}";
		return true;
	}
	
	function deleteFile(goodsImgCode, codeType, e){
		
		 if(!confirm("정말로 삭제하시겠습니까?")){
			 return;
		 }
		
		var url = "<%=cp%>/giftshop/deleteFile";
		var data ="codeType="+codeType+"&code="+goodsImgCode
		var $item = e;
	
		
		$.ajax({
			type:"POST"
			,url:url
			,data: data
			,success:function(data) {		
				if(data.state=='success'){
					 alert("이미지가 삭제 되었습니다.");
					 if(codeType=="img"){
						 $item.closest("span").remove();
					 }else{
						$($item.closest("td")).empty();
					 }
					
				}else{
					console.log("못지움");
				}
			}
		    ,error:function(e) {
		    	console.log(e.responseText);
		    }
		});
	}
</script>
<script type="text/javascript" src="<%=cp%>/resource/se/js/HuskyEZCreator.js" charset="utf-8"></script>

<div class="sub-container" style="width: 960px;">
    <div class="sub-title">
	  <h3>상품 등록하기</h3>
	</div>
    
    <div>
			<form name="goodsForm" method="post" enctype="multipart/form-data" onsubmit="return submitContents(this);">
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
			        <input type="text" name="price" maxlength="100" class="boxTF" style="width: 95%;" value="${dto.price}">
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
			  
			  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;">
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">제품사진</td>
			      <td style="padding-left:10px;"> 
			          <input type="file" multiple="multiple" name="upload" class="boxTF" size="53" style="width: 95%;">
			       </td>
			  </tr>
			
			  <tr align="left" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center; padding-top:5px;" valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
			      <td valign="top" style="padding:5px 0px 5px 10px;"> 
			        <textarea name="content" id="content" class="boxTA" style="width: 95%; height: 270px;">${dto.content }</textarea>
			      </td>
			  </tr>
			  
			  <c:if test="${mode=='update' }">
				  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;">
				      <td width="100" bgcolor="#eeeeee" style="text-align: center;">첨부된파일</td>
				      <td style="padding-left:10px;">
					      <c:forEach items="${dto.fileList}" var="itemImg">
						      <span class="span-gift">
									<img style="width: 50px;" alt="" src="<%=cp%>/uploads/giftShopGoods/${itemImg.SAVEFILENAME}" onerror="this.src='<%=cp%>/resource/images/noimage.png'">
									${itemImg.ORIGINALFILENAME}
									<button type="button" class="btn btn-default glyphicon glyphicon-trash btn-giftImg" onclick="deleteFile('${itemImg.GOODSIMGCODE}', 'img', this)"></button>
							  </span>
						  </c:forEach>
						  <c:if test="${not empty dto.fileList}">
						     	<button type="button" class="btn btn-default" style="margin: 10px 0px;" onclick="deleteFile('${dto.goodsCode}', 'goods', this)">전체이미지삭제</button>
					      </c:if>
				      </td>
				  </tr>
			  </c:if>

			  </table>
			
			  <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			     <tr height="45"> 
			      <td align="center" >
			        <button type="submit" class="btn">${mode=='update'?'수정완료':'등록하기'}</button>
			        <button type="reset" class="btn">다시입력</button>
			        <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/giftshop/list';">${mode=='update'?'수정취소':'등록취소'}</button>
			      </td>
			    </tr>
			  </table>
			  
			  <c:if test="${mode=='update'}">
			 	 <input type="hidden" name="goodsCode" value="${dto.goodsCode}">
			  </c:if>
			</form>
    </div>
</div>

<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "content",
		sSkinURI: "<%=cp%>/resource/se/SmartEditor2Skin.html",	
		htParams : {bUseToolbar : true,
			fOnBeforeUnload : function(){
				//alert("아싸!");
			}
		}, //boolean
		fOnAppLoad : function(){
			//예제 코드
			//oEditors.getById["content"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator: "createSEditor2"
	});
	
	function pasteHTML() {
		var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
		oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
	}
	
	function showHTML() {
		var sHTML = oEditors.getById["content"].getIR();
		alert(sHTML);
	}
		
	function submitContents(elClickedObj) {
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
		
		// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
		
		try {
			// elClickedObj.form.submit();
			return check();
		} catch(e) {}
	}
	
	function setDefaultFont() {
		var sDefaultFont = '돋움';
		var nFontSize = 24;
		oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
	}
</script>