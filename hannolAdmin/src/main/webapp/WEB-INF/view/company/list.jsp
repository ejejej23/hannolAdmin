<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
	/**table**/
	.table{font-size:13px;}
	.table th,
	.table td{text-align:center;}
	.table th:nth-child(2),
	.table td:nth-child(2),
	.table th:nth-child(3),
	.table td:nth-child(3){text-align:left;}
	
	
	/**modal**/
	.modalTable{width:100%; margin-top:20px; color:#444444;}
	.modalTable th,
	.modalTable td{padding:10px 0;} 
	.modalTable th{width:110px; padding-top:13px; padding-right:20px; text-align:right; vertical-align:top;}
	
	.boxTF,
	.boxTA{width:280px;}
	.selectField{padding:3px 5px 5px; vertical-align:middle;}
	.boxTF.btfName{width:120px;}
	.btfTel{width:70px; text-align:center;}
	
	
	.btnBox{margin:30px 0; text-align:center;}
	
	/**dialog new style**/
	.ui-widget{font-family:"Nanum Gothic";}
	.ui-widget input, 
	.ui-widget select, 
	.ui-widget textarea, 
	.ui-widget button{font-family:"Nanum Gothic"; font-size:13px;}
	.ui-widget-header{color:#ffffff; background:#4c4c4c;}
	.ui-dialog .ui-dialog-title{font-size:16px;}
	.ui-dialog .ui-dialog-titlebar{padding:11px 1em;}
	.ui-dialog{padding:0;}
	.ui-draggable .ui-dialog-titlebar{border-bottom-left-radius:0; border-bottom-right-radius:0;}
	
	
</style>

<div class="sub-container">
	<div class="sub-title">
		<h3>업체 정보</h3>
	</div>

	<div class="sub_contents">
		<table class="table">
			<colgroup>
				<col style="width:6%;">
				<col style="width:18%;">
				<col style="">
				<col style="width:15%;">
				<col style="width:15%;">
			</colgroup>

			<thead class="thead-light">
				<tr>
					<th scope="col">번호</th>
					<th scope="col">업체명</th>
					<th scope="col">상세설명</th>
					<th scope="col">연락처</th>
					<th scope="col">거래시작일자</th>
				</tr>
				
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>미츠바시 엘리베이터</td>
					<td><a href="#">엘리베이터 정비 업체</a></td>
					<td>010-5555-5555</td>
					<td>2010-10-10</td>
				</tr>
			</tbody>
		</table>


		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			<%-- <tr height="35">
				<td align="center"><c:if test="${dataCount==0 }">등록된 게시물이 없습니다.</c:if>
					<c:if test="${dataCount!=0 }">${paging}</c:if></td>
			</tr> --%>
		</table>

		<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
			<tr height="40">
				<td align="left" width="100">
					<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/company/list';">새로고침</button>
				</td>
				<td align="center">
					<form name="searchForm" method="post">
						<div class="col-xs-8 col-xs-offset-2">
							<div class="input-group">
								<input type="hidden" name="searchKey" value="all"> 
								<input type="text" class="form-control" name="searchValue" placeholder="검색할 키워드를 입력해 주세요..."> 
								<span class="input-group-btn">
									<button class="btn btn-default btn-info" type="button" onclick="searchList()">
										<span class="glyphicon glyphicon-search"></span>
									</button>
								</span>
							</div>
						</div>
					</form>
				</td>
				<td align="right" width="100">
					<button type="button" class="btn">업체추가</button>
				</td>
			</tr>
		</table>
	</div>
</div>

<div id="companyModel" class="modal">
	<form>
		<table class="modalTable">
			<tr>
				<th scope="row">업체명</th>
				<td><input type="text" name="name" class="boxTF"></td>
			</tr>
			<tr>
				<th scope="row">상세설명</th>
				<td><textarea class="boxTA"></textarea></td>
			</tr>
			<tr>
				<th scope="row">연락처</th>
				<td>
					<select class="selectField btfTel" name="tel1">
						<option value="">선택</option>
						<option value="010">010</option>
						<option value="010">011</option>
						<option value="010">016</option>
						<option value="010">017</option>
						<option value="010">018</option>
						<option value="010">019</option>
					</select> - <input type="text" name="tel2" class="boxTF btfTel" maxlength="4"> - <input type="text" name="tel3" class="boxTF btfTel" maxlength="4">
				</td>
			</tr>
		</table>
		
		<div class="btnBox">
	        <button type="button" class="btn" id="btnScheduleSendOk">업체등록</button>
	        <button type="reset" class="btn">다시입력</button>
	        <button type="button" class="btn" id="btnScheduleSendCancel">등록취소</button>
	    </div>
	</form>
</div>

<script>
	/*다이얼 로그*/
	$(function(){
		$("#companyModel").dialog({
			title:"업체추가",
			width:480,
			height:480, 
			modal:true,
			show:"clip",
			hide:"clip"
		});
	});
	
	$(function(){
		
	});
	
</script>