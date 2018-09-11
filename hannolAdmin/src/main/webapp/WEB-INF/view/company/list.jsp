<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
	/**table**/
	.table{font-size:13px;}
	.table th,
	.table td{text-align:center;}
	.table th:nth-child(2),
	.table td:nth-child(2),
	.table th:nth-child(3),
	.table td:nth-child(3),
	.table td:nth-child(4){text-align:left;}
	
	.listData_no{text-align:center;}
	
	
	/**modal**/
	.modalTable{width:100%; margin-top:20px; color:#444444;}
	.modalTable th,
	.modalTable td{padding:10px 0;} 
	.modalTable th{width:110px; padding-top:13px; padding-right:20px; text-align:right; vertical-align:top;}
	
	.boxTF,
	.boxTA{width:280px; vertical-align:middle;}
	.boxTF{padding:3px 5px;}
	.selectField{padding:5px; vertical-align:middle;}
	.boxTF.btfName{width:120px;}
	.btfTel{width:70px; text-align:center;}
	
	
	.btnBox{margin:30px 0; text-align:center;}
	
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
	var elementsName = [];
	var elementsNameText = [];

	$(function(){
		var elements = $("form[name=companyForm] input, form[name=companyForm] textarea, form[name=companyForm] select");
			elementsName = [];
			elementsNameText = [];
		
		for(var i=0; i<elements.length; i++){
			elementsName[i] = elements[i];
			elementsNameText[i] = elements[i].getAttribute("data-name");
		}
	});
	
	
	
	/*다이얼 로그*/
	$(function(){
		$("#companyAdd_btn").click(function(){
			$("#companyModel").dialog({
				title:"업체추가",
				width:480,
				height:460,
				modal:true
			});
		});
		$("#companyAdd_close_btn").click(function(){
			$("#companyModel").dialog("close");
		});
	});
	
	
	//검색
	function searchList(){
		 var f = document.searchForm;
		 f.action="<%=cp%>/company/list";
		 f.submit();
	}; 
	
	
	//전송
	function sendOk(){
		var f = document.companyForm;
		
		//빈칸 확인
		for(var i=0 ; i<elementsName.length ; i++){
			if(!elementsName[i].value){
				elementsName[i].focus();
				alert(elementsNameText[i]+" 입력해주세요.");
				return;
			}
		}
		
		f.action = "<%=cp%>/company/created";
		f.submit();
	}
	
	
</script>

<div class="sub-container">
	<div class="sub-title">
		<h3>업체 정보
			<small>${dataCount}개(${page}/${total_page} 페이지)</small>
		</h3>
	</div>

	<div class="sub_contents">
		<table class="table">
			<colgroup>
				<col style="width:6%;">
				<col style="width:18%;">
				<col style="">
				<col style="width:14%;">
				<col style="width:15%;">
			</colgroup>

			<thead class="thead-light">
				<tr>
					<th scope="col">번호</th>
					<th scope="col">업체명</th>
					<th scope="col">상세설명</th>
					<th scope="col">연락처</th>
					<th scope="col">거래시작일자</th>
				</tr>
				
			</thead>
			<tbody>
				<c:forEach var="dto" items="${list}">
					<tr>
						<td>${dto.listNum}</td>
						<td>${dto.name}</td>
						<td><a href="#">${dto.memo}</a></td>
						<td>${dto.tel}</td>
						<td>${dto.startDate}</td>
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
					<button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/company/list';">새로고침</button>
				</td>
				<td align="center">
					<form name="searchForm" method="post">
						<select name="searchKey" class="selectField">
							<option value="companyName">업체명</option>
							<option value="content">상세설명</option>
							<option value="tel">연락처</option>
							<option value="created">거래시작일자</option>
						</select> 
						<input type="text" name="searchValue" class="boxTF">
						<button type="button" class="btn" onclick="searchList()">검색</button>
					</form>
				</td>
				<td align="right" width="100">
					<button type="button" id="companyAdd_btn" class="btn">업체추가</button>
				</td>
			</tr>
		</table>
	</div>
</div>

<div id="companyModel" class="modal">
	<form name="companyForm" method="post">
		<table class="modalTable">
			<tr>
				<th scope="row">업체명</th>
				<td><input type="text" name="name" class="boxTF" data-name="업체명을"></td>
			</tr>
			<tr>
				<th scope="row">상세설명</th>
				<td><textarea name="memo" class="boxTA"  data-name="상세설명을"></textarea></td>
			</tr>
			<tr>
				<th scope="row">연락처</th>
				<td>
					<select class="selectField btfTel" name="tel1" data-name="연락처를">
						<option value="">선택</option>
						<option value="010">010</option>
						<option value="010">011</option>
						<option value="010">016</option>
						<option value="010">017</option>
						<option value="010">018</option>
						<option value="010">019</option>
					</select> - <input type="text" name="tel2" class="boxTF btfTel" maxlength="4" data-name="연락처를"> - <input type="text" name="tel3" data-name="연락처를" class="boxTF btfTel" maxlength="4">
				</td>
			</tr>
		</table>
		
		<div class="btnBox">
	        <button type="button" class="btn" onclick="sendOk();">업체등록</button>
	        <button type="reset" class="btn">다시입력</button> 
	        <button type="button" class="btn" id="companyAdd_close_btn">등록취소</button>
	    </div>
	</form>
</div>
