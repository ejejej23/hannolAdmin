<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<form name="showInfoCreated" method="post">
	<div>	
		<div class="form-group">
			<div class="col-sm-2">시작  ~ 종료</div>
			<div class="col-sm-4"><input name="startDate" type="text" placeholder="2018-08-01"  value="${dto.startDate}" size="15" ${mode == "update"? "readonly='readonly' style='background: #F2F2F2'":""} >
					 ~ <input name="endDate" type="text" placeholder="2018-08-31"  value="${dto.endDate}" size="15" ${mode == "update"? "readonly='readonly' style='background: #F2F2F2'":""}></div> 
			<div class="col-sm-2">상영시간</div>
			<div class="col-sm-4"><input name="runningTime" type="text" placeholder="30(분)"  value="${dto.runningTime}" size="10" ></div>
		</div><br>
		<div class="form-group">
			<div class="col-sm-2">공연장소</div>
			<div class="col-sm-4" style="display: inline-block; height: 30px; width: 70%">
				<input type="text" id="facilityName" name="facilityName" placeholder="공연장을 검색하세요" value="${dto.name}"> <!-- 시설코드 -->
				<button class="btn btn-default btn-info" type="button" onclick="facilityList();"><span class="glyphicon glyphicon-search"></span></button>
				<input type="hidden" id="facilityCode" name="facilityCode" value="${dto.facilityCode}">
			</div>
		</div><br>
	</div><br>
	
	<input type="hidden" name="showCode" value="${showCode}">

	<c:if test="${mode == 'update'}">
		<input type="hidden" name="showInfoCode" value="${dto.showInfoCode}">
	</c:if>
	<div align="center"><button class="btn btn-default btn-info" type="button" onclick="createdShowInfoSubmit('${mode}')">${mode=='created'?"등록":"수정"}</button></div>
</form>

<div id="facilityList"></div>
<br><br><br>
