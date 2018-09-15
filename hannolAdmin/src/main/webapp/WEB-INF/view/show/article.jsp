<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">
function updateShow() {
	var f = document.showForm;
	
	if(!confirm('공연 정보를 수정하시겠습니까?'))
		return;
   	
	var url = '<%=cp%>/show/update?showCode=${dto.showCode}&tab=${tab}&pageNo=${pageNo}';
	location.href = url;
}
    
</script>

<div class="sub-container" style="width: 960px;">
    <div class="sub-title">
     <h3>공연정보</h3>
   </div>
    
    <form role="form" name="showForm" method="post" enctype="multipart/form-data"> 
      <div class="form-group"> 
         <div class="col-sm-2">사진</div>
         <div class="col-sm-10">
	         <c:if test="${empty dto.saveFilename}"><img src="<%=cp%>/resource/images/noimage.png"  style="padding: 5px;" onerror="this.src='<%=cp%>/resource/images/noimage.png'"></c:if>
			 <c:if test="${not empty dto.saveFilename}"><img src="<%=cp%>/uploads/show/${dto.saveFilename}" style="padding: 5px;" onerror="this.src='<%=cp%>/resource/images/noimage.png'"></c:if>
		</div> 
      </div><br>
      <div class="form-group">
	     <div class="col-sm-2">구분</div> 
         <div class="col-sm-10">${dto.gubunName}</div>  
      </div><br>
      <div class="form-group"> 
      	<div class="col-sm-2">공연명</div>
        <div class="col-sm-10">${dto.showName}</div> 
      </div><br> 
      <div class="form-group"> 
      	<div class="col-sm-2">내용</div>
         <div class="col-sm-10">${dto.memo}</div>  
      </div>
<!--       <div class="form-group"> 
         <label for="showTime" class="col-sm-2 control-label">공연시간</label>  
         <div>
               <span id="showTime" style="text-align: left; margin-left: 15px;">  
                   <input type="text" name="showTime" size="4" class="boxTF" placeholder="11:30"/>
               </span>
            
                <input type="button" value="추가" onclick="addText();" class="btn"/>
         </div> 
      </div> 
                <div align="center">(공연 시간은 연속적으로 입력하세요)</div> <br><br>
      -->
      
       <table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
           <tr height="45"> 
            <td align="center" >
              <button type="button" class="btn" onclick="updateShow();">공연정보 수정</button>
              <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/show/manage?tab=${tab}&pageNo=${pageNo}';">리스트</button>
               <c:if test="${mode=='update'}">
                   <input type="hidden" name="num" value="">
                  <input type="hidden" name="page" value="">
              </c:if>
            </td>
          </tr>
      </table>
   </form>
    
</div>