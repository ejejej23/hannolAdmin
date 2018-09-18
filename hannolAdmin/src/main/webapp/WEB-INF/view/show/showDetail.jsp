<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script>
$(function() {
	$(".toggle").click(function() {
		var showInfoCode = $(this).attr("data-showInfoCode");
		var state = $("#moreScheduleLayout"+showInfoCode).css('display');
		
		if(state == 'none'){
			$("#moreScheduleLayout"+showInfoCode).show();
			$("#toggleButton"+showInfoCode).text("일정 보기 △");
		} else {
			$("#moreScheduleLayout"+showInfoCode).hide();
			$("#toggleButton"+showInfoCode).text("일정 보기 ▼"); 
		}
	});
});
</script>

<div>
<hr> 
	<div class="sub-title">
	<br><br><br>
	     <h3>상세 정보</h3>
    </div>

	<c:forEach items="${list}" var="dto">
		<!-- 상세정보 개수만큼 반복 구간 -->
		<div>	
			<div class="form-group">
				<div class="col-sm-2">시작  ~ 종료</div>
				<div class="col-sm-4"><mark>${dto.startDate} ~ ${dto.endDate}</mark></div> 
				<div class="col-sm-2">상영시간</div>
				<div class="col-sm-4"><mark>${dto.runningTime}분</mark></div>
			</div><br>
			<div class="form-group">
				<div class="col-sm-2">공연장소</div>
				<div class="col-sm-4"><mark>${dto.name}</mark></div>
				<div class="col-sm-2">시작시간</div>
				<div class="col-sm-4">
					<mark>
						<c:forEach items="${dto.showTime}" var="st" varStatus="status">
							${st}&nbsp;${(status.last) ? "" : " , "}
						</c:forEach>
					</mark>
				</div>
			</div><br>
			<div class="form-group">
				<div class="col-sm-2">&nbsp;</div>
				<div class="col-sm-10 toggle" id="toggleButton${dto.showInfoCode}" data-showInfoCode="${dto.showInfoCode}">일정 보기 ▼</div><br>
				<div class="col-sm-10" id="moreScheduleLayout${dto.showInfoCode}" style="display: none;">
					<table  style="width: 80%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse; border-top: 2px solid #005dab;">
					
						<c:forEach items="${dto.showScheduleList}" var="vo">
							  <tr align="center" height="30em" style="border-bottom: 1px solid #cccccc;"> 
							      <td width="30%">${vo.screenDate}</td>
							      <td width="70%" align="left" style="padding-left: 1em; padding-right: 1em;">
							      	<c:forEach items="${vo.showStartTimeList}" var="sst" varStatus="status">
							      		${sst.startTime}&nbsp;${(status.last) ? "" : " , "}
							      	</c:forEach>
							      </td>
							  </tr>
						</c:forEach>
						<c:if test="${empty dto.showScheduleList}">
							<tr align="center" height="30em" style="border-bottom: 1px solid #cccccc;">
								<td>등록된 일정이 없습니다.</td>
							</tr> 
						</c:if>
					
					</table>
				</div>
			</div><br>
		</div><br>
	</c:forEach>	
	
	<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		<tr height="35">
			<td align="center"><c:if test="${dataCount==0 }">등록된 게시물이 없습니다.</c:if>
				<c:if test="${dataCount!=0 }">${paging}</c:if></td>
		</tr>
	</table>

</div>
