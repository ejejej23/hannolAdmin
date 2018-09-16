<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
	/**table**/
	.table{table-layout:fixed;}
	.table th,
	.table td{text-align:center;}
	.table td{text-overflow:ellipsis; overflow:hidden; white-space:nowrap;}
	.table td:nth-child(4){text-align:left;}
	
	.listData_no{text-align:center;}
	
	.noLine{border:0 none;}
	
	/**modal**/
	.modalTable{width:100%; margin-top:20px; color:#444444;}
	.modalTable th,
	.modalTable td{padding:10px 0;} 
	.modalTable th{width:110px; padding-top:13px; padding-right:20px; text-align:right; vertical-align:top;}
	
	.boxTF,
	.boxTA,
	.modalTable .selectField{width:280px; vertical-align:middle;}
	.boxTF[readonly]{background-color:#ffffff;}
	.boxTA[disabled]{background-color:#f3f3f3; padding:10px 15px;}
	.selectField{padding:5px; vertical-align:middle;}
	.boxTF.btfName{width:120px;}
	.btfTel{width:60px; text-align:center;}
	
	
	.btnBox{margin:40px 0; text-align:center;}
	.btnBox .btn{margin:0 3px;}
	
	.modalTable input[type=radio],
	.modalTable label{margin:0 3px 0 0; vertical-align:middle; font-weight:500;}
	.modalTable #badState{margin-left:8px;}
	
	.warning{color:#e52806;}
	
	
	
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
<script type="text/javascript">
	var elementsName = [];
	var elementsNameText = [];
	
	$(function(){
		var elements = $("form[name=formData] input, form[name=formData] textarea, form[name=formData] select");
		
		for(var i=0; i<elements.length; i++){
			elementsName[i] = elements[i];
			elementsNameText[i] = elements[i].getAttribute("data-name");
		}
	});
	
	
	/*다이얼 로그*/
	$(function() {
		//점검 추가
		$("#createdBtn").click(function() {
			$("#modal").dialog({
				title : "점검추가",
				width : 480,
				height : 570, 
				modal : true
			});
		});
	
		$("body").on("click", "#modalCloseBtn", function() {
			$("#modal").dialog("close");
		});
			
		//시설 분류 선택할 때 마다 시설리스트 가져오기
		$("select[name=facGubun]").change(function(){
			var gubunCode = $(this).children("option:selected").val(); 
			
			var url = "<%=cp%>/inspection/facility";
			var query = "gubunCode="+gubunCode;
			
			$.ajax({
				type:"get",
				url:url,
				data:query,
				dataType:"json",
				success:function(data){
					$("select[name=facilityCode]").empty();
					
					if(data.facList.length==0){
						$("select[name=facilityCode]").append("<option value=''>없음</option>");	
					}else{						
						for(var i=0; i<data.facList.length ; i++){
							$("select[name=facilityCode]").append("<option value='"+data.facList[i].FACILITYCODE+"'>"+data.facList[i].NAME+"</option>");	
						}
					}				
				},
				error:function(e){
					console.log(e.responseText);
				}				
			});
			
		});
	});	
	
	//datepicker
	$(function(){
		$(".datepicker").datepicker({
			dateFormat:'yy-mm-dd',
			showOn:"both",
	        buttonImage:"<%=cp%>/resource/images/date24.png",
	        buttonImageOnly:true,
	        showAnim:"slideDown",
	        buttonText:"선택",
	        maxDate:0
		});
		
		$(".datepicker").next("img").css({
				"margin":"-1px 0px 0px -31px", 
				"width":"23px", 
				"cursor":"pointer", 
				"border-left":"1px solid #dddddd", 
				"padding-left":"8px"});  	
	});
	
	
	
	//점검 등록
	$(function(){
		$("#createdOk").click(function(){
			var url = "<%=cp%>/inspection/created";
			var query = $("form[name=formData]").serialize();
			console.log(query);
			
			$.ajax({
				type:"post",
				url:url,
				data:query,
				dataType:"json",
				beforeSend:check,
				success:function(data){
					if(data.state=="true"){
						alert("점검 등록이 되었습니다.");
						formClean();
						location.href="<%=cp%>/inspection/list";
					}else{
						alert("점검 등록을 실패하셨습니다.");
					}
				},
				error:function(e){
					console.log(e.responseText);
				}
			});
		});
	});
	
	//글 정보 보기
	$(function(){
		$(".articleVeiw").click(function(){
			//다이얼로그
			$("#modal").dialog({
				title : "점검정보",
				width : 480,
				height : 570, 
				modal : true
			});
			
			var num = $(this).attr("data-artilenum"); //점검 코드
			
			var url = "<%=cp%>/inspection/article";
			var query = "num="+num;
			
			$.ajax({
				type:"get",
				url:url,
				data:query,
				dataType:"json",
				success:function(data){
					if(data.state=="true"){						
						$("#modal input[name=checkDate ]").val(data.dto.checkDate);
						$("#modal textarea[name=memo]").val(data.dto.memo);
					}else{
						alert("점검 정보를 불러오지 못했습니다.");
					}
				},
				error:function(e){
					console.log(e.responseText);
				}
			});
		});
	});
	
	
	//검색
	function searchList(){
		var f = document.searchForm;
		f.action = "<%=cp%>/inspection/list"; 
		f.submit();
	}
	
	//빈칸 확인
	function check(){
		for(var i=0 ; i<elementsName.length ; i++){
			if(!elementsName[i].value){
				elementsName[i].focus();
				alert(elementsNameText[i]+" 입력해주세요.");
				return false;
			}
		}
	}
	
	//폼 데이터 지움
	function formClean(){
		for(var i=0 ; i<elementsName.length ; i++){
			elementsName[i].value="";
		}
		
		$("#modal").dialog("close");
	}
	

</script>

<div class="sub-container">
	<div class="sub-title">
		<h3>점검
			<small>${dataCount}개(${page}/${total_page}페이지)</small> 
		</h3>
	</div>

	<div class="sub_contents">
		<table style="width: 100%; margin: 30px auto; border-spacing: 0px;">
			<tr height="40">
				<td>
					기간 
					<span><input type="text" name="checkDate2" class="boxTF datepicker"readonly="readonly"></span> ~ <span><input type="text" name="checkDate3" class="boxTF datepicker"readonly="readonly"></span>
				</td>  
			</tr>
		</table>
	
		<table class="table">
			<colgroup>
				<col style="width:5%;">
				<col style="width:12%;">
				<col style="width:15%;">
				<col style="">
				<col style="width:8%;">
				<col style="width:15%;">
			</colgroup>

			<thead class="thead-light">
				<tr>
					<th scope="col">번호</th>
					<th scope="col">분류</th>
					<th scope="col">시설명</th>
					<th scope="col">점검내역</th>
					<th scope="col">상태</th>
					<th scope="col">점검일자</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${list}">
					<tr>
						<td>${dto.checkCode}</td>
						<td>${dto.facGubunName}</td>
						<td>${dto.facilityName}</td>
						<td class="articleVeiw" data-artileNum="${dto.checkCode}"><a href="#">${dto.memo}</a></td>
						<td>
							<c:if test="${dto.state==1}">양호</c:if>
							<c:if test="${dto.state==0}"><span class="warning">주의</span></c:if>
						</td>
						<td>${dto.checkDate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
			<tr>
				<td class="listData_no">
					<c:if test="${dataCount==0}">
						등록된 게시물이 없습니다.
					</c:if>
					<c:if test="${dataCount!=0}">
						${paging}
					</c:if>
				</td>
			</tr>
		</table> 
		
		<table style="width: 100%; margin: 30px auto; border-spacing: 0px;">
			<tr height="40">
				<td align="left" width="100">
					<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/inspection/list';">새로고침</button>
				</td>
				<td align="center">
					<form name="searchForm" method="post">
						<select name="searchKey" class="selectField">
							<option value="kind">분류</option>
							<option value="name">시설명</option> 
							<option value="content">점검내역</option>
						</select> 
						<input type="text" name="searchValue" class="boxTF">
						<button type="button" class="btn btn-default" onclick="searchList()">검색</button>
					</form>
				</td>
				<td align="right" width="100">
					<button type="button" id="createdBtn" class="btn btn-info">점검추가</button>
				</td>
			</tr>
		</table>
	</div>
</div>



<!-- 모달 -->
<div id="modal" class="modal">
	<form name="formData" method="post">
		<table class="modalTable">
			<tr>
				<th scope="row">분류</th>
				<td>
					<select name="facGubun" class="selectField" data-name="분류를">
						<c:forEach var="list" items="${facGubunlist}">
							<option value="${list.GUBUNCODE}">${list.NAME}</option>
						</c:forEach>
					</select> 
				</td>
			</tr>
			<tr>
				<th scope="row">시설명</th>
				<td>
					<select name="facilityCode" class="selectField" data-name="시설명을">
						<c:forEach var="list" items="${facList}">
							<option value="${list.FACILITYCODE}">${list.NAME}</option>
						</c:forEach>
					</select> 
				</td>
			</tr>
			<tr>
				<th scope="row">점검일자</th>
				<td><input type="text" name="checkDate" class="boxTF datepicker" data-name="점검일자를" readonly="readonly"></td>  
			</tr> 
			<tr>
				<th scope="row">상태</th>
				<td>
					<input type="radio" name="state" id="goodState" value="1" checked="checked"><label for="goodState">양호 </label>
					<input type="radio" name="state" id="badState" value="0"><label for="badState">주의요함</label>   
				</td>
			</tr>
			<tr> 
				<th scope="row">점검내역</th>
				<td><textarea name="memo" class="boxTA"  data-name="점검내역을"></textarea></td>
			</tr>
		</table>
		
		<div class="btnBox">
	        <button type="button" class="btn btn-info" id="createdOk">점검등록</button>
	        <button type="reset" class="btn btn-default">다시입력</button> 
	        <button type="button" class="btn btn-default" id="modalCloseBtn">등록취소</button>
	    </div>
	</form>
</div>
