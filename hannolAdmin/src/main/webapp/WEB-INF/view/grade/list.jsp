<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">

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

}
</style>

<div class="sub-container" >
    
    <div class="sub-title">
	  <h3>등급관리</h3>
	</div> 
    	
   
    
    <div>
		<table  style="width: 100%; height: 13em; margin: 0px auto; border-spacing: 0px; border-collapse: collapse; border-top: 2px solid #005dab;">
		  <c:forEach var="dto" items="${list}">
		  <tr align="center" style="border-bottom: 1px solid #cccccc;"> 
		      <td rowspan="2" width="30%">
		      	<c:if test="${empty dto.saveFilename}"><img src="<%=cp%>/resource/images/NoCard.PNG" class="cardImage" style="padding: 5px;" onerror="this.src='<%=cp%>/resource/images/NoCard.PNG'"></c:if>
		      	<c:if test="${not empty dto.saveFilename}"><img src="/hannolAdmin/uploads/card/${dto.saveFilename}" class="cardImage" style="padding: 5px;" onerror="this.src='<%=cp%>/resource/images/NoCard.PNG'"></c:if>
		      </td>
		      <td colspan="2" width="70%" align="left" style="padding-left: 1em; padding-right: 1em; height: 3em;">
		           	<h4 style="font-weight: bold;">${dto.cardName}</h4>
		      </td>
		  </tr>
		  <tr style="border-bottom: 1px solid #cccccc;">
		  	  <td width="55%" align="left" style="white-space:pre-line; padding-left: 1em; padding-right: 1em; height: 7em;"><span style="font-weight: bold;">카드사</span>
					- ${dto.cardCo}
				<span style="display:block; font-weight:bold;">이용혜택</span>- 자유이용권 ${dto.discount}% (본인에 한함. 전 놀이공원 1일, 1회)
		      </td>
		      
		      <td width="15%">
		      	 <button type="button" class="btn btn-info" onclick="cardDetail(${dto.cardCode})">상세정보</button>
		      	 <c:if test="${sessionScope.staff.authority == 'ROLE_ADMIN'}">
		      	 	<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/card/update?num=${dto.cardCode}&${query}';">수정하기</button>
		      	 	<button type="button" class="btn btn-default" onclick="deleteCard('${dto.cardCode}');">삭제하기</button>
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
		          <button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/card/created';">카드등록</button>
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