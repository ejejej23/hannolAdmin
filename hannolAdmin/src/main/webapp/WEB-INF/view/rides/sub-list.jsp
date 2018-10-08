<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

	<div class="sub-title">
     	<h3>어트랙션 정보 <small>${dataCount}개(${page}/${total_page} 페이지)</small></h3>
    </div> 

  <div>
    <select class="selectField" id="ridesInfo" name="ridesInfo">
		<option value="" >::상태선택::</option>
		<option value="open" data-num="4">open</option>
		<option value="close" data-num="3">close</option>
		<option value="우천" data-num="5">우천</option>
		<option value="고장" data-num="1">고장</option>
		<option value="수리중" data-num="2">수리중</option>
	</select>
		<table class="table">
		    <colgroup>
		        <col style="width: 10%; text-align:center">
		        <col style="width: 10%; text-align:center">
		        <col style="width: 10%; text-align:center">
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
		      <th scope="col">테마</th>
		      <th scope="col">어트랙션명</th>
		      <th scope="col">장르</th>
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
						<td>${vo.themeName}</td>
						<td><a href="${articleUrl}&facilityCode=${vo.facilityCode}">${vo.name}</a></td>
						<td>${vo.genreName}</td>
						<td>${vo.gubunName}</td>
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