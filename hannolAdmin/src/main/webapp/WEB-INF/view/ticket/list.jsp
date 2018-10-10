<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">
	function searchList() {
		var f=document.searchForm;
		f.submit();
	}
</script>
<div class="sub-container" style="width: 960px;">
    
    <div class="sub-title">
	  <h3>이용권관리 <small>${dataCount}개(${page}/${total_page} 페이지)</small></h3>
	</div> 
  
  	<div>
  		<form name="searchForm" method="post" action="<%=cp%>/ticket/list">
          	<div class="col-xs-8 col-xs-offset-2">
			  		<div class="input-group">
			            <input type="hidden" name="searchKey" value="goodsName">         
			            <input type="text" class="form-control" name="searchValue" placeholder="검색할 키워드를 입력해 주세요...">
			            <span class="input-group-btn">
			                <button class="btn btn-default btn-info" type="button" onclick="searchList()"><span class="glyphicon glyphicon-search"></span></button>
			            </span>
			        </div>
			</div>
		</form>
  	</div>
    
    <div>
		<table class="table">
			    <colgroup>
			        <col style="text-align:center">
			        <col style="text-align:center">
			        <col style="text-align:center">
			        <col style="text-align:center">
			    </colgroup>
    
		  <thead class="thead-light">
		    <tr>
		      <th scope="col">상품명</th>
		      <th scope="col">상품가격</th>
		      <th scope="col">상태</th>
		      <th scope="col">구분</th>
		    </tr>
		  </thead>
		  <tbody>
			  <c:forEach var="vo" items="${list}">
			    <tr>
			      <th><a href="${articleUrl}&goodsCode=${vo.goodsCode}">[${vo.gubunName}]${vo.goodsName}</a></th>
			      <td><fmt:formatNumber value="${vo.goodsPrice}" type="number"/>원</td>
			      <td>${vo.state==1 ? "사용중" : "사용안함"}</td>
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
		
		<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
		   <tr height="40">
		      <td align="left" width="100">
		          <button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/ticket/list';">새로고침</button>
		      </td>
		      <td align="center">
		      	&nbsp;
		      </td>
		      <td align="right" width="100">
		      	<c:if test="${sessionScope.staff.authority == 'ROLE_ADMIN' }">
		          <button type="button" class="btn btn-info" onclick="javascript:location.href='<%=cp%>/ticket/created';">등록하기</button>
		      	</c:if>
		      </td>
		   </tr>
		</table>
    </div>

</div>