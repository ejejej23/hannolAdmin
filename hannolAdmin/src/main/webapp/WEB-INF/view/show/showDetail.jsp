<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>

<div>
<hr> 
	<div class="sub-title">
	<br><br><br>
	     <h3>상세 정보</h3>
    </div>

	<!-- 상세정보 개수만큼 반복 구간 -->
	<div>	
		<div class="form-group">
			<div class="col-sm-2">시작  ~ 종료</div>
			<div class="col-sm-4"><mark>2018-03-01 ~ 2018-11-01</mark></div>
			<div class="col-sm-2">상영시간</div>
			<div class="col-sm-4"><mark>50분</mark></div>
		</div><br>
		<div class="form-group">
			<div class="col-sm-2">공연장소</div>
			<div class="col-sm-4"><mark>가든스테이지</mark></div>
			<div class="col-sm-2">시작시간</div>
			<div class="col-sm-4"><mark>11:00, 15:00, 13:00</mark></div>
		</div><br>
		<div class="form-group">
			<div class="col-sm-2">일정보기</div>
			<div class="col-sm-10">${dto.showName}</div>
		</div><br>
	</div>
	
	<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		<tr height="35">
			<td align="center"><c:if test="${dataCount==0 }">등록된 게시물이 없습니다.</c:if>
				<c:if test="${dataCount!=0 }">${paging}</c:if></td>
		</tr>
	</table>

</div>

