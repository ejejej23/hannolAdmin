<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">
    function sendOk() {
        var f = document.showForm;
       var str;
        
        str = f.gubunCode.value;
        if(!str) {
            alert("구분을 선택하세요. ");
            f.gubunCode.focus();
            return;
        } 
        
       str = f.showName.value;
        if(!str) {
            alert("공연명을 입력하세요. ");
            f.showName.focus();
            return;
        }
        
       str = f.memo.value;
        if(!str) {
            alert("내용을 입력하세요. ");
            f.showName.focus();
            return;
        }
     
        var mode = "${mode}";
        if(mode=="created" || mode=="update" && f.upload.value != "") {
           if(! /(\.gif|\.jpg|\.png|\.jpeg)$/i.test(f.upload.value)) {   
              alert("파일을 선택하세요. ");
              f.upload.focus();
              return;
           } 
        }
        
/*        var showTimes=document.getElementsByName("showTime");
       for(var i=0; i<showTimes.length; i++) {
            if(!showTimes[i].value) {
                alert("시간을 입력하세요. ");
                f.showTimes[i].focus();
                return;
            }
             for(var j=i+1; j<showTimes.length; j++) {
                if(showTimes[i].value==showTimes[j].value) {
                   alert("동일한 시간은 입력할 수 없습니다. !!!");
                   return;
                }
             }
       } */
        
       f.action="<%=cp%>/show/${mode}";
       f.submit();
    }
    
/*     var cnt=1;
    function addText() {
       var spbut= document.getElementById("showTime");
       if(cnt==5) {
          alert("추가 가능한 시간 개수는 5개 입니다.");
          return;
       }
       var txt=document.createElement("input");
       txt.setAttribute("type", "text");
       txt.setAttribute("name", "showTime");
       txt.setAttribute("size", "4");
       txt.setAttribute("class", "boxTF");
       spbut.appendChild(txt);
       spbut.appendChild(document.createTextNode(" "));
       cnt++;
    } */
    
    
</script>

<div class="sub-container" style="width: 960px;">
    <div class="sub-title">
     <h3>공연정보</h3>
   </div>
    
    <form role="form" name="showForm" method="post" enctype="multipart/form-data"> 
      <div class="form-group"> 
         <label for="gubunName" class="col-sm-2 control-label">구분</label> 
         <div class="col-sm-10"> 
            <input type="radio" name="gubunCode" id="" value="1"> 체험&nbsp;
            <input type="radio" name="gubunCode" id="" value="2"> 퍼레이드&nbsp;
            <input type="radio" name="gubunCode" id="" value="3"> 무대공연&nbsp;
         </div>  
      </div>
      <br><br>
      <div class="form-group"> 
         <label for="showName" class="col-sm-2 control-label">공연명</label> 
         <div class="col-sm-10"> 
            <input name="showName" type="text" class="form-control" id="showName" placeholder="공연명"  value=""> 
         </div> 
      </div> 
      <div class="form-group"> 
         <label for="memo" class="col-sm-2 control-label">내용</label> 
         <div class="col-sm-10"> 
            <textarea name="memo" id="memo" class="form-control" rows="5" placeholder="설명"></textarea>
         </div>  
      </div>
      <div class="form-group"> 
         <label for="upload" class="col-sm-2 control-label">사진</label> 
         <div class="col-sm-10"> 
            <input type="file" name="upload" class="form-control">
         </div>  
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
              <button type="button" class="btn" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
              <button type="reset" class="btn">다시입력</button>
              <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/show/manage';">${mode=='update'?'수정취소':'등록취소'}</button>
               <c:if test="${mode=='update'}">
                   <input type="hidden" name="num" value="">
                  <input type="hidden" name="page" value="">
              </c:if>
            </td>
          </tr>
      </table>
   </form>
    
</div>