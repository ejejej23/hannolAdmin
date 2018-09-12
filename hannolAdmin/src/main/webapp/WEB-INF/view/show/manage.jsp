<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
   String cp=request.getContextPath();
%>
<style>
.gitf-form-control{
   background: url(<%=cp%>/resource/images/item_list.png) no-repeat right 2px;
}
.col-xs-8:after{
   content:''; display:block; clear:both;
}

.col-xs-offset-2{
   width: 40%;
}

.col-xs-8{
    float: none;
    margin: 10px auto;
}

</style>

<div class="sub-container" style="width: 960px;">
   
   <div class="sub-title">
     <h3>공연 리스트</h3> 
   </div> 
     
     <div>
        <form name="searchForm" method="post" action="<%=cp%>/">
             <div class="col-xs-8 col-xs-offset-2" style="width: 100%">
              <div class="input-group" style="width:70%; float: left;">
                 <div style="float: left;">
                    구분&nbsp;&nbsp;
                     <select name="searchKey" class="selectField" style="height:30px;">
                           <option value="experience">체험</option>
                           <option value="parade">퍼레이드</option>
                           <option value="stage">무대공연</option>
                     </select>
                 </div> 
                 <div style="float: left;">&nbsp;</div> 
                 <div style="margin-left: 10px;">
                     <input type="text" style="height:30px; width: 50%" class="form-control" name="searchValue" placeholder="검색할 공연명를 입력해 주세요">
                     <span class="input-group-btn">
                         <button class="btn btn-default btn-info" type="button" onclick="searchList()"><span class="glyphicon glyphicon-search"></span></button>
                     </span>
                 </div>         
             </div>
             <div align="right" style="float: left; width: 30%">
                <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/show/created';">공연 등록</button>
             </div>
         </div>
      </form>
     </div>
    
    <div>
      
      gg
          
    </div>
   
   
   
</div>