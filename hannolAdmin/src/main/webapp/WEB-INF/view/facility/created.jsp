<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">
    function sendOk() {
        var f = document.facilityForm;

    	f.action="<%=cp%>/facility/${mode}";

        f.submit();
    }

</script>

<style type="text/css">
	.bg{
		background: url('<%=cp%>/resource/images/bg2.png') 0 fixed;
		background-size: 960px 1517px;
		background-repeat: no-repeat;
		background-position: center;
	}
	.body-container{
	
	}
	.total{
		width:100%;
		margin-left: 10%;
	}
</style>

<div class="bg" style="width:100%;">

<div class="total">
	
	<form class="form-horizontal" role="form" name="facilityForm" method="post" enctype="multipart/form-data"> 
		<br>
		
		<div class="form-group"> 
			<label for="facilityState" class="col-sm-2 control-label">테마구분</label> 
	
			<div class="col-sm-10">
				<select name="themeCode" class="selectField" id="theme">
					<option value="">::테마선택::</option>
					<option value=1>프린세스빌리지</option>
					<option value=2>토이스토리</option>
					<option value=3>미니언즈</option>
					<option value=4>전체</option>
					<option value=5>라이온킹</option>
					<option value=6>니모</option>
				</select> 
			</div> 
		</div>
		
		<div class="form-group"> 
			<label for="facGubun" class="col-sm-2 control-label">시설구분</label> 
	
			<div class="col-sm-10">
				<select name="gubunCode" class="selectField" id="facGubun">
					<option value="">::시설구분::</option>
					<option value=1>놀이기구</option>
					<option value=2>편의시설</option>
					<option value=3>공연전시</option>
					<option value=4>음식점</option>
					<option value=5>기프트샵</option>
					<option value=6>유모차대여소</option>
					<option value=7>화장실</option>
					<option value=8>물품보관함</option>
				</select> 
			</div> 
		</div>
		
		
		<div class="form-group"> 
			<label for="nameFacility" class="col-sm-2 control-label">시설명</label>
			 
			<div class="col-sm-10"> 
				<input style="width: 50%;" name="name" type="text" class="form-control" id="facilityName" placeholder="시설명"  value="${dto.name}"> 
			</div> 
	
		</div> 
		
		<div class="form-group"> 
			<label for="facilityState" class="col-sm-2 control-label">시설상태</label> 

			<div class="col-sm-10">
				<select name="state" class="selectField" id="facilityState">
					<option value="">::상태선택::</option>
					<option value=0>양호</option>
					<option value=1>주의요함</option>
					<option value=2>수리중</option>
					<option value=3>수리완료</option>
				</select> 
				
		<%-- 		<select name="searchKey" class="selectField">
					<option value="userName" ${searchKey=="userName" ? "selected" : ""}>회원명</option>
					<option value="reservationDate"	${searchKey=="reservationDate" ? "selected" : ""}>예약일</option>
				</select> --%>
			</div> 

		</div>

		<div class="form-group"> 
			<label for="installDate" class="col-sm-2 control-label">설치일자</label> 

			<div class="col-sm-10"> 
				<input style="width: 50%;" name="installDate" type="text" class="form-control" id="installDate" placeholder="설치일자"  value="${dto.installDate}"> 
			</div> 

		</div>

		<div class="form-group"> 
			<label for="removeDate" class="col-sm-2 control-label">제거일자</label> 

			<div class="col-sm-10"> 
				<input style="width: 50%;" name="removeDate" type="text" class="form-control" id="removeDate" placeholder="제거일자"  value="${dto.removeDate}"> 
			</div> 

		</div>

		<div class="form-group"> 
			<label for="saveMainFilename" class="col-sm-2 control-label">시설사진</label> 

			<div class="col-sm-10"> 
            	<input style="width: 50%;" type="file" name="upload1" class="form-control" size="53" style="width: 95%;">
			</div> 

		</div>

		<div class="form-group"> 
			<label for="saveLocFilename" class="col-sm-2 control-label">시설위치사진</label> 

			<div class="col-sm-10"> 
            	<input style="width: 50%;" type="file" name="upload2" class="form-control" size="53" style="width: 95%;">
			</div> 

		</div>

		<div class="form-group"> 
			<label for="memo" class="col-sm-2 control-label">상세설명</label> 

			<div class="col-sm-10"> 
				<input style="width: 50%;" name="memo" type="text" class="form-control" placeholder="상세설명"  value="${dto.memo}"> 
			</div> 

		</div>

		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			<tr height="45">
				<td align="center">
					<button type="button" class="btn" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
					<button type="reset" class="btn"
						onclick="javascript:location.href='<%=cp%>/facility/created';">다시입력</button>
					<button type="button" class="btn"
						onclick="javascript:location.href='<%=cp%>/facility/list';">${mode=='update'?'수정취소':'등록취소'}</button>
					<c:if test="${mode=='update'}">
						<input type="hidden" name="num" value="${dto.num}">
						<input type="hidden" name="page" value="${page}">
					</c:if>
				</td>
			</tr>
		</table>

		</form>
	
	</div>	
</div>   