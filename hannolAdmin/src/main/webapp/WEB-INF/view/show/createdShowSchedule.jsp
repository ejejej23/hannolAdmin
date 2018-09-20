<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<form name="showSchedule" method="post">
	<div class="form-group" align="center">
		<table  style="width: 80%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse; border-top: 2px solid #005dab;">
			  <tr align="center" height="30em" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="20%">상영 날짜</td>
			      <td width="80%" align="center" style="padding-left: 1em; padding-right: 1em;">시작시간</td>
			  </tr>						  
			  <tr align="center" height="30em" style="border-bottom: 1px solid #cccccc;"> 
			      <td width="20%"><input name="screenDate" type="text" placeholder="2018-08-01"  value="${dto.screenDate}" size="15"></td>
			      <td width="80%" align="left" style="padding-left: 1em; padding-right: 1em;">
				      <span id="showTimeList" style="text-align: left; margin-left: 15px;">  
				      		<c:if test="${mode=='created'}">
			                   <input type="text" name="startTimeList" size="4" class="boxTF" placeholder="11:30"/>
			                   <input type="text" name="startTimeList" size="4" class="boxTF" placeholder="11:30"/>
			                   <input type="text" name="startTimeList" size="4" class="boxTF" placeholder="11:30"/>
			                   <input type="text" name="startTimeList" size="4" class="boxTF" placeholder="11:30"/>
			                   <input type="text" name="startTimeList" size="4" class="boxTF" placeholder="11:30"/>
		                   </c:if>
		                   <c:if test="${mode=='update'}">
		                   		<c:forEach items="${list}" var="vo">
		                   			<input type="text" name="startTimeList" size="4" class="boxTF" placeholder="11:30" value="${vo}"/>
		                   		</c:forEach>
		                   </c:if>
		              </span>
			      </td>
			  </tr>
		</table><br>
		
		<input type="hidden" name="showInfoCode" value="${showInfoCode}">
		<input type="hidden" name="showCode" value="${showCode}">
		
		<c:if test="${mode=='update'}">
			<input type="hidden" name="schCode" value="${dto.schCode}">
		</c:if>
		
        <div align="center">
        	<button class="btn btn-default btn-info" type="button" onclick="createdShowScheduleSubmit('${mode}', '${showInfoCode}');">${mode=='created'?"등록":"수정"}</button>
        </div>
	</div><br>
</form>
<br><br><br>

