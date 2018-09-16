<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style>
/**table**/
	.table th,
	.table td{text-align:center;}
	.table th:nth-child(2),
	.table td:nth-child(2),
	.table th:nth-child(3),
	.table td:nth-child(3),
	.table td:nth-child(4){text-align:left;}
	
	.listData_no{text-align:center;}
	
	.noLine{border:0 none;}
	.btfTel.noLine{width:36px; padding-left:0; padding-right:0;}
	
	/**modal**/
	.modalTable{width:100%; margin-top:20px; color:#444444;}
	.modalTable th,
	.modalTable td{padding:10px 0;} 
	.modalTable th{width:110px; padding-top:13px; padding-right:20px; text-align:right; vertical-align:top;}
	
	.boxTF,
	.boxTA{width:280px; vertical-align:middle;}
	.boxTA[disabled]{background-color:#ececec; padding:10px 15px;}
	.selectField{padding:5px; vertical-align:middle;}
	.boxTF.btfName{width:120px;}
	.btfTel{width:60px; text-align:center;}
	
	
	.btnBox{margin:40px 0; text-align:center;}
	.btnBox .btn{margin:0 3px;}
	
	
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
/*버튼모음*/
var sendOk = '<button type="button" class="btn btn-info" id="sendOk">업체등록</button>';
var updateBtn = '<button type="button" class="btn btn-info" id="updateBtn">업체수정</button>';
var updateOk = '<button type="button" class="btn btn-info" id="updateOk">수정완료</button>';
var deleteBtn = '<button type="button" class="btn btn-default" id="deleteBtn">업체삭제</button>';
var resetBtn = '<button type="reset" class="btn btn-default">다시입력</button>';
var closeBtn = '<button type="button" class="btn btn-default" id="facilityAdd_close_btn">취소</button>';

	var elementsName = [];
	var elementsNameText = [];
	
	$(function(){
		var elements = $("form[name=facilityForm] input, form[name=facilityForm] textarea, form[name=facilityForm] select");
			elementsName = [];
			elementsNameText = [];
		
		for(var i=0; i<elements.length; i++){
			elementsName[i] = elements[i];
			elementsNameText[i] = elements[i].getAttribute("data-name");
		}
	});

	//폼 데이터 지움
	function formClean(){
		for(var i=0 ; i<elementsName.length ; i++){
			elementsName[i].value="";
		}
		
		$("#failityModel").dialog("close");
	}
	
	var loadFile = function(event) {
		var output = document.getElementById('output');
		output.src = URL.createObjectURL(event.target.files[0]);
	};
	
	
	$(function(){
		$(".picture1").click(function(){
			$("#picture1Model").dialog({
				title:"시설사진",
				width:480,
				height:380,
				modal:true,
				open:function(){
					//버튼
				},
				close:function(){	
					$('this').modal('hide');
				}
			});
		});
	});
	
	$(function(){
		$(".picture2").click(function(){
			$("#picture2Model").dialog({
				title:"시설위치사진",
				width:480,
				height:380,
				modal:true,
				open:function(){
					//버튼
				},
				close:function(){	
					$('this').modal('hide');
				}
			});
		});
	});
	
	
	//글 정보 보기
	$(function(){
		$(".articleView").click(function(){
			//다이얼로그
			$("#facilityModel").dialog({
				title:"시설정보",
				width:480,
				height:570,
				modal:true,
				open:function(){
					//버튼
					$(".btnBox").empty();
					$(".btnBox").append(updateBtn, deleteBtn, closeBtn); 
				},
				close:function(){	
					formClean();
					$("#facilityModel input, #facilityModel textarea").prop("disabled", false).removeClass("noLine");
				}
			});
	

			var num = $(this).attr("data-name"); //업체 코드
			
			var url = "<%=cp%>/facility/article";
			var query = "num="+num;
			
			$.ajax({
				type:"get",
				url:url,
				data:query,
				dataType:"json",
				success:function(data){
					if(data.state=="true"){						
						$("#facilityModel input[name=facilityCode]").val(data.vo.facilityCode);
						$("#facilityModel input[name=name]").val(data.vo.name);
						$("#facilityModel input[name=themeName]").val(data.vo.themeName);
						$("#facilityModel input[name=state]").val(data.vo.state);
						$("#facilityModel input[name=installDate]").val(data.vo.installDate);
						$("#facilityModel input[name=removeDate]").val(data.vo.removeDate);
						$("#facilityModel input[name=saveMainFilename]").val(data.vo.saveMainFilename);
						$("#facilityModel input[name=saveLocFilename]").val(data.vo.saveLocFilename);
						$("#facilityModel textarea[name=memo]").val(data.vo.memo);
						
						$("#facilityModel input, #facilityModel textarea").prop("disabled", true).addClass("noLine");
						
					}else{
						alert("시설정보를 불러오지 못했습니다.");
					}
				},
				error:function(e){
					console.log(e.responseText);
				}
			});
			
		});
		$("body").on("click", "#facilityAdd_close_btn", function() {
			$("#facilityModel").dialog("close");
		});
	});
	
</script>

<div class="sub-container" style="width: 960px;">

     <div class="body-title">
     	<h3>시설 관리</h3>
       <%--  <h3><span style="font-family: Webdings">2</span> 어트랙션 정보 <span style="font-size:15px;">${dataCount}개(${page}/${total_page} 페이지)</span> </h3>--%>    
     </div>  
    
	 <div>
		<div>
		<table class="table">
		  <thead class="thead-light">
		    <tr>
		      <th scope="col">시설번호</th>
		      <th scope="col">시설명</th>
		      <th scope="col">테마명</th>
		      <th scope="col">시설상태</th>
		      <th scope="col">설치일자</th>
		      <th scope="col">제거일자</th>
		      <th scope="col">시설사진</th>
		      <th scope="col">시설위치사진</th>
		      <th scope="col">설명</th>
		    </tr>
		  </thead>
		  
		  <tbody>
			<c:forEach var="vo" items="${list}">
				<tr>
					<td>${vo.facilityCode}</td>
					<td class="articleView" data-name="${vo.facilityCode}"><a href="#">${vo.name}</a></td>
					<td>${vo.themeName}</td>
					<td>
						<c:choose>
							<c:when test="${vo.state==0}">
								양호
							</c:when>
							<c:when test="${vo.state==1}">
								주의요함
							</c:when>
							<c:when test="${vo.state==2}">
								수리중
							</c:when>
							<c:when test="${vo.state==3}">
								수리완료
							</c:when>
						</c:choose>
					</td>
					<td>${vo.installDate}</td>
					<td>${vo.removeDate}</td>
					<td>${vo.saveMainFilename}</td>
					<td>${vo.saveLocFilename}</td>
					<td>${vo.memo}</td>
				</tr>
			</c:forEach>
		  </tbody>
		</table>
		
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
			        <c:if test="${dataCount==0 }">등록된 게시물이 없습니다.</c:if>
			        <c:if test="${dataCount!=0 }">${paging}</c:if>
			 </td>
		   </tr>
		</table>

	</div>
			<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
				<tr height="40">
					<td align="left" width="100">
					    <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/facility/list';">새로고침</button>
					</td>
					
					<td align="right" width="100">
						<button id="btnSend" type="button" class="btn1">변경하기</button>
						<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/facility/created';">추가하기</button>
					</td>
				</tr>
			</table>
    </div> 
</div>   

<div id="picture1Model" class="modal">
	<form name="facilityForm" method="post">
		<table class="modalTable">
			<tr>
				<td><img alt="..." src="<%=cp%>/resource/images/card.jpg">
			</tr>		
		</table>
	</form>
</div>

<div id="picture2Model" class="modal">
	<form name="facilityForm" method="post">
		<table class="modalTable">
			<tr>
				<td><img alt="..." src="<%=cp%>/resource/images/loading_map.gif">
			</tr>		
		</table>
	</form>
</div>

<div id="facilityModel" class="modal">
	<form name="facilityForm" method="post">
		<table class="modalTable">
			<tr>
				<th scope="row">시설번호</th>
				<td><input type="text" name="facilityCode" class="facilityCode" data-name="업체명을"></td>
			</tr>
			<tr>
				<th scope="row">시설명</th>
				<td><input type="text" name="name" class="name" data-name="업체명을"></td>
			</tr>
			<tr>
				<th scope="row">테마명</th>
				<td><input type="text" name="themeName" class="themeName" data-name="업체명을"></td>
			</tr>
			<tr>
				<th scope="row">시설상태</th>
				<td><input type="text" name="state" class="state" data-name="업체명을"></td>
			</tr>
			<tr>
				<th scope="row">설치일자</th>
				<td><input type="text" name="installDate" class="installDate" data-name="업체명을" readonly="readonly"></td>
			</tr>
			<tr>
				<th scope="row">제거일자</th>
				<td><input type="text" name="removeDate" class="removeDate" data-name="업체명을" readonly="readonly"></td>
			</tr>
			<tr>
				<th scope="row">시설사진</th>
				<td> <input type="text" name="saveMainFilename" class="saveMainFilename"><button type="button" class="picture1">사진보기</button></td>
			</tr>
			<tr> 
				<th scope="row">시설위치사진</th>
				<td> <input type="text" name="saveLocFilename" class="saveLocFilename"><button type="button" class="picture2">사진보기</button></td>
			</tr>
			<tr> 
				<th scope="row">설명</th>
				<td><textarea name="memo" class="memo"  data-name="상세설명을"></textarea></td>
			</tr>
		</table>
		
		<div class="btnBox">
	        <button type="button" class="btn btn-info" id="sendOk">시록</button>
	        <button type="reset" class="btn btn-default">다시입력</button> 
	        <button type="button" class="btn btn-default" id="facilityAdd_close_btn">?</button>
	    </div>
	</form>
</div>
	    
