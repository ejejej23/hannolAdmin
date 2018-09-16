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

    	/* var str = f.name.value;
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
 */
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
			<label for="nameFacility" class="col-sm-2 control-label">시설명</label> 
			<div class="col-sm-10"> 
				<input style="width: 50%;" name="name" type="text" class="form-control" id="facilityName" placeholder="시설명"  value="${dto.name}"> 
			</div> 
		</div> 
		<div class="form-group"> 
			<label for="facilityState" class="col-sm-2 control-label">시설상태</label> 
			<div class="col-sm-10">
				<select class="selectField" id="facilityState">
					<option value="">::상태선택::</option>
					<option value="${dto.state}=0">양호</option>
					<option value="${dto.state}=1">주의요함</option>
					<option value="${dto.state}=2">수리중</option>
					<option value="${dto.state}=3">수리완료</option>
				</select>
			</div> 
		</div>
		<div class="form-group"> 
			<label for="ridingHours" class="col-sm-2 control-label">설치일자</label> 
			<div class="col-sm-10"> 
				<input style="width: 50%;" name="name" type="text" class="form-control" id="installDate" placeholder="설치일자"  value="${dto.installDate}"> 
			</div> 
		</div>
		<div class="form-group"> 
			<label for="ridingNum" class="col-sm-2 control-label">제거일자</label> 
			<div class="col-sm-10"> 
				<input style="width: 50%;" name="name" type="text" class="form-control" id="removeDate" placeholder="탑승인원"  value="${dto.removeDate}"> 
			</div> 
		</div>
		<div class="form-group"> 
			<label for="position" class="col-sm-2 control-label">시설사진</label> 
			<div class="col-sm-10"> 
            	<input style="width: 50%;" type="file" multiple="multiple" name="upload1" class="boxTF" size="53" style="width: 95%;">
			</div> 
		</div>
		<div class="form-group"> 
			<label for="position" class="col-sm-2 control-label">시설위치사진</label> 
			<div class="col-sm-10"> 
            	<input style="width: 50%;" type="file" multiple="multiple" name="upload2" class="boxTF" size="53" style="width: 95%;">
			</div> 
		</div>

		<div class="form-group"> 
			<label for="locationEx" class="col-sm-2 control-label">상세설명</label> 
			<div class="col-sm-10"> 
				<input style="width: 50%;" name="name" type="text" class="form-control" id="memo" placeholder="위치설명"  value="${dto.memo}"> 
			</div> 
		</div>
		
	 	<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		     <tr height="45"> 
		      <td align="center" >
		        <button type="button" class="btn" onclick="sendOk();">${mode=='update'?'수정완료':'등록하기'}</button>
		        <button type="reset" class="btn"  onclick="javascript:location.href='<%=cp%>/facility/created';">다시입력</button>
		         <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/facility/list';">${mode=='update'?'수정취소':'등록취소'}</button>
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