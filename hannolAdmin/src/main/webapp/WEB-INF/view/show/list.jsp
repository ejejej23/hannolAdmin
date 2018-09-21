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
<script type="text/javascript" src="<c:url value='/resource/fullcalendar/fullcalendar.min.js'/>"></script>
<script>

var dataset = [
    <c:forEach var="listview" items="${list}" varStatus="status">
	        {
	        	"id":'<c:out value="${listview.showCode}" />'
		        ,"title":'<c:out value="${listview.showName} ( ${listview.name} )" />'
		        ,"start":"<c:out value="${listview.startdate}" />"
		        ,"end":"<c:out value="${listview.enddate}" />"
		        ,"url":"<%=cp%>/show/article?showCode=${listview.showCode}"
		        	<c:if test="${listview.gubunCode==1}">,"color" : "#E74C3C"</c:if>
		        	<c:if test="${listview.gubunCode==2}">,"color" : "#7FB3D5"</c:if>
		        	<c:if test="${listview.gubunCode==3}">,"color" : "#2980B9"</c:if>
	        } 
	        <c:if test="${!status.last}">,</c:if>
	</c:forEach> 
];

$(document).ready(function() {
	$('#calendar').fullCalendar({
		locale:'ko',
	    header: {
	        left: 'prev,next today',
	        center: 'title',
	         right: 'month,basicWeek,basicDay' 
	    },
	    defaultDate: new Date(),
	    navLinks: true, 
	    editable: false,
	    displayEventTime: false,
	    eventLimit: true,
	    monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
	    monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
	    dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
	    dayNamesShort: ["일","월","화","수","목","금","토"],
	    buttonText: {
		    today : "오늘",
		    month : "월별",
		    week : "주별",
		    day : "일별",
	    },
	    events: dataset,
	    eventClick: function(calEvent, jsEvent, view) {
	    	if (event.url) {
	    	    window.open(event.url);
	    	    return false;
	    	} 
	    }
	});
});
</script>

<div class="sub-container" style="width: 960px;">
   
   <div class="sub-title">
     <h3>공연 스케쥴</h3> 
   </div> 
     
     <div>
        <form name="searchForm" method="post" action="<%=cp%>/">
             <div class="col-xs-8 col-xs-offset-2" style="width: 100%">
              <div align="center" class="input-group" style="width:50%; float: left;">
                     <input type="hidden" name="searchKey" value="all">         
                     <input type="text" style="height:30px;" class="form-control" name="searchValue" placeholder="검색할 공연명를 입력해 주세요">
                     <span class="input-group-btn">
                         <button class="btn btn-default btn-info" type="button" onclick="searchList()"><span class="glyphicon glyphicon-search"></span></button>
                     </span>
             </div>
             <div align="right" style="float: left; width: 50%">
                <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/show/manage';">공연 관리</button>
             </div>
         </div>
      </form>
     </div>
    
    <div>
	    <div>
	        <div id="calendar"></div>
	    	<br>
	    </div>
	    <div id="resultLayout"></div>
    </div>
</div>