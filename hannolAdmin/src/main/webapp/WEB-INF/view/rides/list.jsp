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
	
	
	//선택박스에서 선택한 값들
/* 	function selectSt(){
		var selection = $("#ridesInfo option:selected").text();
		//alert(selection);
	} */
/* 	
	if(test!=null){
		//alert(test);
		$("input[name=chk]:checked.val()")=$("select[name=ridesInfo].val()");
	} */
	
	//체크박스에서 체크한 값들
	function chkSingle(){
		$("input[name=chk]:checked").each(function(){
			var test = $(this).parent().next().next().next().next().next().next().next().text();
			//alert(test);
			
		});
	}
	
/* 	//체크된 여부
	if(test.length==0){
		//alert("변경될 부분을 체크하세요");
		//return;
	} */
	 
	//체크된 값들을 배열에 담는다
/* 	var lists=[];
	$("input[name=chk]:checked").each(function(i){
		var test = $(this).parent().next().next().next().next().next().next().next().text();
		lists.push($(this).test);
	}
	 */
	 
/* 	 var lists = [];
	  $("input[name='confirm']:checked").each(function(i){   //jQuery로 for문 돌면서 check 된값 배열에 담는다
	   lists.push($(this).val());
	  });
	  data:{'confirm':lists},
	  var allData = { "userId": userId, "checkArray": checkboxValues };
					{"selection":selection, "lists":lists}

*/
	//ajax로 값들을 보낸다
	$(function(){
		 $("#btnSend").click(function(){
			 
			var selection = $("#ridesInfo option:selected").text();
			
			var lists = new Array();
			$("input[name='chk']:checked").each(function(i){   //jQuery로 for문 돌면서 check 된값 배열에 담는다
				lists.push($(this).parent().next().text());
			});
			
			// check 된 애들의 개수
				var url="<%=cp%>/rides/update";
				var num = $(this).parent().next();

				var query = {"selection":selection, "lists":lists};
				console.log(query);
	
				$.ajax({
					type:"POST",
					url:url,
					dataType:"json",
					data:query,
					success:function(data){
						$("#resultLayout").html("수정완료!");
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
     <div class="body-title">
        <h3><span style="font-family: Webdings">2</span> 어트랙션 정보 <span style="font-size:15px;">${dataCount}개(${page}/${total_page} 페이지)</span> </h3>
    </div>  
    
    <div>
    <select class="selectField" id="ridesInfo" name="ridesInfo">
		<option value="">::상태선택::</option>
		<option value="open">open</option>
		<option value="close">close</option>
		<option value="우천">우천</option>
		<option value="고장">고장</option>
		<option value="수리중">수리중</option>
	</select>
		<table class="table">
		    <colgroup>
		        <col style="width: 10%; text-align:center">
		        <col style="width: 10%; text-align:center">
		        <col style="width: 10%; text-align:center">
		        <col style="width: 10%; text-align:center">
		        <col style="width: 10%; text-align:center">
		        <col style="width: 10%; text-align:center">
		        <col style="width: 10%; text-align:center">
		        <col style="width: 10%; text-align:center">
		        <col style="width: 10%; text-align:center">
		    </colgroup>
    
		  <thead class="thead-light">
		    <tr>
		      <th scope="col">
				  <input type="checkbox" name="chkAll" id="chkAll" value="chkAll" onclick="checkAll();">
		      </th>
		      <th scope="col">시설번호</th>
		      <th scope="col">테마</th>
		      <th scope="col">장르</th>
		      <th scope="col">어트랙션명</th>
		      <th scope="col">설치날짜</th>
		      <th scope="col">제거날짜</th>
		      <th scope="col">상태</th>
		      <th scope="col">상세</th>
		    </tr>
		  </thead>
		  
		  <tbody>
			<c:forEach var="vo" items="${list}">
				<tr>
					<th scope="row">
						<input type="checkbox" name="chk" value="chk" onclick="chkSingle();">
					</th>
						<td>${vo.facilityCode}</td>
						<td>${vo.themeName}</td>
						<td>${vo.genreName}</td>
						<td>${vo.name}</td>
						<td>${vo.installDate}</td>
						<td class="st">${vo.removeDate}</td>
						<td>${vo.gubunName}</td>
						<td>
							<c:choose>
								<c:when test="${vo.state==0}">
									요청
								</c:when>
								<c:when test="${vo.state==1}">
									요청확인
								</c:when>
								<c:when test="${vo.state==2}">
									수리중
								</c:when>
								<c:when test="${vo.state==3}">
									수리완료
								</c:when>
							</c:choose>
						</td>
				</tr>
			</c:forEach>
			
		  </tbody>
		  
		</table>
		
		
		<table style="width: 100%; margin: 0px auto; border-spacing: 0px;">
		   <tr height="35">
			<td align="center">
			        <c:if test="${dataCount==0 }">등록된 게시물이 없습니다.</c:if>
			        <c:if test="${dataCount!=0 }">${paging}</c:if>
			 </td>
		   </tr>
		</table>
		
		<table style="width: 100%; margin: 10px auto; border-spacing: 0px;">
		   <tr height="40">
		      <td align="left" width="100">
		          <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/rides/list';">새로고침</button>
		      </td>

		      <td align="right" width="100">
	 	          <button id="btnSend" type="button" class="btn1">변경하기</button>
		          <button type="button" class="btn" onclick="javascript:location.href='<%=cp%>/rides/created';">추가하기</button>
		      </td>
		   </tr>
		</table>
		 <div>


		<div id="listLayout"></div>
		
		<div id="resultLayout"></div>


    </div>
    </div>

</div>   