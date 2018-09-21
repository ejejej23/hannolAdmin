<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>

<script type="text/javascript">
    function sendOk() {
        var f = document.ridesForm;

        var boardingTime = f.boardingTime.value;
	    if(!boardingTime){
	    	alert("탑승시간을 입력하세요. ");
	    	f.boardingTime.focus();
	    	return false;
	    }
	    
	    var passengers =  f.passengers.value;
	    if(!passengers){
	    	alert("탑승인원을 입력하세요. ");
	    	f.passengers.focus();
	    	return false;
	    }
	    
	    var minHeight =  f.minHeight.value;
	    if(!minHeight){
	    	alert("최소키를 입력하세요. ");
	    	f.minHeight.focus();
	    	return false;
	    }
	    
	    var maxHeight =  f.maxHeight.value;
	    if(!maxHeight){
	    	alert("최대키를 입력하세요. ");
	    	f.maxHeight.focus();
	    	return false;
	    }
	    
	    var congestion =  f.congestion.value;
	    if(!congestion){
	    	alert("혼잡도를 입력하세요. ");
	    	f.congestion.focus();
	    	return false;
	    }
	    
	    var genreCode =  f.genreCode.value;
	    if(!genreCode){
	    	alert("장르 구분을 입력하세요. ");
	    	f.genreCode.focus();
	    	return false;
	    }
	    
	    var gubunCode =  f.gubunCode.value;
	    if(!gubunCode){
	    	alert("놀이기구 구분을 입력하세요. ");
	    	f.gubunCode.focus();
	    	return false;
	    }
        
    	f.action="<%=cp%>/rides/${mode}?page=${page}";

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
	
	<form class="form-horizontal" role="form" name="ridesForm" method="post" > 
		<br>
		
		<div class="form-group"> 
			<label for="ridingHours" class="col-sm-2 control-label">어트랙션명</label> 
			<div class="col-sm-10"> 
				<input style="width: 50%;" name="name" type="text" class="form-control" id="ridingHours" placeholder="어트랙션명"  value="${dto.name}" readonly="readonly"> 
			</div> 
		</div>
		
		<div class="form-group"> 
			<label for="ridingHours" class="col-sm-2 control-label">탑승시간</label> 
			<div class="col-sm-10"> 
				<input style="width: 50%;" name="boardingTime" type="text" class="form-control" id="ridingHours" placeholder="탑승시간"  value="${dto.boardingTime}"> 
			</div> 
		</div>
		<div class="form-group"> 
			<label for="ridingNum" class="col-sm-2 control-label">탑승인원</label> 
			<div class="col-sm-10"> 
				<input style="width: 50%;" name="passengers" type="text" class="form-control" id="ridingNum" placeholder="탑승인원"  value="${dto.passengers}"> 
			</div> 
		</div>
		<div class="form-group"> 
			<label for="heightLimit" class="col-sm-2 control-label">키 제한</label> 
			<div class="col-sm-10"> 
				<input style="float:left; width: 20%;" name="minHeight" type="text" class="form-control" id="minHeight" placeholder="최소 키(cm)"  value="${dto.minHeight}"> 
				<p style="float:left;">&nbsp;~&nbsp;</p>
				<input style="float:left; width: 20%;" name="maxHeight" type="text" class="form-control" id="maxHeight" placeholder="최대 키(cm)"  value="${dto.maxHeight}"> 
			</div> 
			
		</div>
		<div class="form-group"> 
			<label for="limit" class="col-sm-2 control-label">제한조건</label> 
			<div class="col-sm-10"> 
				<input style="width: 50%;" name="limit" type="text" class="form-control" id="limit" placeholder="제한"  value="${dto.limit}"> 
			</div> 
		</div>
		<div class="form-group"> 
			<label for="congestion" class="col-sm-2 control-label">혼잡도</label> 
			<div class="col-sm-10"> 
				<input style="width: 50%;" name="congestion" type="text" class="form-control" id="limit" placeholder="혼잡도"  value="${dto.congestion}"> 
			</div> 
		</div>

		<div class="form-group"> 
		<label for="genre" class="col-sm-2 control-label">장르</label> 
		<div class="col-sm-10"> 
			<select class="selectField" id="genre" name="genreCode" >
				<option value="">장르</option>
				<option value="1" ${dto.genreName=="공포" ? "selected='selected'" : ""}>공포</option>
				<option value="2" ${dto.genreName=="판타지" ? "selected='selected'" : ""}>판타지</option>
				<option value="3" ${dto.genreName=="키즈" ? "selected='selected'" : ""}>키즈</option>
				<option value="4" ${dto.genreName=="익스트림" ? "selected='selected'" : ""}>익스트림</option>
				<option value="5" ${dto.genreName=="아쿠아" ? "selected='selected'" : ""}>아쿠아</option>
				<option value="6" ${dto.genreName=="연인" ? "selected='selected'" : ""}>연인</option>
				<option value="7" ${dto.genreName=="기타" ? "selected='selected'" : ""}>기타</option>
			</select>
		</div> 
		</div>
		
		<div class="form-group"> 
			<label for="state" class="col-sm-2 control-label">상태</label> 
			<div class="col-sm-10"> 
				<select class="selectField" id="gubunCode" name="gubunCode" >
					<option value="">상태</option>
					<option value="1" ${dto.gubunName=="고장" ? "selected='selected'" : ""}>고장</option>
					<option value="2" ${dto.gubunName=="수리중" ? "selected='selected'" : ""}>수리중</option>
					<option value="3" ${dto.gubunName=="close" ? "selected='selected'" : ""}>close</option>
					<option value="4" ${dto.gubunName=="open" ? "selected='selected'" : ""}>open</option>
					<option value="5" ${dto.gubunName=="우천" ? "selected='selected'" : ""}>우천</option>
				</select>
			</div> 
		</div>

	 	<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		     <tr height="45"> 
		      <td align="center" >
		        <button type="button" class="btn" onclick="sendOk();">${mode=='updateChg'?'수정완료':'등록하기'}</button>
		        <button type="reset" class="btn"  onclick="javascript:location.href='<%=cp%>/rides/created';">다시입력</button>
		         <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/rides/list';">${mode=='updateChg'?'수정취소':'등록취소'}</button>
		         <c:if test="${mode=='updateChg'}">
		         	 <input type="hidden" name="facilityCode" value="${dto.facilityCode}">
		        </c:if>
		      </td>
		    </tr>
		</table>
	</form>
</div>	
</div>   