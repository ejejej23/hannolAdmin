<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script type="text/javascript">
//ajax - Text 처리 함수
function ajaxText(url, query, type, selector) {
   $.ajax({
      type:type
      ,url:url
      ,data:query
      ,success:function(data) {
         $(selector).html(data);   
      }
      ,beforeSend : function(jqXHR) {
           jqXHR.setRequestHeader("AJAX", true);
       }
       ,error:function(jqXHR) {
          if(jqXHR.status==403) {
             location.href="<%=cp%>/member/login";
             return;
          }
          console.log(jqXHR.responseText);
       }
   });
}

$(function(){
   way("list");
});

//탭을 선택 한 경우
$(function(){
   $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
      var active=$(this).attr("aria-controls");
      way(active);
   });   
});

function way(mode) {
   var url="<%=cp%>/friend/"+mode;
   var query="tmp="+new Date().getTime();
   
   var id="#tabSubway";
   if(mode=="add")
      id="#tabBus";
   else if(mode=="block")
      id="#tabMap";
   
   ajaxText(url, query, "get", id);
}
</script>

<div class="bodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-tower"></span> 오시는 길 </h3>
    </div>
    
    <div>
       <div role="tabpanel">
           <ul class="nav nav-tabs" role="tablist">
               <li role="presentation" class="active"><a href="#tabSubway" aria-controls="list" role="tab" data-toggle="tab">지하철</a></li>
                <li role="presentation"><a href="#tabBus" aria-controls="add" role="tab" data-toggle="tab">버스</a></li>
                <li role="presentation"><a href="#tabMap" aria-controls="block" role="tab" data-toggle="tab">지도</a></li>
           </ul>
         
           <div class="tab-content" style="padding: 5px; margin-top: 15px;">
               <div role="tabpanel" class="tab-pane active" id="tabSubway"></div>
               <div role="tabpanel" class="tab-pane" id="tabBus"></div>
               <div role="tabpanel" class="tab-pane" id="tabMap"></div>
           </div>
       </div>
    </div>
</div>