<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style>
	.facilityImage{
		width: 9em;
		height: 9em;
	}
</style>

<script type="text/javascript">
</script>

<div class="sub-container" style="width: 960px;">
     <div class="sub-title">
	  <h3>시설 관리 <small>${dataCount}개(${page}/${total_page} 페이지)</small></h3>
	</div> 
    
	 <div>
		<div>
		<table class="table">
		  <thead class="thead-light">
		    <tr>
		      <th scope="col">시설번호</th>
		      <th scope="col">시설구분</th>
		      <th scope="col">시설명</th>
		      <th scope="col">테마명</th>
		      <th scope="col">시설상태</th>
		      <th scope="col">설치일자</th>
		      <th scope="col">제거일자</th>
		      <th scope="col">시설사진</th>
		      <th scope="col">시설위치사진</th>
		      <th scope="col">설명</th>
		    </tr>
		  </thead>
		  
		  <tbody>
			<c:forEach var="vo" items="${list}">
				<tr>
					<td style="width: 60px;">${vo.facilityCode}</td>
					<td>${vo.gubunName}</td>
					<td ><a href="${articleUrl}&facilityCode=${vo.facilityCode}">${vo.name}</a></td>
					<td>${vo.themeName}</td>
					<td style="width: 70px;">
						${vo.state==0?"이용불가":"이용가능"}
						
					</td>
					<td>${vo.installDate}</td>
					<td>${vo.removeDate}</td>
					<td>
						<c:if test="${empty vo.saveMainFilename}"><img src="<%=cp%>/resource/images/noimage.png"  class="facilityImage" 
									onerror="this.src='<%=cp%>/resource/images/noimage.png'"></c:if>
						<c:if test="${not empty vo.saveMainFilename}"><img src="/hannolAdmin/uploads/facility/${vo.saveMainFilename}" class="facilityImage" 
									onerror="this.src='<%=cp%>/resource/images/noimage.png'"></c:if>
					</td>
					<td>
						<c:if test="${empty vo.saveLocFilename}"><img src="<%=cp%>/resource/images/noimage.png" class="facilityImage" 
									onerror="this.src='<%=cp%>/resource/images/noimage.png'"></c:if>
						<c:if test="${not empty vo.saveLocFilename}"><img src="/hannolAdmin/uploads/facility/${vo.saveLocFilename}" class="facilityImage" 
									onerror="this.src='<%=cp%>/resource/images/noimage.png'"></c:if>
										
					</td>
					<td>${vo.memo}</td>
				</tr>
			</c:forEach>
		  </tbody>
		</table>
		
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
			        <c:if test="${dataCount==0 }">등록된 게시물이 없습니다.</c:if>
			        <c:if test="${dataCount!=0 }">${paging}</c:if>
			 </td>
		   </tr>
		</table>

	</div>
			<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
				<tr height="40">
					<td align="left" width="100">
					    <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/facility/list';">새로고침</button>
					</td>
					
					<td align="right" width="100">
					<c:if test="${sessionScope.staff.authority == 'ROLE_ADMIN' }">
						<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/facility/created';">추가하기</button>
					</c:if>
					</td>
				</tr>
			</table>
    </div> 
</div>   

<div id="picture1Model" class="modal">
	<form name="facilityForm" method="post">
		<table class="modalTable">
			<tr>
				<td><img alt="..." src="<%=cp%>/resource/images/card.jpg">
			</tr>		
		</table>
	</form>
</div>

<div id="picture2Model" class="modal">
	<form name="facilityForm" method="post">
		<table class="modalTable">
			<tr>
				<td><img alt="..." src="<%=cp%>/resource/images/loading_map.gif">
			</tr>		
		</table>
	</form>
</div>

<div id="facilityModel" class="modal">
	<form name="facilityForm" method="post">
		<table class="modalTable">
			<tr>
				<th scope="row">시설번호</th>
				<td><input type="text" name="facilityCode" class="facilityCode" ></td>
			</tr>
			<tr>
				<th scope="row">시설구분</th>
				<td><input type="text" name="gubunName" class="gubunName"></td>
			</tr>
			<tr>
				<th scope="row">시설명</th>
				<td><input type="text" name="name" class="name"></td>
			</tr>
			<tr>
				<th scope="row">테마명</th>
				<td><input type="text" name="themeName" class="themeName"></td>
			</tr>

			<tr>
				<th scope="row">시설상태</th>
				<td><input type="text" name="state" class="state"></td>
			</tr>
			<tr>
				<th scope="row">설치일자</th>
				<td><input type="text" name="installDate" class="installDate" readonly="readonly"></td>
			</tr>
			<tr>
				<th scope="row">제거일자</th>
				<td><input type="text" name="removeDate" class="removeDate"  readonly="readonly"></td>
			</tr>
			<tr>
				<th scope="row">시설사진</th>
				<td> <input type="text" name="saveMainFilename" class="saveMainFilename"><button type="button" class="picture1">사진보기</button></td>
			</tr>
			<tr> 
				<th scope="row">시설위치사진</th>
				<td> <input type="text" name="saveLocFilename" class="saveLocFilename"><button type="button" class="picture2">사진보기</button></td>
			</tr>
			<tr> 
				<th scope="row">설명</th>
				<td><textarea name="memo" class="memo"></textarea></td>
			</tr>
		</table>
		
<!-- 		<div class="btnBox">
	        <button type="button" class="btn btn-info" id="sendOk">시록</button>
	        <button type="reset" class="btn btn-default">다시입력</button> 
	        <button type="button" class="btn btn-default" id="facilityAdd_close_btn">?</button>
	    </div> -->
	</form>
</div>
	    
