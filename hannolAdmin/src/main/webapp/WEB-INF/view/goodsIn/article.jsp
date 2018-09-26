<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>
	/**table**/
	.tableForm{width:100%; margin:20px auto;} 
	.tableForm tr{height:40px; border-top: 1px solid #cccccc; border-bottom: 1px solid #cccccc;}
	.tableForm th{width:125px; font-weight:normal; text-align:center; background-color:#eeeeee;}
	.tableForm td{width:19%; padding:10px;}        
	  
	.tableForm .boxTF,
	.tableForm .boxTA,
	.tableForm .selectField{width:100%; border-color:#bababa;} 
	.tableForm .boxTA{height:250px; vertical-align:top;}   
	.tableForm .selectField{padding:5px;}      
	.boxTF[readonly]{background-color:#f3f3f3;}
	.tableForm .memo{min-height:250px; height:250px; padding-top:15px; padding-bottom:15px; vertical-align:top;}   
	 
</style>   

<div class="sub-container" style="width: 960px;">
	<div class="sub-title">
		<h3>입고 정보</h3>
	</div>

	<div>
		<table class="tableForm">
			<tr>  
			    <th>구분코드</th>
			    <td colspan="5"> 
			      	${dto.gubunName} 
			    </td> 
			</tr>
			<tr>  
			    <th>상품명</th>
			    <td colspan="5">
			      	${dto.goodsName}   
			    </td>
			</tr>
			<tr>  
			    <th>상품코드</th>
			    <td colspan="5"> 
			    	${dto.goodsCode}
			    </td> 
			</tr>
			<tr>
				<th>구입처</th>
				<td colspan="3">
					${dto.companyName} 
				</td>   
			    <th>입고날짜</th>
			    <td>${dto.inDate}</td>    
			</tr>
			<tr>
			    <th>수량 / 총수량</th> 
			    <td> 
			    	${dto.quantity}개 / ${dto.totalCount}개   
			    </td> 
			    <th>단가</th> 
			    <td>
			    	<fmt:formatNumber value="${dto.unitPrice}" type="number"/>원
			    </td>
			    <th>총금액</th>   
			    <td> 
			    	<fmt:formatNumber value="${dto.quantity*dto.unitPrice}" type="number"/>원 
			    </td> 
			</tr>
			<tr>
			    <th>비고</th>
			    <td colspan="5" class="memo"> 
			    	${dto.memo} 
			    </td> 
			</tr>
		</table>

		<table style="width: 100%; margin: 0px auto 20px; border-spacing: 0px;">
			<tr height="45">
				<c:if test="${isMagam==0}">
				    <td width="300" align="left">
				    	<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/goodsIn/update?num=${dto.inCode}&${query}';">수정</button>
				    </td>
				</c:if>
			
			    <td align="right"> 
			        <button type="button" class="btn btn-info" onclick="javascript:location.href='<%=cp%>/goodsIn/list?page=${page}&${query}';">리스트</button> 
			    </td>
			</tr>
		</table>
	</div>
</div>