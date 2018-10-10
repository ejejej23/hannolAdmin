<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<div style="clear: both;">
	<div>
		<table class="table">
			<colgroup>
				<col style="width: 10%; text-align:center">
				<col style="text-align:center">
				<col style="width: 15%; text-align:center">
				<col style="width: 15%; text-align:center">
				<col style="width: 10%; text-align:center">
			</colgroup>
		    
			<thead class="thead-light">
				<tr>
					<th scope="col">번호</th>
				    <th scope="col">제목</th>
				    <th scope="col">작성일</th>
				    <th scope="col">작성자</th>
				    <th scope="col">상태</th>
				</tr>
			</thead>
			<tbody>
			  <c:forEach var="dto" items="${list}">
			    <tr>
			      <td>${dto.listNum}</td>
			      <td><a href="${articleUrl}&num=${dto.qnaCode}">${dto.subject}</a></td>
			      <td>${dto.qDate}</td>
			      <td>${dto.memberId}</td>
			      <td>
			      	<c:if test="${dto.answer != 0}">
			      		답변완료
			      	</c:if>
			      </td>
			    </tr>
			  </c:forEach>
		  </tbody>
		</table>
				
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		    <tr height="35">
			    <td align="left" width="100">
				   <button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/question/list?gubun=${gubun}';">새로고침</button>
		    	</td>
				<td align="center">
					<c:if test="${dataCount==0 }">등록된 게시물이 없습니다.</c:if>
					<c:if test="${dataCount!=0 }">${paging}</c:if>
			 	</td>
			 </tr>
		</table>		
	</div>
</div>
