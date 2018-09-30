<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>
	/**table**/ 
	.tableForm{width:100%; margin:20px auto; table-layout:fixed;} 
	.tableForm tr{height:40px; border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;}
	.tableForm th{width:125px; font-weight:normal; text-align:center; background-color:#eeeeee;}
	.tableForm td{padding:5px;}        
	  
	.tableForm .boxTF,
	.tableForm .boxTA,
	.tableForm .selectField{width:100%; border-color:#bababa;} 
	.tableForm .boxTA{height:250px; vertical-align:top;}   
	.tableForm .selectField{padding:5px;}      
	.boxTF[readonly]{background-color:#f3f3f3;}
	
	#count{width:60px;}
	.msgText_box{position:relative;}  
	.msg_text{display:none; position:absolute; width:140px; padding:10px 15px 10px 25px; font-size:10px; color:tomato; background-color:#ffffff; border:1px solid #efefef; box-shadow:3px 3px 3px 3px rgba(0,0,0,0.02); border-radius:5px;}   
	.msg_text span:before{content:"※"; margin-left:-15px; padding-right:6px;}  
 
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
	 
	
	$(function() {
		//구분 change할 때마다 상품 가져오기
		$("select[name=gubuncode]").change(function(){
			var gubunCode = $(this).val(); //테마별구분코드 
			$("input[name=goodsCode]").val(""); //상품코드 리셋 
			$("#totalCount").text("0");  //총 개수 리셋 
			$("#price").val("0"); //가격 리셋  
			 
			var url = "<%=cp%>/goodsOut/goodsItem";
			var query = "gubunCode="+gubunCode;
			
			$.ajax({
				type:"get",
				url:url,
				data:query,
				dataType:"json",
				success:function(data){
					$("select[name=outName]").empty();
					$("select[name=outName]").append("<option value=''>::상품선택::</option>");  
					
					for(var i=0 ; i<data.itemList.length ; i++){
						$("select[name=outName]").append("<option value="+data.itemList[i].GOODSCODE+">"+data.itemList[i].GOODSNAME+"</option>");
					} 
				},error:function(e){
					console.log(e.responseText); 
				}
			});
		});
	});
	
	
	$(function(){
		$("select[name=outName]").click(function(){	
			//상품 선택시 상품코드 출력
			var goodsCode = $(this).val();
			$("input[name=goodsCode]").val(goodsCode); 
			
			//상품 선택시 상품 총개수 가져오기 
			if(goodsCode>0){ //상품코드가 있을때가 총 개수를 가져온다. 
				var url = "<%=cp%>/goodsOut/goodsItemInfo";
				var query = "goodsCode="+goodsCode;  
				
				$.ajax({
					type:"get",
					url:url,
					data:query,
					dataType:"json",
					success:function(data){
						$("#totalCount").text(data.goodsTotalCount);
						$("#price").val(data.goodsPrice);    
					},error:function(e){
						console.log(e.responseText);
					}
				});	
			}
		});
	}); 
	
	//개수 단가 포커스 아웃할때마다 계산
	$(function(){//출고 수량이 총 상품개수 보다 클 수 없다.
		$("#count").blur(function(){
			var totalCount = Number($("#totalCount").text());
			var count = Number($(this).val());  
			
			if(count>totalCount){  
				$(this).val("");
				$(".msg_text").slideDown(500, function(){
					setTimeout(function(){
						$(".msg_text").slideUp(500);
					},3000);              
				});  
				
			}
		}); 
	
		$(".calculation").blur(function(){
			var count = $("#count").val(); //개수
			var price = $("#price").val(); //단가
			$("input[name=totalPrice]").val(totalPrice(count, price)); 	 	
		});	 
	});
	
	//총금액 계산 
	function totalPrice(count, price){
		return count*price
	}
	
	//전송
	function sendOk(){
		var f = document.formData; 
			
		for(var i=0 ; i<elementsName.length ; i++){
			if(!elementsName[i].value){
				elementsName[i].focus();
				alert(elementsNameText[i]+" 입력해주세요.");
				return false;
				
			}
		} 
		
		f.action = "<%=cp%>/goodsOut/${mode}?${query}";	 		
		f.submit();
	} 
</script>
<div class="sub-container"> 
    <div class="sub-title">
	  <h3>${mode=='created'?'출고 관리':'출고 수정'}</h3> 
	</div>  
    
    <div> 
		<form name="formData" method="post">
			<table class="tableForm">
				<tr>  
				    <th>구분코드</th>
				    <td colspan="5"> 
				      	<c:if test="${mode=='created'}">
					 		<select id="gubuncode" name="gubuncode" class="selectField" data-name="구분코드를"> 
					    		<option value="">::테마선택::</option> 
					    		<c:forEach var="list" items="${gubunList}">
									<option value="${list.GUBUNCODE}">${list.GUBUNNAME}</option> 
								</c:forEach> 
					    	</select>   		      
				      	</c:if>
				      	<c:if test="${mode=='update'}">
				      		${dto.gubunName} 
				      	</c:if>
				    </td> 
				</tr>
				<tr>  
				    <th>상품명</th>
				    <td colspan="5">
				    	<c:if test="${mode=='created'}"> 
					    	<select id="goodsCode" name="outName" class="selectField" data-name="상품명을">
					    		<option value="">::상품명 선택::</option>  
								<c:forEach var="list" items="${itemList}"> 
									<option value="${list.GOODSCODE}" <c:if test="${list.GOODSCODE==dto.goodsCode}">selected="selected"</c:if>>${list.GOODSNAME}</option>
								</c:forEach>       
					    	</select>
				    	</c:if>   
				    	<c:if test="${mode=='update'}">
				      		${dto.goodsName}   
				      	</c:if>  
				    </td>
				</tr>
				<tr>  
				    <th>상품코드</th>
				    <td colspan="5"> 
				      <input type="text" name="goodsCode" class="boxTF" readonly="readonly" data-name="상품코드를" value="${dto.goodsCode}"> 
				    </td> 
				</tr>
				<tr>
					<th>구입처</th>
					<td colspan="3">
						<select name="companyCode" class="selectField" data-name="구입처를">
							<option value="">::업체명선택::</option> 
							<c:forEach var="list" items="${companyList}">
								<option value="${list.COMPANYCODE}" <c:if test="${list.COMPANYCODE==dto.companyCode}">selected="selected"</c:if>>${list.COMPANYNAME}</option>
							</c:forEach>  
						</select>
					</td>   
				    <th>출고날짜</th>
				    <td>
				    	<c:if test="${mode=='created'}">
				    		${today}
				    	</c:if>
				    	<c:if test="${mode=='update'}">
				    		${dto.outDate}
				    	</c:if>
				    </td>   
				</tr>
				<tr>
				    <th>출고수량 / 총수량</th>
				    <td class="msgText_box"> 
				      	<input type="number" id="count" name="quantity" class="boxTF calculation" min="1" data-name="수량을" value="${dto.quantity}">
						/ <span id="totalCount">${empty dto.totalCount ? 0 : dto.totalCount}</span> 개     
						<div class="msg_text"> 
							<span>총수량보다 출고수량이 클 수 없습니다.</span> 
						</div>
				    </td>
				    <th>판매가격</th> 
				    <td> 
				      <input type="number" id="price" name="salePrice" class="boxTF calculation" min="0" data-name="판매가격을" readonly="readonly" value="${empty dto.salePrice ? 0 : dto.salePrice}">
				    </td> 
				    <th>총금액</th>    
				    <td>  
				      <input type="text" name="totalPrice" class="boxTF" readonly="readonly" value="${dto.quantity*dto.salePrice}"> 
				    </td> 
				</tr>
				<tr>
				    <th>비고</th>
				    <td colspan="5"> 
				      <textarea name="memo" class="boxTA" data-name="비고를">${dto.memo}</textarea> 
				    </td> 
				</tr>
			</table> 
		
			<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		     	<tr height="45"> 
		      	<td align="center" >
		      	  <button type="button" class="btn btn-info" onclick="sendOk();">${mode=='created'?'등록하기':'수정완료'}</button>
		      	  <button type="reset" class="btn btn-default">다시입력</button> 
		      	  <button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/goodsOut/list?page=${page}&${query}';">${mode=='created'?'등록취소':'수정취소'}</button>
		     	 </td>
		    	</tr>
		  	</table>
		  
		  	<c:if test="${mode=='update'}">
				<input type="hidden" name="outCode" value="${dto.outCode}">
				<input type="hidden" name="originQuantity" value="${dto.quantity}"> 
		 	 </c:if> 
		</form>
    </div>
</div>
 