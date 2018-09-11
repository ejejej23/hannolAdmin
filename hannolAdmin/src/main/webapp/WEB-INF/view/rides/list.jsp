<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style>
.gitf-form-control{
	background: url(<%=cp%>/resource/images/item_list.png) no-repeat right 2px;
}

.col-xs-8:after{
	content:''; display:block; clear:both;
}

.col-xs-offset-2{
	width: 40%;
}

.col-xs-8{
 	float: none;
 	margin: 10px auto;
}
</style>

<script type="text/javascript">
	function searchList() {
		var f=document.searchForm;
		f.submit();
	}
</script>
<div class="sub-container" style="width: 960px;">
     <div class="body-title">
        <h3><span style="font-family: Webdings">2</span> 어트랙션 정보 <span style="font-size:15px;">${dataCount}개(${page}/${total_page} 페이지)</span> </h3>
    </div>  
    
    <div>
    
		<select class="selectField" id="state" name="state">
			<option value="">선 택</option>
			<option value="open" ${dto.tel1=="010" ? "selected='selected'" : ""}>010</option>
			<option value="close" ${dto.tel1=="011" ? "selected='selected'" : ""}>011</option>
			<option value="우천" ${dto.tel1=="018" ? "selected='selected'" : ""}>018</option>
			<option value="고장" ${dto.tel1=="019" ? "selected='selected'" : ""}>019</option>
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
				  <input type="checkbox" name="chkAll" value="chkAll">
		      </th>
		      <th scope="col">시설번호</th>
		      <th scope="col">테마</th>
		      <th scope="col">장르</th>
		      <th scope="col">어트랙션명</th>
		      <th scope="col">설치날짜</th>
		      <th scope="col">제거날짜</th>
		      <th scope="col">상태</th>
		    </tr>
		  </thead>
		  
		  <tbody>
			<c:forEach var="vo" items="${list}">
				<tr>
				  <th scope="row">
					  <input type="checkbox" name="chk" value="chk">
				  </th>
				  <td><a href="${articleUrl}&num=${vo.facilityCode}">${vo.facilityCode}</a></td>
				<td>${vo.themeName}</td>
				<td>${vo.genreName}</td>
				<td>${vo.name}</td>
				<td>${vo.installDate}</td>
				<td>${vo.removeDate}</td>
				
				<c:choose>
					<c:when test="${vo.state==0}">
						<td>요청</td>
					</c:when>
					<c:when test="${vo.state==1}">
						<td>요청확인</td>
					</c:when>
					<c:when test="${vo.state==3}">
						<td>수리중</td>
					</c:when>
					<c:when test="${vo.state==4}">
						<td>수리완료</td>
					</c:when>
				</c:choose>
				
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
		
		<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
		   <tr height="40">
		      <td align="left" width="100">
		          <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/notice/list';">새로고침</button>
		      </td>
		      <td align="center">
		      	<form name="searchForm" method="post" action="<%=cp%>/notice/list">
		          	<div class="col-xs-8 col-xs-offset-2">
					  		<div class="input-group">
					            <input type="hidden" name="searchKey" value="all">         
					            <input type="text" class="form-control" name="searchValue" placeholder="검색할 키워드를 입력해 주세요...">
					            <span class="input-group-btn">
					                <button class="btn btn-default btn-info" type="button" onclick="searchList()"><span class="glyphicon glyphicon-search"></span></button>
					            </span>
					        </div>
					</div>
				</form>
		      </td>
		      <td align="right" width="100">
		          <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/rides/created';">글올리기</button>
		      </td>
		   </tr>
		</table>
		
    </div>

</div>   