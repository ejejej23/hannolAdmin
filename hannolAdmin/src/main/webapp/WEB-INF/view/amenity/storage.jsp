<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
	
	.storageCount_box{margin:20px 0; padding:15px; text-align:center; background-color:#fafafa; border:1px solid #efefef;}
	
	.storage_box{margin:50px auto;}
	.storage_box td{position:relative; width:120px; height:120px; text-align:center; color:#757575; background-color:#ffffff; border:1px solid #ccc; cursor:pointer;}
	.storage_box td:hover{background-color:#f8f8f8; z-index:1;} 
	.storage_box .st_rent{font-weight:600; color:#ffffff; background-color:#676fa2;}
	.storage_box .st_rent:hover{background-color:#636b9d;}
	.storage_box td span{display:block;}
	.storage_num{position:absolute; top:10px; width:100%; font-size:12px;}
	.storage_rant{font-size:13px;}

</style>

<div class="sub-container">
	<div class="sub-title">
		<h3>보관함</h3>
	</div>
	
	<div class="sub_contents">
		<form>
			<div>
				테마존 :
				<select class="selectField">
					<option value="프린세스빌리지">프린세스빌리지</option>
					<option value="토이스토리">토이스토리</option>
					<option value="라이온킹">라이온킹</option>
					<option value="미니언즈">미니언즈</option>
					<option value="니모">니모</option>
				</select>
				<select class="selectField">
					<option value="오전">오전</option>
					<option value="오후">오후</option>
				</select>
				<button class="btn">조회</button>
			</div>
			
			<div class="storageCount_box">남은 보관함 : 5개/10개</div>
			
			<div>
			<table class="storage_box"> 
				<tr>
					<td class="st_rent">
						<span class="storage_num">1</span>
						<span class="storage_rant">대여중</span>
					</td>
					<td>
						<span class="storage_num">2</span>
						<span class="storage_rant">대기</span>
					</td>
					<td>
						<span class="storage_num">3</span>
						<span class="storage_rant">대기</span>
					</td>
					<td>
						<span class="storage_num">4</span>
						<span class="storage_rant">대기</span>
					</td>
					<td>
						<span class="storage_num">5</span>
						<span class="storage_rant">대기</span>
					</td>
				</tr>
				<tr>
					<td>
						<span class="storage_num">6</span>
						<span class="storage_rant">대기</span>
					</td>
					<td>
						<span class="storage_num">7</span>
						<span class="storage_rant">대기</span>
					</td>
					<td>
						<span class="storage_num">8</span>
						<span class="storage_rant">대기</span>
					</td>
					<td>
						<span class="storage_num">9</span>
						<span class="storage_rant">대기</span>
					</td>
					<td>
						<span class="storage_num">10</span>
						<span class="storage_rant">대기</span>
					</td>
				</tr>
			</table>
			</div>
			
			
		</form>
	</div>
</div>