<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
	
	<div class="storageCount_box">남은 보관함 : ${unuse}개/10개</div>
			
			<div>
			<table class="storage_box"> 
				<tr>
				<c:choose>
					<c:when test="${dto.lock1==1}">
						<td style="background-color: #3399ff">
							<span class="storage_num">1</span>
							<span class="storage_rant">사용중</span>
						</td>
					</c:when>
					<c:otherwise>
						<td>
							<span class="storage_num">1</span>
							<span class="storage_rant">대기</span>
						</td>
					</c:otherwise>
				</c:choose>
				
				
				<c:choose>
					<c:when test="${dto.lock2==2}">
						<td style="background-color: #3399ff">
							<span class="storage_num">2</span>
							<span class="storage_rant">사용중</span>
						</td>
					</c:when>
					<c:otherwise>
						<td>
							<span class="storage_num">2</span>
							<span class="storage_rant">대기</span>
						</td>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${dto.lock3==3}">
						<td style="background-color: #3399ff">
							<span class="storage_num">3</span>
							<span class="storage_rant">사용중</span>
						</td>
					</c:when>
					<c:otherwise>
						<td>
							<span class="storage_num">3</span>
							<span class="storage_rant">대기</span>
						</td>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${dto.lock4==4}">
						<td style="background-color: #3399ff">
							<span class="storage_num">4</span>
							<span class="storage_rant">사용중</span>
						</td>
					</c:when>
					<c:otherwise>
						<td>
							<span class="storage_num">4</span>
							<span class="storage_rant">대기</span>
						</td>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${dto.lock5==5}">
						<td style="background-color: #3399ff">
							<span class="storage_num">5</span>
							<span class="storage_rant">사용중</span>
						</td>
					</c:when>
					<c:otherwise>
						<td>
							<span class="storage_num">5</span>
							<span class="storage_rant">대기</span>
						</td>
					</c:otherwise>
				</c:choose>
				</tr>
				
				<tr>
				<c:choose>
					<c:when test="${dto.lock6==6}">
						<td style="background-color: #3399ff">
							<span class="storage_num">6</span>
							<span class="storage_rant">사용중</span>
						</td>
					</c:when>
					<c:otherwise>
						<td>
							<span class="storage_num">6</span>
							<span class="storage_rant">대기</span>
						</td>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${dto.lock7==7}">
						<td style="background-color: #3399ff">
							<span class="storage_num">7</span>
							<span class="storage_rant">사용중</span>
						</td>
					</c:when>
					<c:otherwise>
						<td>
							<span class="storage_num">7</span>
							<span class="storage_rant">대기</span>
						</td>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${dto.lock8==8}">
						<td style="background-color: #3399ff">
							<span class="storage_num">8</span>
							<span class="storage_rant">사용중</span>
						</td>
					</c:when>
					<c:otherwise>
						<td>
							<span class="storage_num">8</span>
							<span class="storage_rant">대기</span>
						</td>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${dto.lock9==9}">
						<td style="background-color: #3399ff">
							<span class="storage_num">9</span>
							<span class="storage_rant">사용중</span>
						</td>
					</c:when>
					<c:otherwise>
						<td>
							<span class="storage_num">9</span>
							<span class="storage_rant">대기</span>
						</td>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${dto.lock10==10}">
						<td style="background-color: #3399ff">
							<span class="storage_num">10</span>
							<span class="storage_rant">사용중</span>
						</td>
					</c:when>
					<c:otherwise>
						<td>
							<span class="storage_num">10</span>
							<span class="storage_rant">대기</span>
						</td>
					</c:otherwise>
				</c:choose>
				
				</tr>
			</table>
			</div>