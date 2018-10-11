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
	.table td:nth-child(7),
	.table td:nth-child(8),
	.table th:nth-child(7),
	.table th:nth-child(8){text-align:right;}   
	.table td:nth-child(9){text-align:left;}   
	 
	.table tbody tr:hover{color:#545865; background-color:#f8f8f8; cursor:pointer;}     
	 
	.listData_no{text-align:center;}
	
	
	/*search*/
	.datepickerBox{display:inline-block;}
	.datepickerBox .datepicker{width:203px;}   
	input[type=radio].boxR{margin:0 0px 0 11px; vertical-align:middle;} 
	input[type=radio].boxR:first-child{margin-left:0;} 
	.selectField{padding:6px; vertical-align:middle;}
	.boxTF[readonly]{background-color:#ffffff;}   
	.datepicker + img{width:22px; margin:0px 0px 0px -31px; padding-left:8px; border-left:1px solid #dddddd; cursor:pointer;}

</style>

<script type="text/javascript">
	$(function(){
		var searchthema = "${searchthema}";
		var searchKey = "${searchKey}";
		if(searchthema!=null &&searchthema!=""){
			$("select[name=searchthema] option[value="+searchthema+"]").prop("selected", true); 
		}
		if(searchKey!=null && searchKey!=""){  
			$("select[name=searchKey] option[value="+searchKey+"]").prop("selected", true);    
		}          
	});  
 
	//datepicker
	$(function(){
		//검색 시작날짜
		$("input[name=searchStartDate]").datepicker({
			dateFormat:'yy-mm-dd',
			showOn:"both",
	        buttonImage:"<%=cp%>/resource/images/date24.png",
	        buttonImageOnly:true,
	        showAnim:"slideDown",
	        buttonText:"선택",
	        maxDate:0,
	        onSelect:function(selected){
	        	if(!$("input[name=searchEndDate]").val()){ 
	        		$("input[name=searchEndDate]").val(selected);  
	        	}
	        		
	        	$("input[name=searchEndDate]").datepicker("option", "minDate", selected);
	        
	        }
		}); 
		//검색 마지막 날짜
		$("input[name=searchEndDate]").datepicker({
			dateFormat:'yy-mm-dd',
			showOn:"both",
	        buttonImage:"<%=cp%>/resource/images/date24.png",
	        buttonImageOnly:true,
	        showAnim:"slideDown",
	        buttonText:"선택",
	        maxDate:0, 
	        onSelect:function(selected){
	        	if(!$("input[name=searchStartDate]").val()){
	        		$("input[name=searchStartDate]").val(selected);
	        	}   
	        	
	        	 $("input[name=searchStartDate]").datepicker("option", "maxDate", selected); 
	        } 
		});	
	});
	
	//검색
	function searchList(){
		var f = document.searchForm;
		f.action = "<%=cp%>/goodsIn/list"; 
		f.submit(); 
	} 
</script> 

<div class="sub-container">
	<div class="sub-title">
		<h3>입고 관리
			<small>${dataCount}개(${page}/${total_page}페이지)</small> 
		</h3>
	</div>

	<div class="sub_contents">
		<form name="searchForm" method="post">
			<table style="width: 100%; margin: 30px auto; border-spacing: 0px;"> 
				<tr height="40">
					<th>날짜</th>
					<td>
						<span class="datepickerBox"><input type="text" name="searchStartDate" class="boxTF datepicker" readonly="readonly" value="${searchStartDate}"></span> ~ 
						<span class="datepickerBox"><input type="text" name="searchEndDate" class="boxTF datepicker" readonly="readonly"  value="${searchEndDate}"></span>
					</td>  
				</tr>
				<tr>
					<th>검색</th> 
					<td>
						<select name="searchthema" class="selectField"> 
							<option value="0">전체 테마</option>   
							<c:forEach var="dto" items="${gubunList}">
								<option value="${dto.GUBUNCODE}">${dto.GUBUNNAME}</option>
							</c:forEach>   
						</select> 
						<select name="searchKey" class="selectField"> 
							<option value="itemName">상품명</option>
							<option value="itemCode">상품코드</option>
							<option value="company">업체명</option> 
							<option value="content">비고</option>
						</select>  
						<input type="text" name="searchValue" class="boxTF" value="${searchValue}">  
						<button type="button" class="btn btn-default" onclick="searchList()">검색</button>
					</td>  
				</tr>
			</table>
		</form> 
	
		<table class="table">
			<colgroup>
				<col style="width:5%;">
				<col style="width:8%;">   
				<col style="width:18%;">  
				<col style="width:15%;">   
				<col style="width:8%;">   
				<col style="width:8%;"> 
				<col style="width:9%;">
				<col style="width:10%;">  
				<col style="">  
				<col style="width:10%;">  
			</colgroup> 

			<thead class="thead-light">
				<tr>
					<th scope="col">번호</th>
					<th scope="col">상품코드</th> 
					<th scope="col">상품명</th>
					<th scope="col">업체명</th> 	
					<th scope="col">입고수량</th>
					<th scope="col">총수량</th> 
					<th scope="col">단가</th> 
					<th scope="col">총금액</th>
					<th scope="col">비고</th>
					<th scope="col">입고일자</th>					
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${list}">
					<tr onclick="javascript:location.href='${article_url}&num=${dto.inCode}';"> 
						<td>${dto.listNum}</td>
						<td>${dto.goodsCode}</td>    
						<td title="${dto.goodsName}">${dto.goodsName}</td> 
						<td title="${dto.companyName}">${dto.companyName}</td>
						<td>${dto.quantity}</td>
						<td>${dto.totalCount}</td>
						<td><fmt:formatNumber value="${dto.unitPrice}" type="number"/></td> 
						<td><fmt:formatNumber value="${dto.quantity*dto.unitPrice}" type="number"/></td> 
						<td>${dto.memo}</td> 
						<td>${dto.inDate}</td>
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
					<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/goodsIn/list';">새로고침</button>
				</td>
				<td align="right" width="100">
					<button type="button" id="createdBtn" class="btn btn-info" onclick="javascript:location.href='<%=cp%>/goodsIn/created'">신규입고</button>  
				</td>
			</tr>
		</table>
	</div>
</div>