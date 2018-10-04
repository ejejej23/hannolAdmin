<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">
function deleteGrade(gradeCode) {
	<c:if test="${sessionScope.staff.authority=='ROLE_ADMIN'}">
		var url = "<%=cp%>/grade/delete?num="+gradeCode;

		if(confirm("위 자료를 삭제 하시 겠습니까 ? ")) {
				location.href=url;
		}
	</c:if>    

	<c:if test="${sessionScope.staff.authority!='ROLE_ADMIN'}">
		alert("게시물을 삭제할 수  없습니다.");
	</c:if>
	}
</script>

<style type="text/css">
.cardImage{
	width: 8em;
	height: 8em;
}

.cardImage_dialog{
	width: 17em;
	height: 80%;
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

.boxIn{
	width:100%;
    background-color:#F6F6F6;
}

.modal-dialog{
	width: 570px;
}

.custom_table {
    width: 100%;
    border-top: 2px solid #cecece;
}

}
</style>

<div class="sub-container" >
    
    <div class="sub-title">
	  <h3>등급관리</h3>
	</div> 
    	
   
    
    <div>
		<table  class="custom_table">
		  <c:forEach var="dto" items="${list}">
		  <tr align="center" style="border-bottom: 1px solid #cccccc;"> 
		      <td rowspan="2" width="20%">
		      	<c:if test="${empty dto.saveFileName}"><img src="<%=cp%>/resource/images/noimage.png" class="cardImage" style="padding: 5px;" onerror="this.src='<%=cp%>/resource/images/noimage.png'"></c:if>
		      	<c:if test="${not empty dto.saveFileName}"><img src="<%=cp%>/uploads/grade/${dto.saveFileName}" class="cardImage" style="padding: 5px;" onerror="this.src='<%=cp%>/resource/images/noimage.png'"></c:if>
		      </td>
		      <td colspan="2" width="80%" align="left" style="padding-left: 1em; padding-right: 1em; height: 3em;">
		           	<h4 style="font-weight: bold;">${dto.gradeName}</h4>
		      </td>
		  </tr>
		  <tr style="border-bottom: 1px solid #cccccc;">
		  	  <td width="55%" align="left" style="white-space:pre-line; padding-left: 1em; padding-right: 1em; height: 7em;"><span style="font-weight: bold;">조건</span>
					<c:if test="${dto.gradeName eq 'FIRST'}">- 가입 고객</c:if>
					<c:if test="${dto.gradeName ne 'FIRST'}">- 연 ${dto.condition}만원 이상 구매 회원</c:if>
				<span style="display:block;8 font-weight:bold;">혜택</span>- ${dto.benefit}
		      </td>
		      
		      <td width="15%">
		      <c:if test="${dto.gradeName ne 'FIRST'}">
		      	 	<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/grade/update?num=${dto.gradeCode}';">수정하기</button>
		      	 	<button type="button" class="btn btn-default" style="margin-top: 5px;" onclick="deleteGrade(${dto.gradeCode});">삭제하기</button>
		      </c:if>
		      </td>
		  </tr>
		  </c:forEach>
		</table>
		
		<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
		   <tr height="40">
		      <td align="left" width="100">
		          &nbsp;
		      </td>
		      <td align="center">
		      	&nbsp;
		      </td>
		      <td align="right" width="100">
		          <button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/grade/created';">등급추가</button>
		      </td>
		   </tr>
		</table>
		
		
		 
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
		        ${paging}
			</td>
		   </tr>
		</table>
    </div>

</div>