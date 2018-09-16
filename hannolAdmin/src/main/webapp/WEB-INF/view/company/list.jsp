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
	.table th:nth-child(2),
	.table td:nth-child(2),
	.table th:nth-child(3),
	.table td:nth-child(3),
	.table td:nth-child(4){text-align:left;}
	
	.listData_no{text-align:center;}
	
	.noLine{border:0 none;}
	.btfTel.noLine{width:36px; padding-left:0; padding-right:0;}
	
	
	
	/**modal**/
	.modalTable{width:100%; margin-top:20px; color:#444444;}
	.modalTable th,
	.modalTable td{padding:10px 0;} 
	.modalTable th{width:110px; padding-top:13px; padding-right:20px; text-align:right; vertical-align:top;}
	
	.boxTF,
	.boxTA{width:280px; vertical-align:middle;}
	.boxTA[disabled]{background-color:#f3f3f3; padding:10px 15px;}
	.selectField{padding:5px; vertical-align:middle;}
	.boxTF.btfName{width:120px;}
	.btfTel{width:60px; text-align:center;}
	
	
	.btnBox{margin:40px 0; text-align:center;}
	.btnBox .btn{margin:0 3px;}
	
	
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
	

    /*버튼모음*/
    var sendOk = '<button type="button" class="btn btn-info" id="sendOk">업체등록</button>';
    var updateBtn = '<button type="button" class="btn btn-info" id="updateBtn">업체수정</button>';
    var updateOk = '<button type="button" class="btn btn-info" id="updateOk">수정완료</button>';
	var deleteBtn = '<button type="button" class="btn btn-default" id="deleteBtn">업체삭제</button>';
	var resetBtn = '<button type="reset" class="btn btn-default">다시입력</button>';
	var closeBtn = '<button type="button" class="btn btn-default" id="companyAdd_close_btn">취소</button>';

	var infoHiddenBox  = '<tr class="infoHidden">';
		infoHiddenBox += '	<th scope="row">거래시작일</th>';
		infoHiddenBox += '	<td><input type="text" name="startDate" class="boxTF articleHidden"></td>';
		infoHiddenBox += '</tr>'
		infoHiddenBox += '<tr class="infoHidden">';
		infoHiddenBox += '	<th scope="row">업체코드</th>';
		infoHiddenBox += '	<td><input type="text" name="companyCode" class="boxTF"></td>';
		infoHiddenBox += '</tr>';

		
	/*다이얼 로그*/
	$(function() {
		$("#companyAdd_btn").click(function() {
			$("#companyModel").dialog({
				title : "업체추가",
				width : 480,
				height : 470,
				modal : true,
				open : function() {
					$(".btnBox").empty();
					$(".btnBox").append(sendOk, resetBtn, closeBtn); 
					$("#companyAdd_close_btn").text("등록취소");
					
					$(".infoHidden").remove();
				}
			});
		});

		$("body").on("click", "#companyAdd_close_btn", function() {
			$("#companyModel").dialog("close");
		});
	});

	
	//업체 등록
	$(function() {
		$("body").on("click", "#sendOk", function() {
			var url = "<%=cp%>/company/created";

			$.ajax({
				type:"post",
				url:url,
				data:$("form[name=companyForm]").serialize(),
				dataType:"json",
				beforeSend:check,
				success:function(data){
					if(data.state=="true"){
						alert("업체 등록이 되었습니다.");
						formClean();
						location.href="<%=cp%>/company/list";
					}else{
						alert("업체 등록을 실패하였습니다.");	
					}
				},
				error:function(e){
					console.log(e.responseText);
				}
			});
		});
	});
	
	
	//글 정보 보기
	$(function(){
		$(".articleVeiw").click(function(){
			//다이얼로그
			$("#companyModel").dialog({
				title:"업체정보",
				width:480,
				height:570,
				modal:true,
				open:function(){
					var isHidden = $("input[name=companyCode]").val();
					if(!isHidden)
						$(".modalTable tbody").prepend(infoHiddenBox); 
					
					//버튼
					$(".btnBox").empty();
					$(".btnBox").append(updateBtn, deleteBtn, closeBtn); 
				},
				close:function(){	
					formClean();
					$("#companyModel input, #companyModel textarea").prop("disabled", false).removeClass("noLine");
				}
			});
	

			var num = $(this).attr("data-artileNum"); //업체 코드
			
			var url = "<%=cp%>/company/article";
			var query = "num="+num;
			
			$.ajax({
				type:"get",
				url:url,
				data:query,
				dataType:"json",
				success:function(data){
					if(data.state=="true"){						
						$("#companyModel input[name=companyCode]").val(data.dto.companyCode);
						$("#companyModel input[name=name]").val(data.dto.name);
						$("#companyModel input[name=tel1]").val(data.dto.tel1);
						$("#companyModel input[name=tel2]").val(data.dto.tel2);
						$("#companyModel input[name=tel3]").val(data.dto.tel3);
						$("#companyModel input[name=startDate]").val(data.dto.startDate);
						$("#companyModel textarea[name=memo]").val(data.dto.memo);
						
						$("#companyModel input, #companyModel textarea").prop("disabled", true).addClass("noLine");
						
					}else{
						alert("업체정보를 불러오지 못했습니다.");
					}
				},
				error:function(e){
					console.log(e.responseText);
				}
			});
			
		});
	});
	
	
	//업체 수정
	$(function(){
		$("body").on("click", "#updateBtn",function(){		
			$("#deleteBtn").remove();  
			$("#updateBtn").after(updateOk).remove(); 
			$(".noLine").not("input[name=startDate], input[name=companyCode]").prop("disabled", false).removeClass("noLine");
		});
		
		//업체 수정 완료
		$("body").on("click", "#updateOk",function(){	
			var url = "<%=cp%>/company/update";
			var query = $("form[name=companyForm]").serialize()+"&companyCode2="+$("#companyModel input[name=companyCode]").val();
			
			$.ajax({
				type:"post",
				url:url,
				data:query,
				dataType:"json",
				beforeSend:check,
				success:function(data){
					if(data.state=="true"){
						alert("업체 수정이 되었습니다.");
						formClean();
						location.reload();
					}else{
						alert("업체 수정을 실패하였습니다.");	
					}
				},
				error:function(e){
					console.log(e.responseText);
				}
			});
		});
	});
	
	//업체 삭제
	$(function(){
		$("body").on("click", "#deleteBtn", function(){
			if(confirm("업체를 삭제하시겠습니까?")){
				var url = "<%=cp%>/company/delete";
				var query = "companyCode="+$(".modalTable input[name=companyCode]").val();
				
				$.ajax({
					url:url,
					data:query,
					dataType:"json",
					success:function(data){
						if(data.state=="true"){
							alert("업체 삭제가 되었습니다.");
							formClean();
							location.reload();
						}else{
							alert("업체 삭제를 실패하였습니다.");	
						}
					},
					error:function(e){
						console.log(e.responseText);
					}
				});	
			}
		});
	});

	
	//검색
	function searchList(){
		 var f = document.searchForm;
		 f.action="<%=cp%>/company/list";
		 f.submit();
	}; 
	
	
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
			elementsName[i].value="";
		}
		
		$("#companyModel").dialog("close");
	}
	
	//연락처 숫자만
	$(function(){
		$(".boxTF.btfTel").keypress(function(){
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
				<col style="width:13%;">
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
						<td class="articleVeiw" data-artileNum="${dto.companyCode}"><a href="#">${dto.memo}</a></td>
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
					<button type="button" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/company/list';">새로고침</button>
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
						<button type="button" class="btn btn-default" onclick="searchList()">검색</button>
					</form>
				</td>
				<td align="right" width="100">
					<button type="button" id="companyAdd_btn" class="btn btn-info">업체추가</button>
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
				<th scope="row">연락처</th>
				<td>
					<input type="text" name="tel1" id="tel1" class="boxTF btfTel" maxlength="3" data-name="연락처를"> - <input type="text" name="tel2" class="boxTF btfTel" maxlength="4" data-name="연락처를"> - <input type="text" name="tel3" data-name="연락처를" class="boxTF btfTel" maxlength="4">
				</td>
			</tr>
			<tr> 
				<th scope="row">상세설명</th>
				<td><textarea name="memo" class="boxTA"  data-name="상세설명을"></textarea></td>
			</tr>
		</table>
		
		<div class="btnBox">
	        <button type="button" class="btn btn-info" id="sendOk">업체등록</button>
	        <button type="reset" class="btn btn-default">다시입력</button> 
	        <button type="button" class="btn btn-default" id="companyAdd_close_btn">등록취소</button>
	    </div>
	</form>
</div>
