<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">

function searchList() {
	var f=document.searchForm;
	f.submit();
}

function deleteCard(cardCode) {
	if(confirm("삭제 하시겠습니까 ?")) {
		var url="<%=cp%>/card/delete?num="+cardCode+"&${query}";
		location.href=url;
	}
}

</script>

<style type="text/css">
.cardImage{
	width: 18em;
	height: 11em;
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

.note{
	border: 1px solid #e1e1e1;
    background: #f8f8f8;
    padding: 5px;
    width: 75px;
}
</style>

<div class="sub-container">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-bookmark"></span> 이벤트 </h3>
    </div>
    	
    <div>
		<table  style="width: 100%; height: 13em; margin: 0px auto; border-spacing: 0px; border-collapse: collapse; border-top: 2px solid #005dab;">
		  <c:forEach var="dto" items="${list}">
		  <tr align="center" style="border-bottom: 1px solid #cccccc;"> 
		      <td rowspan="2" width="30%">
		      	<c:if test="${empty dto.saveFilename}"><a href="${articleUrl}&num=${dto.eventCode}"><img src="<%=cp%>/resource/images/noimage.png" class="cardImage" style="padding: 5px;" onerror="this.src='<%=cp%>/resource/images/noimage.png'"></a></c:if>
		      	<c:if test="${not empty dto.saveFilename}"><a href="${articleUrl}&num=${dto.eventCode}"><img src="/hannolAdmin/uploads/eventFile/${dto.saveFilename}" class="cardImage" style="padding: 5px;" onerror="this.src='<%=cp%>/resource/images/noimage.png'"></a></c:if>
		      </td>
		      <td colspan="2" width="70%" align="left" style="padding-left: 1em; padding-right: 1em; height: 3em;">
		           	<h4 style="font-weight: bold;">${dto.subject}</h4>
		      </td>
		  </tr>
		  <tr style="border-bottom: 1px solid #cccccc; text-align: center;">
		  	  <td width="55%" align="left" style="white-space:pre-line; padding-left: 1em; padding-right: 1em; height: 7em; line-height: 1.2;">
		  	  <span style="display:block;"><strong>이벤트 시작일자</strong> : ${dto.startDate }</span>
					<span style="display:block;"><strong>이벤트 종료일자</strong>  : ${dto.endDate }</span>
		      </td>
		      
		      <td width="15%" >
		      		<div  class="note">
			      		<span style="display:block; font-weight:bold;">상태</span>
			      	 	<span style="display:block;" >${dto.state == 0?"비공개":"공개" } </span>
		      		</div>
		      </td>
		      
		  </tr>
		  </c:forEach>
		</table>
		
		<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
		   <tr height="40">
		      <td align="left" width="100">
		          <button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/event/list';">새로고침</button>
		      </td>
		      <td align="center">
		      	&nbsp;
		      </td>
		      <td align="right" width="100">
		      	<c:if test="${sessionScope.staff.authority == 'ROLE_ADMIN'}">
		          <button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/event/created';">글올리기</button>
		      	</c:if>
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