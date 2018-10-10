<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript">
function cardDetail(cardCode){	
	$("#cardModal"+cardCode).modal('show');
}

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

.custom_table {
    width: 100%;
    border-top: 2px solid #cecece;
}
</style>

<div class="sub-container" style="width: 960px;">
    <div class="sub-title">
	  <h3>제휴카드</h3>
	</div> 
    	
    <form name="searchForm" method="post" action="<%=cp%>/card/list">
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
    
    <div>
		<table class="custom_table">
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
				<span style="display:block; font-weight:bold;">이용혜택</span>- 자유이용권 ${dto.discount}% 
		      </td>
		      
		      <td width="15%">
		      	 <button type="button" class="btn btn-info" onclick="cardDetail(${dto.cardCode})">상세정보</button>
		      	 <c:if test="${sessionScope.staff.authority == 'ROLE_ADMIN'}">
		      	 	<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/card/update?num=${dto.cardCode}&${query}';">수정하기</button>
		      	 	<button type="button" class="btn btn-default" onclick="deleteCard('${dto.cardCode}');">삭제하기</button>
		      	 </c:if>
		      	 
		      	 <div style="display: none;" id="cardModal${dto.cardCode}" role="dialog" class="modal" tabindex="-1">
		      	 <div class="modal-dialog">
		      	 <div class="modal-content">
		      	 	<div class="modal-header">
 						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
  						<span aria-hidden="true">×</span></button>
 						<h4 class="modal-title" id="myModalLabel" style="font-weight: bold;">
 							<c:if test="${not empty dto.logoSaveFilename}"><img src="/hannolAdmin/uploads/card/${dto.logoSaveFilename}" width="25px" height="30px"></c:if> ${dto.cardCo}
 						</h4>
					</div>
					<div class="modal-body">
						<div>
							<div align="left" style="position: relative; float: left; width: 50%; margin-bottom: 10px;">
								<div>
									<c:if test="${empty dto.saveFilename}"><img src="<%=cp%>/resource/images/NoCard.PNG" class="cardImage" onerror="this.src='<%=cp%>/resource/images/NoCard.PNG'"></c:if>
									<c:if test="${not empty dto.saveFilename}"><img src="/hannolAdmin/uploads/card/${dto.saveFilename}" class="cardImage" onerror="this.src='<%=cp%>/resource/images/NoCard.PNG'"></c:if>
								</div>						
							</div>
							<div align="left" style="position: relative; float: left; width: 50%">
								<h4 style="font-weight: bold; display: block;">${dto.cardName}</h4>
								<br>
								<span style="font-weight: bold; display: block;">이용혜택</span>
								<span style="display: block;">- 자유이용권 ${dto.discount}%</span>
								<span style="display: block;">${dto.startDate} ~ ${dto.endDate}</span>
							</div>
						</div>
						
						
						<div class="boxIn" align="left" style="clear: both; padding: 10px;">
							${dto.memo}
 						</div>
					
					</div>
					</div>
					</div>
				</div>
		      </td>
		  </tr>
		  </c:forEach>
		</table>
		
		<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
		   <tr height="40">
		      <td align="left" width="100">
		          <button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/card/list';">새로고침</button>
		      </td>
		      <td align="center">
		      	&nbsp;
		      </td>
		      <td align="right" width="100">
		      	<c:if test="${sessionScope.staff.authority == 'ROLE_ADMIN'}">
		          <button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/card/created';">글올리기</button>
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