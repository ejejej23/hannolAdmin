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
		f.action="<%=cp%>/state/checkListL";
		
		f.submit();
	}
	
	function statePic(){
		var f = document.picForm;
		f.action="<%=cp%>/state/piclist";
		
		f.submit();
	}
	
	
</script>

<div class="sub-container" style="width: 960px;">
	<div class="sub-title">
	  <h3>놀이기구 상태 <small>리스트</small></h3>
	</div> 

	<div style="width: 900px; border-spacing: 0px;">
		<div style="float: left; width: 40%">
		
			<form name="themeForm" id="themeForm" method="post">
				<div class="form-group" style="margin: 20px auto 0px; ">
					<label for="themeCode" class="col-sm-3 control-label text-right">테마</label>
					<select class="selectField" id="themeCode" name="themeCode" style="float: left;">
						<option value="">::테마존 선택::</option> 
						<option value="1" ${themeName=="프린세스빌리지"?"selected='selected'" : ""}>프린세스빌리지</option>
						<option value="2" ${themeName=="토이스토리"?"selected='selected'" : ""}>토이스토리 </option>
						<option value="3" ${themeName=="미니언즈"?"selected='selected'" : ""}>미니언즈 </option>
						<option value="5" ${themeName=="라이온킹"?"selected='selected'" : ""}>라이온킹 </option>
						<option value="6" ${themeName=="니모"?"selected='selected'" : ""}>니모 </option>
					</select>
				</div>
			</form>
			&nbsp;
			<button type="button" id="checkOk" onclick="checkOk();">선택</button>
			
			<form name="picForm" id="picForm" method="post">
				<div class="form-group" style="margin: 20px auto 0px;">
					<label for="facilityCode" class="col-sm-3 control-label text-right">놀이기구</label>
					<select class="selectField" id="facilityCode" name="facilityCode">
						<option value="">놀이기구 선택</option>
						<c:forEach var="vo" items="${list}">
							<option value="${vo.facilityCode}" ${facilityCode=="${facilityCode}"?"selected='selected'" : ""}>${vo.name}</option>
						</c:forEach>
					</select>
					
				</div>
				
				<div class="form-group" style="margin: 20px auto 0px;">
					<label for="timezone" class="col-sm-3 control-label text-right">시간</label>
						<select class="selectField" id="timezone" name="timezone">
							<option value="">시간선택</option>
							<option value="10" ${dto1.timezone=="10"?"selected='selected'" : ""}>10:00</option>
							<option value="11" ${dto1.timezone=="11"?"selected='selected'" : ""}>11:00</option>
							<option value="12" ${dto1.timezone=="12"?"selected='selected'" : ""}>12:00</option>
							<option value="13" ${dto1.timezone=="13"?"selected='selected'" : ""}>13:00</option>
							<option value="14" ${dto1.timezone=="14"?"selected='selected'" : ""}>14:00</option>
							<option value="15" ${dto1.timezone=="15"?"selected='selected'" : ""}>15:00</option>
							<option value="16" ${dto1.timezone=="16"?"selected='selected'" : ""}>16:00</option>
							<option value="17" ${dto1.timezone=="17"?"selected='selected'" : ""}>17:00</option>
							<option value="18" ${dto1.timezone=="18"?"selected='selected'" : ""}>18:00</option>
							<option value="19" ${dto1.timezone=="19"?"selected='selected'" : ""}>19:00</option>
							<option value="20" ${dto1.timezone=="20"?"selected='selected'" : ""}>20:00</option>
							<option value="21" ${dto1.timezone=="21"?"selected='selected'" : ""}>21:00</option>
						</select>
				</div>
			</form>
				
			<div class="form-group" style="margin: 20px auto 0px;">
				<label for="waiting" class="col-sm-3 control-label text-right">대기인원</label>
					<input type="text" name="waiting" class="selectField"
						id="waiting" placeholder="대기인원" value="${dto1.waiting}" readonly="readonly">
			</div>
			
			<div class="form-group" style="margin: 20px auto 0px;">
				<label for="boarding" class="col-sm-3 control-label text-right">탑승객 수</label>
					<input type="text" name="boarding" class="selectField"
						id="boarding" placeholder="탑승객 수" value="${dto1.boarding}" readonly="readonly">
			</div>	
		</div>
	
	
	
	<!-- 사진부분 -->
		
			<div style="width: 30%; float: left;" class="text-center" id="picChk">
				<c:if test="${picture==0}">
					<script type="text/javascript">
						alert("해당자료가 없습니다.");
					</script>
				</c:if>
				<c:if test="${picture==1}">
					<img alt="" src="<%=cp%>/resource/images/free.png"
					style="padding: 10px; margin-top: 10px; width: 200px; height: 250px;"><br>
				</c:if>
				<c:if test="${picture==2}">
					<img alt="" src="<%=cp%>/resource/images/usual.png"
					style="padding: 10px; margin-top: 10px; width: 200px; height: 250px;"><br>
				</c:if>
				<c:if test="${picture==3}">
					<img alt="" src="<%=cp%>/resource/images/wait.png"
					style="padding: 10px; margin-top: 10px; width: 200px; height: 250px;"><br>
				</c:if>
				<c:if test="${picture==4}">
					<img alt="" src="<%=cp%>/resource/images/much.png"
					style="padding: 10px; margin-top: 10px; width: 200px; height: 250px;"><br>
				</c:if>
				<c:if test="${picture==5}">
					<img alt="" src="<%=cp%>/resource/images/complex.png"
					style="padding: 10px; margin-top: 10px; width: 200px; height: 250px;"><br>
				</c:if>
			</div>
	
			<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
				<tr height="40">
					<td align="center" width="40">
						<button id="btnSend" type="button" class="btn1" onclick="statePic();">상태확인</button>
					</td>
				
					<td align="right" width="100">
						<button id="btnSend" type="button" class="btn1" onclick="javascript:location.href='<%=cp%>/state/list';">새로고침</button>
					    <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/state/created';">현황등록</button>
					</td>
				</tr>
			</table>
	
	</div>
</div>
	