<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<script type="text/javascript">
	function checkOk(){
		var f = document.themeForm;
		f.action="<%=cp%>/state/checkList";
		
		f.submit();
	}
	
	function sendOk(){
		var f = document.createdForm;
		f.action="<%=cp%>/state/created";
		
		f.submit();
	}
	
	function calcul(){
		
			
	}
	
</script>

<div class="sub-container" style="width: 960px;">

	<div class="body-title">
		<h3>놀이기구 상태(등록) </h3>
	</div>

	<div style="width: 900px; border-spacing: 0px;">
		<div style="float: left; width: 40%">
		
			<div class="form-group" style="margin: 20px auto 0px; ">
				<form name="themeForm" id="themeForm" method="post">
					<label for="themeCode" class="col-sm-3 control-label text-right">테마</label>
					<select class="selectField" id="themeCode" name="themeCode" style="float: left;">
						<option value="">::테마존 선택::</option> 
						<option value="1" ${themeName=="프린세스빌리지"?"selected='selected'" : ""}>프린세스빌리지</option>
						<option value="2" ${themeName=="토이스토리"?"selected='selected'" : ""}>토이스토리 </option>
						<option value="3" ${themeName=="미니언즈"?"selected='selected'" : ""}>미니언즈 </option>
						<option value="5" ${themeName=="라이온킹"?"selected='selected'" : ""}>라이온킹 </option>
						<option value="6" ${themeName=="니모"?"selected='selected'" : ""}>니모 </option>
					</select>
				</form>
				&nbsp;
				<button type="button" id="checkOk" onclick="checkOk();">선택</button>
			</div>
				
			<form name="createdForm" id="createdForm" method="post">
				<div class="form-group" style="margin: 20px auto 0px;">
					<label for="facilityCode" class="col-sm-3 control-label text-right">놀이기구</label>
					<select class="selectField" id="facilityCode" name="facilityCode">
						<option value="">놀이기구 선택</option>
						<c:forEach var="vo" items="${list}">
							<option value="${vo.facilityCode}">${vo.name}</option>
						</c:forEach>
					</select>
				</div>
				
				<!-- 컨트롤러 list들어올때 오늘날짜 넘겨줘서 사용하기
				<div class="form-group" style="margin: 20px auto 0px;">
					<label for="recordDate" class="col-sm-3 control-label text-right">날짜</label>
						<input type="text" name="recordDate" class="selectField"
							id="recordDate" placeholder="오늘날짜" readonly="readonly">
				</div> -->
				
				<div class="form-group" style="margin: 20px auto 0px;">
					<label for="timezone" class="col-sm-3 control-label text-right">시간</label>
						<select class="selectField" id="timezone" name="timezone">
							<option value="">시간선택</option>
							<option value="10">10:00</option>
							<option value="11">11:00</option>
							<option value="12">12:00</option>
							<option value="13">13:00</option>
							<option value="14">14:00</option>
							<option value="15">15:00</option>
							<option value="16">16:00</option>
							<option value="17">17:00</option>
							<option value="18">18:00</option>
							<option value="19">19:00</option>
							<option value="20">20:00</option>
							<option value="21">21:00</option>
						</select>
				</div>
					
				<div class="form-group" style="margin: 20px auto 0px;">
					<label for="waiting" class="col-sm-3 control-label text-right">대기인원</label>
						<input type="text" name="waiting" class="selectField"
							id="waiting" placeholder="대기인원">
							
				</div>
				
				<div class="form-group" style="margin: 20px auto 0px;">
					<label for="boarding" class="col-sm-3 control-label text-right">탑승객 수</label>
						<input type="text" name="boarding" class="selectField"
							id="boarding" placeholder="탑승객 수">
				</div>	
			</form>		
			</div>
			
				<div style="width: 30%; float: left;" class="text-center" id="picChk">
					<img alt="" src="<%=cp%>/resource/images/questionFin.png"
					style="padding: 10px; margin-top: 10px; width: 200px; height: 250px;"><br>
				</div>

			<table  style="width: 100%; margin: 20px auto; border-spacing: 0px;">
				<tr height="100">
					<td align="left" width="100">
						<button id="btnSend" type="button" class="btn1" onclick="javascript:location.href='<%=cp%>/state/list';">돌아가기</button>
					</td>
					
					<td align="center" width="100">
						<button id="btnSend" type="button" class="btn1" onclick="javascript:location.href='<%=cp%>/state/created';">새로고침</button>
						<button type="button" class="btn" onclick="sendOk();">등록</button>
					</td>
				</tr>
			</table>
		

	</div>
	
	</div>
	