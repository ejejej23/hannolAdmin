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
<script type="text/javascript">

$(document).ready(function() {
    var lang_cd = 'ko';
    $('#calendar').fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,listMonth'
        },
        defaultDate: moment().format('YYYY-MM-DD'),
        locale: initialLocaleCode,
        editable: true,
        navLinks: true,
        eventLimit: true,
        events: function(start, end, timezone, callback) {
            $.ajax({
                url: '/test/eventAll.do',
                type : 'post',
                data : {EVENT_CODE : '11', LANG : lang_cd, startDate : start.format(), endDate : end.format() },
                dataType: 'json',
                success: function(data) {
                    var events = [];
                    $(data).each(function() {
                        events.push({
                            title: $(this).attr('title'),
                            start: $(this).attr('start'),
                            end: $(this).attr('end'),
                            url: "/test/eventDetail.do?id="+$(this).attr('id')+"&amp;lang="+$(this).attr('lang')+"&amp;start="+$(this).attr('start')+"&amp;end="+$(this).attr('end'),
                            lang : $(this).attr('lang')
                        });
                    });
                    callback(events);
                }
            });
 
        },
        loading: function(bool) {
            $('#loading').toggle(bool);
        }
    });
});
</script>
<div class="sub-container" style="width: 960px;">
   
   <div class="sub-title">
     <h3>가이드 스케쥴</h3> 
   </div> 
     
     <div>
        <form name="searchForm" method="post" action="<%=cp%>/">
             <div class="col-xs-8 col-xs-offset-2" style="width: 100%">
              <div align="center" class="input-group" style="width:50%; float: left;">
                     <input type="hidden" name="searchKey" value="all">         
                     <input type="text" class="form-control" name="searchValue" placeholder="검색할 예약코드를 입력해 주세요">
                     <span class="input-group-btn">
                         <button class="btn btn-default btn-info" type="button" onclick="searchList()"><span class="glyphicon glyphicon-search"></span></button>
                     </span>
             </div>
             <div align="right" style="float: left; width: 50%">
                <button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/guide/manage';">가이드 일정 관리</button>
             </div>
         </div>
      </form>
     </div>
    
    <div>
      
      
      
   달력<br><br><br> 
                <button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/notice/created';">글올리기</button>
          
          <div id="divCalendar"></div>
          <div id="loading">loading..</div>
          <div id="calendar"></div>
          
    </div>
   
   
   
</div>

