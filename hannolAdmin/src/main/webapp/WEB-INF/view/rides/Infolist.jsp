<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style>
<%-- .gitf-form-control{
	background: url(<%=cp%>/resource/images/item_list.png) no-repeat right 2px;
}
.col-xs-8:after{
	content:''; display:block; clear:both;
}
.col-xs-offset-2{
	width: 40%;
}
.col-xs-8{
 	float: none;
 	margin: 10px auto;
} --%>

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
	var sendOk = '<button type="button" class="btn btn-info" id="sendOk">시설등록</button>';
	var resetBtn = '<button type="reset" class="btn btn-default">다시입력</button>';
	var closeBtn = '<button type="button" class="btn btn-default" id="ridesInfoAdd_close_btn">취소</button>';
	
		/*다이얼 로그*/
		$(function() {
			$("#ridesInfoAdd_btn").click(function() {
				$("#ridesInfoModel").dialog({
					title : "시설추가",
					width : 480,
					height : 300,
					modal : true,
					open : function() {
						$(".btnBox").empty();
						$(".btnBox").append(sendOk, resetBtn, closeBtn); 
						$("#ridesInfoAdd_close_btn").text("등록취소");
						$(".infoHidden").remove();
					}
				});
			});
			$("body").on("click", "#ridesInfoAdd_close_btn", function() {
				$("#ridesInfoModel").dialog("close");
			});
		});
 
 		//시설 등록
		$(function() {
			$("body").on("click", "#sendOk", function() {
				var url = "<%=cp%>/rides/ridesInfocreated";
				var test =  $("#name1 option:selected").val();
				var test1 = $("#state option:selected").val();
				var query = {"test":test, "test1":test1}
				
			$.ajax({
				type:"post",
				url:url,
				data:query,
				dataType:"json",
				success:function(data){
					if(data.equals("true")){
						alert(data);
						formClean();
						location.href="<%=cp%>/rides/Infolist";
							}else{
								alert("시설 등록을 실패하였습니다.");	
							}
						},
						error:function(e){
							console.log(e.responseText);
						}
				});
			});
		});
		
 
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

	function searchList() {
		var f=document.searchForm;
		f.submit();
	}
	
	function stateList(){
		var f=document.updateForm;
		f.submit()
	}
	//전체 체크박스
	function checkAll(){
		if($("#chkAll").is(':checked')){
			$("input[name=chk]").prop("checked",true);
		}else{
			$("input[name=chk]").prop("checked",false);
		}
	}

	//체크박스에서 체크한 값들
	function chkSingle(){
		$("input[name=chk]:checked").each(function(){
			var test = $(this).parent().next().next().next().next().next().next().next().text();
			//alert(test);
		});
	}
	
	$(function(){
		InfogetList(1);
	});
	
	function InfogetList(){
		var url = "<%=cp%>/rides/Infogetlist";
		var query = "page="+${page};
		
		$.ajax({
			type:"post"
			,url:url	//서버의 주소
			,data:query	//서버로 보내는 값
			,success:function(data){
				$("#listLayout").html(data);
			}
			,error:function(e){
				console.log(e.responseText);
				$("#resultLayout").html("갱신에러발생!");	
			}
		}); 
	}
	
	//ajax로 값들을 보낸다
	$(function(){
		 $("#btnSend").click(function(){
			 
			var selCode = $("#ridesInfo option:selected").attr("data-num");
			
			var lists = new Array();
			$("input[name='chk']:checked").each(function(i){   //jQuery로 for문 돌면서 check 된값 배열에 담는다
				lists.push($(this).parent().next().text());
				lists.push($(this).parent().next().next().next().text());
			});
		
			// check 된 애들의 개수
				var url="<%=cp%>/rides/Infoupdate";
				var num = $(this).parent().next();
				var num2 = $(this).parent().next().next().next();
				var query = {"selCode":selCode, "lists":lists};
				console.log(query);
	
				$.ajax({
					type:"POST",
					url:url,
					data:query,
					success:function(data){
						//$("#resultLayout").html("수정완료!");
						InfogetList();
					}
					,error:function(e){
						console.log(e.responseText);
						$("#resultLayout").html("에러발생!");	
					}
				}); 
		});
	});
	
	
</script>
<div class="sub-container" style="width: 960px;">

	 <div>
		<div id="listLayout"></div>
		
		<div id="resultLayout"></div>
		
			<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
				<tr height="40">
					<td align="left" width="100">
					    <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/rides/list';">돌아가기</button>
					    <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/rides/Infolist';">새로고침</button>
					</td>
					
					<td align="right" width="100">
						<button id="btnSend" type="button" class="btn btn-danger">상태변경</button>
						<button type="button" class="btn btn-info" id="ridesInfoAdd_btn">시설추가</button>					
					</td>
				</tr>
			</table>
    </div>
</div>
