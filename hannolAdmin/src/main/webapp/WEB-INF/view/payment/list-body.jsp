<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<div style="clear: both;">
		<div>
		<c:set var="parentCode" value="1"/>
		<c:set var="payDate" value="${lastPayDate}"/>
		
		<c:forEach var="dto" items="${list}" varStatus="status" >
      		<c:if test="${status.first || parentCode!=dto.parentCode || payDate!=dto.payDate}">
      			<c:set var="parentCode" value="${dto.parentCode}"/>
	      			<c:set var="payDate" value="${dto.payDate}"/>
	      			
	      			<c:if test="${! status.first}">
			     		</table>
			     		</div>
			     		</div>
		  			</c:if>
		  			
		  			
		  			<div style="border: 1px solid #e1e1e1; margin-top: 15px;">
		  			
		  			<form name="submitForm" method="post"> 
		  			
		  			
		  			<div style="background-color: #e1e1e1;">
    					<div style="padding: 10px;">
    						<h5 style="display: inline;">구매자</h5>
    						<h5 style="font-weight: bold; display: inline; margin-left: 10px;">${dto.memberId}</h5>
    					</div>
    				</div>
		  				
		  			<div style="margin: 15px;">
		  				<table style="border: 1px solid #e1e1e1;">
		  					<tr>
		             			<th>상품명</th>
		             			<th style="width: 20%">가격 / 수량</th>
		             			<th>구매일</th>
		             			<th rowspan="${dto.rowspan}" style="width: 20%">
		             				<p><fmt:formatNumber value="${dto.payPrice}" type="number" pattern="#,###원"/></p>
		             				<c:forEach var="vo" items="${uselist}">	
		             				<c:if test="${dto.payCode == vo.PAYCODE && dto.state eq '결제취소'}"><h5>결제취소</h5></c:if>
		             				<c:if test="${dto.state eq '승인완료'}">
		             				<c:if test="${(dto.payCode == vo.PAYCODE || empty uselist) && dto.gubunCode != 8}">
		             					<c:if test="${sessionScope.staff.authority == 'ROLE_ADMIN' }">
		             					<button type="button" class="btn btn-danger" onclick="refundCheck(${dto.payCode});">구매취소</button>
		             					</c:if>
		             					
		             					<!-- 모달창시작 -->
		             					<div style="display: none;" id="refundModal${dto.payCode}" role="dialog" class="modal" tabindex="-1">
											<div class="modal-dialog">
												<div class="modal-content">
											    	<div class="modal-header">
									 					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									  					<span aria-hidden="true">×</span></button>
									 					<div align="center">
									 						<h4 class="modal-title" id="myModalLabel">구매취소</h4>
									 					</div>
													</div>
													<div class="modal-body">
														<h5 class="custom_h2">결제일자 : ${dto.payDate}</h5>			
														<table class="custom_table" style="border-bottom: 2px solid #cecece; margin-bottom: 15px;">
											  				<tbody>
											  				<c:forEach var="vo" items="${list}" varStatus="status" >
											  				<c:if test="${dto.payCode == vo.payCode}">
																<tr>
																	<td class="custom_col1">
																		${vo.gubunName} - ${vo.goodsName}
																	</td>
																	<td class="customer_col2">
																		<fmt:formatNumber value="${vo.price}" type="number" pattern="#,###원"/> / ${vo.quantity}개
																	</td>
																</tr>
															</c:if>
															</c:forEach>
											  				</tbody>
														</table>
														
														<h5 class="custom_h2">환불정보</h5>
														<table class="custom_table" style="border-bottom: 2px solid #cecece; margin-top: 10px;">
											  				<tbody>
																<tr>
																	<th class="modal_th">환불금액</th>
																	<td id="payPrice" class="modal_td"><fmt:formatNumber value="${dto.payPrice}" type="number" pattern="#,###원"/></td>
																</tr>
																<tr>
																	<th class="modal_th">환불쿠폰</th>
																	<td id="coupon" class="modal_td">${dto.couponCount}개</td>
																</tr>
																<tr>
																	<th class="modal_th">결제카드</th>
																	<td id="cardType" class="modal_td">${dto.cardCo}</td>
																</tr>
																<tr>
																	<th class="modal_th">할부기간</th>
																	<td id="paySectionType" class="modal_td">${dto.paySection}</td>
																</tr>
											  				</tbody>
														</table>
														
														<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
											   				<tr height="40">
											      				<td align="center" width="100">
											      					<input type="hidden" name="payCode" value="${dto.payCode}">
											      					<input type="hidden" name="searchKey" value="${searchKey}">
											      					<input type="hidden" name="searchValue" value="${searchValue}">
											          				<button type="button" class="btn btn-danger" style="font-weight: bold;" onclick="refund();">환불하기</button>
											     	 				<button type="button" class="btn btn-default" data-dismiss="modal" style="font-weight: bold;">취소하기</button>
											     	 			</td>
											   				</tr>
														</table>
													</div>
												</div>
											</div>
										</div>
		             					<!-- 모달창끝 -->
		             					
		             				</c:if>
		             				</c:if>
		             				</c:forEach>
		             			</th>
		      				</tr>
      		</c:if>
      		<tr>
      			<td>${dto.gubunName} - ${dto.goodsName}</td>
      			<td><fmt:formatNumber value="${dto.price}" type="number" pattern="#,###원"/> / ${dto.quantity}개</td>
      			<td>${dto.payDate}</td>
      		</tr>
      	</c:forEach>
      	
      	<c:if test="${list.size()>0}">
		     </table>
		     </div>
		     </form>
		     </div>
		 </c:if>
		
		<div style="width: 100%; margin: 10px auto; border-spacing: 0px;">
			<div align="left">
		    	<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/payment/list?thema=${thema}';">새로고침</button>
		    </div>
		    <div align="center">
		      	${paging}
		    </div>
		</div>
    </div>
</div>
