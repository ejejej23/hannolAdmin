<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<script type="text/javascript" src="<%=cp%>/resource/jquery/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
function cardDetail(){	
	$("#cardModal").modal('show');
}
</script>

<style type="text/css">
.cardImage{
	width: 18em;
	height: 90%;
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
    white-space:pre-line;
    background-color:#F6F6F6;
}

.modal-dialog{
	width: 570px;
}

}
</style>

<div class="sub-container">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-credit-card"></span> 제휴카드 </h3>
    </div>	
    
    <div class="col-xs-8 col-xs-offset-2">
  		<div class="input-group">
            <input type="hidden" name="search_param" value="all" id="search_param">         
            <input type="text" class="form-control" name="x" placeholder="검색할 키워드를 입력해 주세요...">
            <span class="input-group-btn">
                <button class="btn btn-default btn-info" type="button"><span class="glyphicon glyphicon-search"></span></button>
            </span>
        </div>
    </div>
    
    <div>
		<table  style="width: 100%; height: 13em; margin: 0px auto; border-spacing: 0px; border-collapse: collapse; border-top: 2px solid #005dab;">
		  <tr align="center" height="100em" style="border-bottom: 1px solid #cccccc;"> 
		      <td rowspan="2" width="30%"><img src="<%=cp%>/resource/images/card.jpg" class="cardImage"></td>
		      <td colspan="2" width="70%" height="20%" align="left" style="padding-left: 1em; padding-right: 1em;">
		           	<h4 style="font-weight: bold;">Disney 카드</h4>
		      </td>
		  </tr>
		  <tr style="border-bottom: 1px solid #cccccc;">
		  	  <td width="55%" height="80%" align="left" style="white-space:pre-line; padding-left: 1em; padding-right: 1em;"><span style="font-weight: bold;">카드사</span>
					- SC 제일은행 (Standard Chartered)
				<span style="font-weight: bold;">이용혜택</span>
					- 자유이용권 50%(본인에 한함. 전 놀이공원 1일, 1회)
		      </td>
		      
		      <td width="15%">
		      	 <button type="button" class="btn btn-default btn-info" onclick="cardDetail()">상세정보</button>
		      	 <button type="button" class="btn btn-default btn-info" onclick="javascript:location.href='<%=cp%>/card/update';">수정하기</button>
		      	 
		      	 <div style="display: none;" id="cardModal" role="dialog" class="modal" tabindex="-1">
		      	 <div class="modal-dialog">
		      	 <div class="modal-content">
		      	 	<div class="modal-header">
 						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
  						<span aria-hidden="true">×</span></button>
 						<h4 class="modal-title" id="myModalLabel" style="font-weight: bold;"><img src="<%=cp%>/resource/images/sc_logo.PNG" width="20px" height="25px"> SC 제일은행 (Standard Chartered)</h4>
					</div>
					<div class="modal-body">
						<div>
							<div align="left" style="position: relative; float: left; width: 50%; margin-bottom: 10px;">
								<div><img width="50%" src="<%=cp%>/resource/images/card.jpg" class="cardImage_dialog"></div>						
							</div>
							<div align="left" style="position: relative; float: left; width: 50%">
								<span style="font-weight: bold;">Disney 카드<br></span>
								<span style="font-weight: bold;">이용혜택<br></span>
								<span>- 자유이용권 50%</span>
								<span>	(본인에 한함. 전 놀이공원 1일, 1회)</span>
							</div>
						</div>
						
						
						<div class="boxIn" align="left" style="clear: both; padding: 10px;">- 서비스 이용 직전월 해당카드 이용금액(1일~말일) 30만원 이상 이용 실적이 있는 회원
							- 신규 발급회원인 경우 사용등록월을 포함하여 2개월간 할인이 적용됩니다. 
							- 1일 1회 연간 각 놀이공원 3회 이용가능
							- 타 놀이공원 당일 중복할인 불가
 						</div>
					
					
					</div>
					</div>
					</div>
				</div>
		      </td>
		  </tr>
		  <tr>
		  	<td colspan="3" align="right" width="100" style="padding: 10px;">
		         <button type="button" class="btn btn-default btn-info" onclick="javascript:location.href='<%=cp%>/card/created';">등록하기</button>
		     </td>
		  </tr>
		</table>
		
		
		 
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
		        1 2 3
			</td>
		   </tr>
		</table>
    </div>

</div>