<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
   String cp=request.getContextPath();
%>


<script type="text/javascript">
	var dataset = [
    <c:forEach var="listview" items="${listview}" varStatus="status">
	    <c:if test="${listview.tsstartdate != ''}">
	        {"id":'<c:out value="${listview.tsno}" />'
	        ,"title":'<c:out value="${listview.tstitle}" />'
	        ,"start":"<c:out value="${listview.tsstartdate}" />"
	        <c:if test="${listview.tsenddate != ''}">
	            ,"end":"<c:out value="${listview.tsenddate}" />"
	        </c:if>
	        } <c:if test="${!status.last}">,</c:if>
	    </c:if>
	</c:forEach>
];

$(document).ready(function() {
$('#calendar').fullCalendar({

    header: {
        left: 'prev,next today',
        center: 'title',
         right: 'month,basicWeek,basicDay' 
    },
    defaultDate: new Date(),
    navLinks: true, 
    editable: false,
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
    events: dataset
});
});


$(function(){
	$(document).on("click","button[name=insertBtn]",function(){
		
		$("#insertModal").dialog({
			title:"가이드 일정 추가",
			width:350,
			height:300, 
			modal:true,
			show:"clip",
			hide:"clip"
		});
	});
});

function sendGuide(){
	var url = "<%=cp%>/guide/insertGuide";
	
 	var query = $("#insertForm").serialize();
 	
	// AJAX-POST
	 $.ajax({
		type:"post"
		,url:url	//서버의 주소
		,data:query	//서버로 보내는 값
		,dataType:"json"
		,success:function(data){
			$("#resultLayout").html("추가완료!");
		}
		,error:function(e){
			console.log(e.responseText);
			$("#resultLayout").html("에러발생!");	
		}
	});   
}

	$(function() {
		$("#startDate").datepicker({
			showMonthAfterYear : true,
			showOn : "button",
			buttonImage : "<%=cp%>/resource/images/calendar.gif",
			buttonImageOnly : true,
			showMonthAfterYear : true
			,onClose: function( selectedDate ) {
	              $("#endDate").datepicker( "option", "minDate", selectedDate );
	           }

		})
	})
	
	$(function() {
		$("#endDate").datepicker({
			showMonthAfterYear : true,
			showOn : "button",
			buttonImage : "<%=cp%>/resource/images/calendar.gif",
			buttonImageOnly : true,
			showMonthAfterYear : true
			,onClose: function( selectedDate ) {
	               $("#startDate").datepicker( "option", "maxDate", selectedDate );
	           }

		})
	})
</script>
<script type="text/javascript" src="<c:url value='/resource/fullcalendar/fullcalendar.min.js'/>"></script>
<div class="sub-container" style="width: 960px;">
   
   <div class="sub-title">
     <h3>가이드 스케쥴</h3> 
   </div> 
    
    <div>
      
          달력<div id="calendar"></div>
      
   <br>
                <button type="button" name="insertBtn" class="btn btn-default">일정추가</button>
          
    </div>
    
    <div id="resultLayout"></div>
   
</div>

	<div id="insertModal" class="modal">
		<form name="insertForm" id="insertForm">
			<table class="modalTable">
				<tr>
					<th scope="row">가이드 선택</th>
					<td>
						<select class="input-sm" id="usersCode" name="usersCode">
							 <option value="0">::::::::: 선택 :::::::::</option>
							 <c:forEach var="vo" items="${staffList }">
							 	<option value="${vo.usersCode }">${vo.usersCode } : ${vo.name }</option>
							 </c:forEach>
		                </select>
					</td>
				</tr>
				<tr>
					<th scope="row">시작일자</th>
					<td>
						<input type="text" name="startDate" id="startDate" class="boxTF">
					</td>
				</tr>
				<tr>
					<th scope="row">종료일자</th>
					<td>
						<input type="text" name="endDate" id="endDate" class="boxTF">
					</td>
				</tr>
				<tr>
					<th scope="row">구분</th>
					<td>
						<select class="input-sm" id="timezone" name="timezone" >
							 <option value="0">::::::::: 선택 :::::::::</option>
							 <option value="1">오전</option>
							 <option value="2">오후</option>
		                </select>
					</td>
				</tr>
				<tr>
					<th scope="row">역할</th>
					<td>
						<select class="input-sm" id="role" name="role" >
							 <option value="0">::::::::: 선택 :::::::::</option>
							 <option value="미키 : 휠체어">미키 : 휠체어</option>
							 <option value="미니 : 수화">미니 : 수화</option>
							 <option value="구피 : 외국어(영어)">구피 : 외국어(영어)</option>
							 <option value="도날드 : 외국어(중국어)">도날드 : 외국어(중국어)</option>
							 <option value="데이지 : 외국어(일본어)">데이지 : 외국어(일본어)</option>
		                </select>
					</td>
				</tr>
				<tr>
					<th scope="row">메모</th>
					<td>
						<input type="text" name="memo" id="memo" class="boxTF">
					</td>
				</tr>
			</table>

			<div class="btnBox">
		        <button type="button" class="btn btn-default" onClick="sendGuide()" id="btnSendOk">확인</button>
		    </div>
		    
		    <div id="sendLayout"></div>
		</form>
	</div>