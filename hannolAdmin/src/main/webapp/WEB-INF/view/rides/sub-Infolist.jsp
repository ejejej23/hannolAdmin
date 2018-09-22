<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

	<div class="body-title">
     	<h3>시설상세 정보<small>${dataCount}개(${page}/${total_page} 페이지)</small></h3>
    </div> 

  <div>
    <select class="selectField" id="ridesInfo" name="ridesInfo">
		<option value="" >::상태선택::</option>
		<option value="수리요청" data-num="1">수리요청</option>
		<option value="요청확인" data-num="2">요청확인</option>
		<option value="수리중" data-num="3">수리중</option>
		<option value="수리완료" data-num="4">수리완료</option>
	</select>
		<table class="table">
		    <colgroup>
		        <col style="width: 10%; text-align:center">
		        <col style="width: 10%; text-align:center">
		        <col style="width: 10%; text-align:center">
		        <col style="width: 10%; text-align:center">
		        <col style="width: 10%; text-align:center">
		    </colgroup>
    
		  <thead class="thead-light">
		    <tr>
		      <th scope="col">
				  <input type="checkbox" name="chkAll" id="chkAll" value="chkAll" onclick="checkAll();">
		      </th>
		      <th scope="col">시설번호</th>
		      <th scope="col">시설명</th>
		      <th scope="col">상세번호</th>
		      <th scope="col">상태</th>
		    </tr>
		  </thead>
		  
		  <tbody>
			<c:forEach var="vo" items="${list}">
				<tr>
					<th scope="row">
						<input type="checkbox" name="chk" value="chk" onclick="chkSingle();">
					</th>
						<td>${vo.facilityCode}</td>
						<td>${vo.name}</td>
						<td>${vo.ridesInfoCode}</td>
						<td>
 							<c:choose>
								<c:when test="${vo.state==1}">
									수리요청
								</c:when>
								<c:when test="${vo.state==2}">
									요청확인
								</c:when>
								<c:when test="${vo.state==3}">
									수리중
								</c:when>
								<c:when test="${vo.state==4}">
									수리완료
								</c:when>
							</c:choose>
						</td>
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
	
	<div id="ridesInfoModel" class="modal">
		<form name="ridesInfoForm" method="post" id="ridesInfoForm">
			<table class="modalTable">
				<tr>
					<th scope="row">시설명</th>
					<td>
						<select class="selectField" id="name1" name="name" >
							<option value="">상태</option>
							<c:forEach var="vo" items="${list}">
								<option value=${vo.facilityCode }>${vo.name}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th scope="row">상태</th>
					<td>
						<select class="selectField" id="state" name="state" >
							<option value="">상태</option>
							<option value=1>수리요청</option>
							<option value=2>요청확인</option>
							<option value=3>수리중</option>
							<option value=4>수리완료</option>
						</select>
					</td>
				</tr>
			</table>
	
	
			<div class="btnBox">
		        <button type="button" class="btn btn-info" id="sendOk">시설등록</button>
		        <button type="reset" class="btn btn-default">다시입력</button> 
		        <button type="button" class="btn btn-default" id="ridesInfoAdd_close_btn">등록취소</button>
		    </div>
		</form>
	</div>   