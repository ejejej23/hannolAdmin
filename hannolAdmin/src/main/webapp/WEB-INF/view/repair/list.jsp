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
	select.noLine{padding:0; appearance:none; -webkit-appearance:none; -moz-appearance:none; cursor:default;}
	.datepicker.noLine{padding-left:0;}
	.datepicker.noLine+img{display:none;}
	input[name=state].noLine,
	input[name=state].noLine+label{display:none;}
	.stateView{display:block !important; padding-top:3px;}	
	
	/*search*/
	.datepickerBox{display:inline-block;}
	.datepickerBox .datepicker{width:203px;}   
	input[type=radio].boxR{margin:0 0px 0 11px; vertical-align:middle;} 
	input[type=radio].boxR:first-child{margin-left:0;} 
	 
	.datepicker + img{width:22px; margin:0px 0px 0px -31px; padding-left:8px; border-left:1px solid #dddddd; cursor:pointer;}

</style>
<script type="text/javascript">
</script>

<div class="sub-container">
	<div class="sub-title">
		<h3>수리
			<small>15개(2/10페이지)</small> 
		</h3>
	</div>

	<div class="sub_contents">
		<form name="searchForm" method="post">
			<table style="width: 100%; margin: 30px auto; border-spacing: 0px;">
				<tr>
					<th>상태</th> 
					<td> 
						<input type="radio" name="searchState" value="2" class="boxR" checked="checked" <c:if test="${searchState=='3'}">checked="checked"</c:if>> 전체
						<input type="radio" name="searchState" value="1" class="boxR" <c:if test="${searchState=='1'}">checked="checked"</c:if>> 양호
						<input type="radio" name="searchState" value="0" class="boxR" <c:if test="${searchState=='0'}">checked="checked"</c:if>> 주의   
					</td>   
				</tr> 
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
						<select name="searchKey" class="selectField">
							<option value="kind">분류</option>
							<option value="name">시설명</option> 
							<option value="content">점검내역</option>
						</select>  
						<input type="text" name="searchValue" class="boxTF"> 
						<button type="button" class="btn btn-default" onclick="searchList()">검색</button>
					</td>  
				</tr>
			</table>
		</form>
	
		<table class="table">
			<colgroup>
				<col style="width:5%;">
				<col style="width:12%;">
				<col style="width:15%;">
				<col style="">
				<col style="width:15%;">
				<col style="width:8%;">
				<col style="width:15%;">
			</colgroup>

			<thead class="thead-light">
				<tr>
					<th scope="col">번호</th>
					<th scope="col">분류</th>
					<th scope="col">시설명</th>
					<th scope="col">수리내역</th>
					<th scope="col">비용</th>
					<th scope="col">상태</th>
					<th scope="col">수리일자</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>프린세스 빌리지</td>
					<td>oo어트랙션명</td>
					<td class="articleVeiw"><a href="#">브레이크 고장</a></td>
					<td>30,000</td>
					<td>요청중</td>
					<td>2017-01-02</td>
				</tr>
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
