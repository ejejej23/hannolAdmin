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
	input[name=ticketCode]{width:153px;} 
	input[disabled],
	select[disabled]{background-color:#efefef;}       
</style> 

<script type="text/javascript">
	var elements = []; 
	var elementsName = [];
	var elementsNameText = [];
 
	
	//모달창 띄우기  
	$(function(){		 
		var facilityCode = ""; //시설코드
		$(".rt_register").off().on("click", function(){
			binCheck();    
			   
			facilityCode = $(this).attr("data-num"); 
			
			$("#modal").dialog({
				title : "현장등록",
				width : 390,       
				height : 400,       
				modal : true,
				close:function(){
					formClean();
				}
			});
		});
		
		$("body").on("click", "#modalCloseBtn", function(){
			$("#modal").dialog("close");  
		});
	
	
		//현장등록
		$("#insertRent").off().on("click", function(){   
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
						$("#modal").dialog("close");  
					}
				},
				error:function(e){
					console.log(e.responseText);
				}
			}); 
		});
	});
	
	
	//이용권 검색  
	$(function(){    
		$("#searchTicket").off().on("click", function(){   
			//현재 active되어있는 편의시설 구분코드 가져오기
			var tab = "";
			$(".nav-item").each(function(){
				if($(this).hasClass("active")){
					tab = $(this).children(".nav-link").attr("data-tab");
				}  
			});  
			 

			var ticketCode = $("input[name=ticketCode]").val();
			 
			var url = "<%=cp%>/assets/searchTicket";
			var query = "ticketCode="+ticketCode+"&gubunCode="+tab;  
			
			$.ajax({ 
				type:"post",
				url:url,
				data:query,
				beforeSend:ticketCheck,
				success:function(data){ 
					if(data.state=="true"){
						//disabled해제
						for(var i=0; i<tfDisabled().length;i++){
							tfDisabled().attr("disabled", false); 
						}   
						
						if(data.searchTicket.gubunCode==5 || data.searchTicket.gubunCode==6){
							$("#afternoon").prop("checked", true);  
							$("#allDay").prop("disabled", true); 
						}
					}else if(data.state=="beFound") {
						//disabled신청
						for(var i=0; i<tfDisabled().length;i++){
							tfDisabled().attr("disabled", true); 
							tfDisabled().not("select, input[type=radio]").val("");  
						} 
						alert("이미 예약중입니다.");
						
					}else{
						//disabled신청
						for(var i=0; i<tfDisabled().length;i++){
							tfDisabled().attr("disabled", true); 
							tfDisabled().not("select, input[type=radio]").val("");    
						} 
						alert("사용가능한 티켓이 아닙니다.");
					}
				},
				error:function(e){
					console.log(e.responseText);
				}
			}); 

			return;	
		});	
	});  
	
	
	function tfDisabled(){
		var s_elements = [];
		
		s_elements = $("input[name=bookTime], input[name=name], .tel");
		
		return s_elements;
	}
	
	//이용권 창 빈칸 확인
	function ticketCheck(){
		if($("input[name=ticketCode]").val()==""){ 
			$("input[name=ticketCode]").focus();
			alert("입장권을 입력해주세요.");  
			return false;  
		}
	}

	
	function binCheck(){;
			elements = [];          
			elements = $("form[name=formData] input, form[name=formData] select").not("input[type=radio]").not("input[type=button]"); 
			elementsName = [];
			elementsNameText = [];  
		
		for(var i=0; i<elements.length; i++){
			elementsName[i] = elements[i];
			elementsNameText[i] = elements[i].getAttribute("data-name"); 
		}  
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
			if(elementsName[i].getAttribute("name")=="tel1"){
				elementsName[i].selected;   
			}else{	
				elementsName[i].value="";
			}
		}  
	}
	
	//연락처 숫자만
	$(function(){
		$(".tel, input[name=ticketCode]").keypress(function(){
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
