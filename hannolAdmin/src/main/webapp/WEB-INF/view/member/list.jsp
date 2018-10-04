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
<div class="sub-container" >
    
    <div class="sub-title">
	  <h3>회원 <small>${dataCount}명(${page}/${total_page} 페이지)</small></h3>
	</div> 
  
  	<div>
  		<form name="searchForm" method="post" action="<%=cp%>/member/list">
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
			        <col style="width: 10%; text-align:center">
			        <col style="width: 10%; text-align:center">
			        <col style="text-align:center">
			        <col style="width: 10%; text-align:center">
			        <col style="width: 10%; text-align:center">
			        <col style="width: 15%; text-align:center">
			        <col style="width: 10%; text-align:center">
			        <col style="width: 5%; text-align:center">
			    </colgroup>
    
		  <thead class="thead-light">
		    <tr>
		      <th scope="col">번호</th>
		      <th scope="col">회원번호</th>
		      <th scope="col">등급</th>
		      <th scope="col">아이디</th>
		      <th scope="col">이름</th>
		      <th scope="col">생년월일</th>
		      <th scope="col">전화번호</th>
		      <th scope="col">탈퇴여부</th>
		      <th scope="col"></th>
		    </tr>
		  </thead>
		  <tbody>
			  	<c:forEach var="dto" items="${list}">
			    <tr>
			      <th scope="row">${dto.listNum}</th>
			      <td>${dto.usersCode}</td>
			      <td>${dto.gradeName}</td>
			      <td>${dto.memberId}</td>
			      <td>${dto.memberName}</td>
			      <td>${dto.birth}</td>
			      <td>${dto.tel}</td>
			      <td>${dto.isMember}</td>
			      <td><button class="btn btn1" name="detail" onclick="javascript:location.href='${articleUrl}&num=${dto.usersCode}';">상세</button></td>
			    </tr>
			    </c:forEach>
		  </tbody>
		</table>
		
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
			        <c:if test="${dataCount==0 }">가입한 회원이 없습니다.</c:if>
			        <c:if test="${dataCount!=0 }">${paging}</c:if>
			 </td>
		   </tr>
		</table>
		
		<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
		   <tr height="40">
		      <td align="left" width="100">
		          <button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/member/list';">새로고침</button>
		      </td>
		      <td align="center">
		      	&nbsp;
		      </td>
		      <td align="right" width="100">
		          &nbsp;
		      </td>
		   </tr>
		</table>
    </div>

</div>