<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>
iframe{
	width : 95%;
}
</style>

<script type="text/javascript">
	function check() {
	    var f = document.goodsForm;
	
		f.action="<%=cp%>/giftshop/${mode}";
	
		return true;
	}
</script>
<script type="text/javascript" src="<%=cp%>/resource/se/js/HuskyEZCreator.js" charset="utf-8"></script>

<div class="sub-container" style="width: 960px;">
    <div class="sub-title">
	  <h3>상품등록하기</h3>
	</div>
    
    <div>
			<form name="goodsForm" method="post" enctype="multipart/form-data" onsubmit="return submitContents(this);">
			  <table style="width: 100%; margin: 20px auto 0px; border-spacing: 0px; border-collapse: collapse;">
			  <tr align="left" height="40" style="border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">상품명</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="goodsName" maxlength="100" class="boxTF" style="width: 95%;" value="">
			      </td>
			  </tr>
			
			  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">상품가격</td>
			      <td style="padding-left:10px;"> 
			        <input type="text" name="goodsPrice" maxlength="100" class="boxTF" style="width: 95%;" value="">
			      </td>
			  </tr>
			  
			  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">상태</td>
			      <td style="padding-left:10px;"> 
			        <input type="checkbox" name="isState" id="isNotice" value="1"> 사용
			      </td>
			  </tr>
			  
			   <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center; ">구분</td>
			      <td style="padding-left:10px;"> 
			        <select name="gubunCode" style="padding: 5px;">
				        <option value="1"> 이용권[대인] </option>
				        <option value="2"> 이용권[소인] </option>
				        <option value="3"> 이용권[우대] </option>
				        <option value="4"> 기프티콘 </option>
				    </select>
			      </td>
			  </tr>
			  
			  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;">
			      <td width="100" bgcolor="#eeeeee" style="text-align: center;">썸네일사진</td>
			      <td style="padding-left:10px;"> 
			          <input type="file" name="upload" class="boxTF" size="53" style="width: 95%;">
			       </td>
			  </tr>
			
			  <tr align="left" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="100" bgcolor="#eeeeee" style="text-align: center; padding-top:5px;" valign="top">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
			      <td valign="top" style="padding:5px 0px 5px 10px;"> 
			        <textarea name="content" id="content" class="boxTA" style="min-width: 95%; height: 270px;"></textarea>
			      </td>
			  </tr>
			  
			  <c:if test="${mode=='update' }">
				  <tr align="left" height="40" style="border-bottom: 1px solid #cccccc;">
				      <td width="100" bgcolor="#eeeeee" style="text-align: center;">첨부된파일</td>
				      <td style="padding-left:10px;"> 
				          ${dto.originalFilename}
				          <c:if test="${not empty dto.saveFilename}">
				          		| <a href="<%=cp%>/bbs/deleteFile?num=${dto.num}&page=${page}">파일삭제</a>
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