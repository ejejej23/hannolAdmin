<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
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
<div class="body-container" style="width: 960px;">
     <div class="body-title">
        <h3><span style="font-family: Webdings">2</span> 공지사항 <span style="font-size:15px;">${dataCount}개(${page}/${total_page} 페이지)</span> </h3>
    </div> 
    
<%--     <div class="page-header">
	  <h1>공지 <small>${dataCount}개(${page}/${total_page} 페이지)</small></h1>
	</div> --%>
  
    
    <div>
		<table class="table">
			    <colgroup>
			        <col style="width: 10%; text-align:center">
			        <col style="text-align:center">
			        <col style="width: 10%; text-align:center">
			        <col style="width: 10%; text-align:center">
			        <col style="width: 10%; text-align:center">
			    </colgroup>
    
		  <thead class="thead-light">
		    <tr>
		      <th scope="col">번호</th>
		      <th scope="col">제목</th>
		      <th scope="col">작성자</th>
		      <th scope="col">작성일</th>
		    </tr>
		  </thead>
		  <tbody>
			  <c:forEach var="vo" items="${noticeList}">
			    <tr>
			      <th scope="row">공지</th>
			      <td><a href="${articleUrl}&num=${vo.noticeCode}">${vo.subject}</a></td>
			      <td>${vo.name}</td>
			      <td>${vo.created}</td>
			    </tr>
			  </c:forEach>
		  
			  	<c:forEach var="dto" items="${list}">
			    <tr>
			      <th scope="row">${dto.listNum}</th>
			      <td><a href="${articleUrl}&num=${dto.noticeCode}">${dto.subject}</a></td>
			      <td>${dto.name}</td>
			      <td>${dto.created}</td>
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
		          <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/notice/created';">글올리기</button>
		      </td>
		   </tr>
		</table>
    </div>

</div>