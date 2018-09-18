<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<script>

 
$(function() {
	// 시간 추가
	$("#showDetail").on("click", ".addTime", function() {
		var spbut = $(this).parent().find("#showTimeList");
		var cnt = spbut.children().size();
	    if(cnt==5) {
		      alert("추가 가능한 시간 개수는 5개 입니다.");
		      return;
		}
	    
	    spbut.prepend("<input type='text' name='startTime' size='4' class='boxTF' placeholder='11:30'/>");
	    
	});
	
	// 날짜 추가 - 상영날짜 개수 : 종료날짜 - 시작날짜
	$("#showDetail").on("click", ".addDate", function() {
		var spbut = $(this).parent().parent().parent(); // table
		var cnt = spbut.children().size()-2; 			// 첫 행, 마지막 행 제외

	    var startDate = $("input[name='startDate']").val();
	    var endDate = $("input[name='endDate']").val();
	    var diff = getDiffDays(startDate, endDate);		// 날짜 추가 제한 개수
	    
	    if(cnt==diff) {
		      alert("추가 가능한 날짜 수는 (종료날짜 - 시작날짜)개 입니다.");
		      return;
		}

	    var htmlCode  = "<tr align='center' height='30em' style='border-bottom: 1px solid #cccccc;'>"; 
	    	htmlCode += "<td width='30%'><input name='screenDate' type='text' placeholder='2018-08-01' value='' size='15'</td>";
	        htmlCode += "<td width='70%' align='left' style='padding-left: 1em; padding-right: 1em;'>";
	        htmlCode += "<span id='showTimeList' style='text-align: left; margin-left: 15px;'>"; 
	        htmlCode += "<input type='text' name='startTime' size='4' class='boxTF' placeholder='11:30'></span> ";
		    htmlCode += "<button type='button' class='btn addTime'>+</button>";
		    htmlCode += "</td></tr>";
	    $(this).parent().parent().before(htmlCode);
	});
});
 
 
function facilityList(){	
	// 시작일, 종료일을 입력해야 공연장 검색이 가능
	var startDate = $("input[name='startDate']").val();
	var endDate = $("input[name='endDate']").val();
	if(!startDate || !endDate) {
		alert('시작일과 종료일을 입력 후 공연장 검색이 가능합니다.');
		return;
	}
	
	var url = '<%=cp%>/show/facilityList';
	var query = 'startDate=' + startDate + "&endDate=" + endDate;
	
	// ajax -> facilityList.jsp
	$.ajax({
		type:"get",
		url:url,
		data:query,
		success:function(data){
			if($.trim(data)=="error"){
				listPage(1);
				return;
			}
			$("#facilityList").html(data);
			$("#facilityModal").modal('show');
		},
		beforeSend:function(jqXHR){
			jqXHR.setRequestHeader("AJAX", true);
		},
		error:function(jqXHR){
			if(jqXHR.status==403){
				location.href="<%=cp%>/member/login";
				return;
			}
			console.log(jqXHR.responseText);
		}
	});
	
	
} 
</script>

<div>
<hr> 
	<div class="sub-title">
	<br><br><br>
	     <h3>상세 정보 </h3>
    </div>

	<form name="showDetail" method="post">
		<div>	
			<div class="form-group">
				<div class="col-sm-2">시작  ~ 종료</div>
				<div class="col-sm-4"><input name="startDate" type="text" placeholder="2018-08-01"  value="" size="15">
						 ~ <input name="endDate" type="text" placeholder="2018-08-31"  value="" size="15"></div> 
				<div class="col-sm-2">상영시간</div>
				<div class="col-sm-4"><input name="runningTime" type="text" placeholder="30(분)"  value="" size="10"></div>
			</div><br>
			<div class="form-group">
				<div class="col-sm-2">공연장소</div>
				<div class="col-sm-4" style="display: inline-block; height: 30px; width: 70%">
					<input type="text" name="facilityCode" placeholder="공연장을 검색하세요"> <!-- 시설코드 -->
					<button class="btn btn-default btn-info" type="button" onclick="facilityList();"><span class="glyphicon glyphicon-search"></span></button>
				</div>
			</div><br>
			<div class="form-group">
				<div class="col-sm-2">상영날짜</div>
				<div class="col-sm-10">
				
					<table  style="width: 100%; margin: 0px auto; border-spacing: 0px; border-collapse: collapse; border-top: 2px solid #005dab;">
						  <tr align="center" height="30em" style="border-bottom: 1px solid #cccccc;"> 
						      <td width="30%">상영 날짜</td>
						      <td width="70%" align="center" style="padding-left: 1em; padding-right: 1em;">시작시간</td>
						  </tr>						  
						  <tr align="center" height="30em" style="border-bottom: 1px solid #cccccc;"> 
						      <td width="30%"><input name="screenDate" type="text" placeholder="2018-08-01"  value="" size="15"></td>
						      <td width="70%" align="left" style="padding-left: 1em; padding-right: 1em;">
							      <span id="showTimeList" style="text-align: left; margin-left: 15px;">  
					                   <input type="text" name="startTime" size="4" class="boxTF" placeholder="11:30"/>
					              </span>
					              <button type="button" class="btn addTime">+</button>
						      </td>
						  </tr>
						  <tr align="center" height="30em" style="border-bottom: 1px solid #cccccc;"> 
						      <td width="30%"><button type="button" class="btn addDate">+</button></td>
						      <td width="70%" align="left" style="padding-left: 1em; padding-right: 1em;"></td>
						  </tr>
					</table>
				
				</div>
			</div><br>
		</div><br>
		<div align="center"><button class="btn btn-default btn-info" type="button" onclick="searchList()">등록</button></div>
	</form>

	<div id="facilityList"></div>

	<br><br>	
</div>

