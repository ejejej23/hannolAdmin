<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%> 
<style>
	/*table list*/
	.table.tbStatus td:nth-child(4){font-weight:bold; color:#5390e2;}  
</style> 

<script type="text/javascript">
	var elementsName = [];
	var elementsNameText = [];
	
	$(function(){
		var elements = $("form[name=formData] input, form[name=formData] select").not("input[type=radio]");
			elementsName = [];
			elementsNameText = [];  
		
		for(var i=0; i<elements.length; i++){
			elementsName[i] = elements[i];
			elementsNameText[i] = elements[i].getAttribute("data-name"); 
		}
	}); 

	
	//모달창 띄우기
	$(function(){
		var facilityCode = ""; //시설코드
		$("body").on("click", ".rt_register", function(){
			facilityCode = $(this).attr("data-num"); 
			
			$("#modal").dialog({
				title : "현장등록",
				width : 390,       
				height : 350,      
				modal : true,
				close:function(){
					formClean();
				}
			});
		});
		
		$("#modalCloseBtn").click(function(){
			$("#modal").dialog("close");  
		});
	
	
		//현장등록
		$("#insertRent").click(function(){   
			/* $(".nav-item").each(function(){
				$(this).hashClass("active");
			});
			 */
			
			
			var url = "<%=cp%>/assets/insertRent";
			var query = $("form[name=formData]").serialize()+"&facilityNum="+facilityCode;
			
			$.ajax({ 
				type:"post",
				url:url,
				data:query,
				dataType:"json", 
				beforeSend:check,
				success:function(data){
					if(data.state=="true"){
						alert("현장 등록이 완료되었습니다.");
						location.reload();
					}else{
						alert("현장 등록을 실패하였습니다. 다시 시도해주세요.");
						location.reload(); 
					}
				},
				error:function(e){
					console.log(e.responseText);
				}
			}); 
		});
	});
	
	
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
			if(elementsName[i].getAttribute("name")=="tel1"){
				elementsName[i].selected;   
			}else{	
				elementsName[i].value="";
			}
		}  
	}
	
	//연락처 숫자만
	$(function(){
		$(".tel").keypress(function(){
			if(event.keyCode<48 || event.keyCode>57){
				try{ 
					event.preventDefault(); //발생된 이벤트를 취소	
				}catch (e) {
					event.returnValue = false; //ie낮은 버전 이벤트 취소
				}
			}
				
		});
	});
</script>
 
<div class="tableBox">
	<h4>대여 현황 목록</h4>   
	
	<table class="table tbStatus">
		<colgroup>  
			<col style="width:8%;">
			<col style="width:*%;">
			<col style="width:10%;">  
			<col style="width:10%;"> 
			<col style="width:10%;">
			<col style="width:10%;">     
		</colgroup> 
	
		<thead> 
			<tr>
				<th scope="col">시설번호</th>
				<th scope="col">시설명</th>
				<th scope="col">대여수량</th>
				<th scope="col">대여가능</th> 
				<th scope="col">총수량</th>
				<th scope="col">현장등록</th> 
			</tr>
		</thead>
		<tbody>
			<c:forEach var="dto" items="${assetsCountList}"> 
				<tr>
					<td>${dto.facilityCode}</td>  
					<td>${dto.name}</td>
					<td>${dto.rentCount}</td>  
					<td <c:if test="${(dto.totalCount-dto.rentCount)<1}">class="rentWarning"</c:if>> 
						${dto.totalCount-dto.rentCount}      
					</td>     
					<td>${dto.totalCount}</td>   
					<td>
						<c:if test="${(dto.totalCount-dto.rentCount)>0}">
							<button type="button" class="btn btn-info renBtn rt_register" data-num="${dto.facilityCode}">등록</button> 
						</c:if> 
					</td>  
				</tr>
			</c:forEach> 
		</tbody>
	</table>
	<div>
		
	</div>
	
	<table style="width:100%; margin:0px auto; border-spacing:0px;">
		<tr>
			<td class="listData_no">
				<c:if test="${assetsDataCount==0}">
					등록된 게시물이 없습니다.
				</c:if>
				<c:if test="${assetsDataCount!=0}">     
					${countPaging}  
				</c:if>
			</td> 
		</tr>
	</table>
</div>



<!-- 모달창 -->
<div id="modal" class="modal">
	<form name="formData" method="post">
		<table class="modalTable">
			<tr>
				<th scope="row">시간</th>
				<td>   
					<input type="radio" name="bookTime" value="0" checked="checked"> 오후
					<input type="radio" name="bookTime" value="1"> 종일 
				</td>
			</tr>
			<tr>
				<th scope="row">이름</th>
				<td>
					<input type="text" name="name" class="boxTF" data-name="이름을"> 
				</td>
			</tr>
			<tr>
				<th scope="row">연락처</th>
				<td>
					<select name="tel1" class="selectField tel" data-name="연락처를">
						<option value="010" selected="selected">010</option> 
						<option value="011">011</option>
						<option value="017">017</option>
						<option value="016">016</option>
						<option value="019">019</option>
					</select> - <input type="text" name="tel2" class="boxTF tel" maxlength="4" data-name="연락처를"> - <input type="text" name="tel3" class="boxTF tel" maxlength="4" data-name="연락처를">
				</td> 
			</tr>
		</table>
		
		<div class="btnBox">
	        <button type="button" class="btn btn-info" id="insertRent">현장등록</button>
	        <button type="reset" class="btn btn-default">다시입력</button> 
	        <button type="button" class="btn btn-default" id="modalCloseBtn">등록취소</button>
	    </div> 
	</form>
</div>