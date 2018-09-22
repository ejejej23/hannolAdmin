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
	
	$(function(){
		$(document).on("click","button[name=detail]",function(){
			var num = $(this).closest("tr").children().eq(1).text();
			
			location.href = "<%=cp%>/staff/staff?mode=update&num="+num;
		});
	});
</script>
<div class="sub-container" >
    
    <div class="sub-title">
	  <h3>직원 <small>${dataCount}명(${page}/${total_page} 페이지)</small></h3>
	</div> 
  
  	<div>
  		<form name="searchForm" method="post" action="<%=cp%>/staff/list">
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
  	</div>
    
    <div>
		<table class="table">
			    <colgroup>
			        <col style="width: 5%; text-align:center">
			        <col style="text-align:center">
			        <col style="width: 10%; text-align:center">
			        <col style="width: 10%; text-align:center">
			        <col style="width: 10%; text-align:center">
			        <col style="width: 10%; text-align:center">
			        <col style="width: 20%; text-align:center">
			        <col style="width: 15%; text-align:center">
			        <col style="width: 10%; text-align:center">
			    </colgroup>
    
		  <thead class="thead-light">
		    <tr>
		      <th scope="col">번호</th>
		      <th scope="col">사원번호</th>
		      <th scope="col">이름</th>
		      <th scope="col">아이디</th>
		      <th scope="col">부서</th>
		      <th scope="col">직위</th>
		      <th scope="col">업무</th>
		      <th scope="col">테마</th>
		      <th scope="col"></th>
		    </tr>
		  </thead>
		  <tbody>
			  	<c:forEach var="dto" items="${list}">
			    <tr>
			      <th scope="row">${dto.listNum}</th>
			      <td>${dto.usersCode }</td>
			      <td>${dto.name }</td>
			      <td>${dto.staffId }</td>
			      <td>${dto.dpName }</td>
			      <td>${dto.positionName }</td>
			      <td>${dto.task }</td>
			      <td>${dto.themeName }</td>
			      <td><button class="btn btn1" name="detail">상세</button></td>
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
		          <button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/staff/list';">새로고침</button>
		      </td>
		      <td align="center">
		      	&nbsp;
		      </td>
		      <td align="right" width="100">
		          <button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/staff/created';">글올리기</button>
		      </td>
		   </tr>
		</table>
    </div>

</div>