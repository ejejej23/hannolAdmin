<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
</style>

<div class="sub-container" style="width: 960px;">
    <div class="sub-title">
	  <h3>FAQ</h3>
	</div>
	
	<div>
		<ul class="nav nav-tabs">
		  <li class="nav-item active" >
		    <a class="nav-link">전체</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link">이용정보</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link">우대정보</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link">이벤트</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link">연간회원</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link">온라인예매</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link">기타</a>
		  </li>
		</ul>
    </div>
    
    <div style="margin-top: 15px;">
	    <div class="col-xs-8 col-xs-offset-2">
		  		<div class="input-group">     
		            <input type="text" class="form-control" name="searchValue" placeholder="검색할 키워드를 입력해 주세요...">
		            <span class="input-group-btn">
		                <button class="btn btn-default btn-info" type="button" onclick="searchList()"><span class="glyphicon glyphicon-search"></span></button>
		            </span>
		        </div>
		</div>
    </div>
    
    <div class="content-body">
    	<div class="content-tb">
    		<table class="table">
				<colgroup>
					<col style="width: 10%; text-align:center">
					<col style="text-align:center">
					<col style="width: 15%; text-align:center">
					<col style="width: 15%; text-align:center">
				</colgroup>
			
				<thead class="thead-light">
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col" class="txt-title">작성자</th>
						<th scope="col" class="txt-title">작성일자</th>
					</tr>
				</thead>
		
				<tbody>
			
				</tbody>
			</table>
    	</div>
    	<div class="bottom-btn">
    		<button type="button" class="btn btn-info">등록하기</button>
    	</div>
    	
    </div>
</div>