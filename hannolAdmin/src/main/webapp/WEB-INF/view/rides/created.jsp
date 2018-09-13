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

    	var str = f.name.value;
        if(!str) {
            alert("제목을 입력하세요. ");
            f.subject.focus();
            return;
        }

    	str = f.content.value;
        if(!str) {
            alert("내용을 입력하세요. ");
            f.content.focus();
            return;
        }

    	f.action="<%=cp%>/rides/${mode}";

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
	
	<form class="form-horizontal" role="form" name="ridesForm" method="post" enctype="multipart/form-data"> 

		<div class="form-group">
			<label for="state" class="col-sm-2 control-label">테마</label> 
			<div class="col-sm-10"> 
				<select class="selectField" id="theme">
					<option value="">::테마선택::</option>
					<option value="toy">토이스토리</option>
					<option value="mini">미니언즈</option>
					<option value="princess">프린세스빌리지</option>
					<option value="lion">라이온킹</option>
					<option value="nimo">니모</option>
				</select>
			</div>
		</div>

		<div class="form-group"> 
			<label for="nameRides" class="col-sm-2 control-label">이름</label> 
			<div class="col-sm-10"> 
				<input style="width: 50%;" name="name" type="text" class="form-control" id="nameRides" placeholder="이름"  value="${dto.name}"> 
			</div> 
		</div> 
		<div class="form-group"> 
			<label for="operatingHours" class="col-sm-2 control-label">운영시간</label> 
			<div class="col-sm-10"> 
				<input style="width: 50%;" name="name" type="text" class="form-control" id="operatingHours" placeholder="운영시간"  value="${dto.name}"> 
			</div> 
		</div>
		<div class="form-group"> 
			<label for="ridingHours" class="col-sm-2 control-label">탑승시간</label> 
			<div class="col-sm-10"> 
				<input style="width: 50%;" name="name" type="text" class="form-control" id="ridingHours" placeholder="탑승시간"  value="${dto.boardingTime}"> 
			</div> 
		</div>
		<div class="form-group"> 
			<label for="ridingNum" class="col-sm-2 control-label">탑승인원</label> 
			<div class="col-sm-10"> 
				<input style="width: 50%;" name="name" type="text" class="form-control" id="ridingNum" placeholder="탑승인원"  value="${dto.passengers}"> 
			</div> 
		</div>
		<div class="form-group"> 
			<label for="heightLimit" class="col-sm-2 control-label">키 제한</label> 
			<div class="col-sm-10"> 
				<input style="float:left; width: 20%;" name="name" type="text" class="form-control" id="minHeight" placeholder="최소 키(cm)"  value="${dto.minHeight}"> 
				<p style="float:left;">&nbsp;~&nbsp;</p>
				<input style="float:left; width: 20%;" name="name" type="text" class="form-control" id="maxHeight" placeholder="최대 키(cm)"  value="${dto.maxHeight}"> 
			</div> 
			
		</div>
		<div class="form-group"> 
			<label for="limit" class="col-sm-2 control-label">제한</label> 
			<div class="col-sm-10"> 
				<input style="width: 50%;" name="name" type="text" class="form-control" id="limit" placeholder="제한"  value="${dto.limit}"> 
			</div> 
		</div>
		<div class="form-group"> 
			<label for="position" class="col-sm-2 control-label">위치</label> 
			<div class="col-sm-10"> 
				<input style="width: 50%;" name="name" type="text" class="form-control" id="position" placeholder="위치"  value="${dto.limit}"> 
			</div> 
		</div>

		<div class="form-group"> 
			<label for="locationEx" class="col-sm-2 control-label">위치설명</label> 
			<div class="col-sm-10"> 
				<input style="width: 50%;" name="name" type="text" class="form-control" id="locationEx" placeholder="위치설명"  value="${dto.limit}"> 
			</div> 
		</div>
		
			<div class="form-group">
	            <label for="file" class="col-sm-2 control-label">파일첨부</label>
	            <div class="col-sm-10">
		            <input style="width: 50%;" class="form-control" type="file" id="file" name="file" />
		            <p class="help-block">크기가 10Mbye 이하의 파일 선택</p>
		        </div>
	        </div>

		
		<span class='label label-info' id="upload-file-info"></span>
		
		<div class="form-group"> 
			<label for="state" class="col-sm-2 control-label">상태</label> 
			<div class="col-sm-10"> 
				<select class="selectField" id="state" name="state" >
					<option value="">상태</option>
					<option value="운행중" ${dto.tel1=="운행중" ? "selected='selected'" : ""}>운행중</option>
					<option value="운행종료" ${dto.tel1=="운행종료" ? "selected='selected'" : ""}>운행종료</option>
					<option value="수리중" ${dto.tel1=="수리중" ? "selected='selected'" : ""}>수리중</option>
					<option value="고장" ${dto.tel1=="고장" ? "selected='selected'" : ""}>고장</option>
					<option value="우천대기" ${dto.tel1=="우천대기" ? "selected='selected'" : ""}>우천대기</option>
				</select>
			</div> 
		</div>
		
		<div class="form-group"> 
			<label for="explain" class="col-sm-2 control-label">설명</label> 
			<div class="col-sm-10"> 
				<input style="width: 50%;" name="name" type="text" class="form-control" id="explain" placeholder="설명" value="${sessionScope.staff.staffName}"> 
			</div>  
		</div>
	
		<div class="form-group"> 
		<label for="genre" class="col-sm-2 control-label">장르</label> 
		<div class="col-sm-10"> 
			<select class="selectField" id="genre" name="genre" >
				<option value="">장르</option>
				<option value="공포" ${dto.tel1=="공포" ? "selected='selected'" : ""}>공포</option>
				<option value="판타지" ${dto.tel1=="판타지" ? "selected='selected'" : ""}>판타지</option>
				<option value="키즈" ${dto.tel1=="키즈" ? "selected='selected'" : ""}>키즈</option>
				<option value="익스트림" ${dto.tel1=="익스트림" ? "selected='selected'" : ""}>익스트림</option>
				<option value="아쿠아" ${dto.tel1=="아쿠아" ? "selected='selected'" : ""}>아쿠아</option>
			</select>
		</div> 
		</div>

	 	<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		     <tr height="45"> 
		      <td align="center" >
		        <button type="button" class="btn" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
		        <button type="reset" class="btn">다시입력</button>
		         <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/rides/list';">${mode=='update'?'수정취소':'등록취소'}</button>
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