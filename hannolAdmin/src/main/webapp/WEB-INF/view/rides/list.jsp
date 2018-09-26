<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String cp=request.getContextPath();
%>
<style>
.gitf-form-control{
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
}
</style>

<script type="text/javascript">
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
		getList(1);
	});
	
	function getList(){
		var url = "<%=cp%>/rides/getlist";
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
			});
			// check 된 애들의 개수
				var url="<%=cp%>/rides/update";
				var num = $(this).parent().next();
				var query = {"selCode":selCode, "lists":lists};
				console.log(query);
	
				$.ajax({
					type:"POST",
					url:url,
					data:query,
					success:function(data){
						//$("#resultLayout").html("수정완료!");
						getList();
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
					    <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/rides/list';">새로고침</button>
					</td>
					
					<td align="right" width="100">
						<button id="btnSend" type="button" class="btn1">상태변경</button>
					</td>
				</tr>
			</table>
    </div>
</div>   