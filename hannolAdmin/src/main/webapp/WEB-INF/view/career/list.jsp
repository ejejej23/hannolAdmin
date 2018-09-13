<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script type="text/javascript">

$(function() {
	 $(document).on("click","button[name=infoBtn]",function(){
		
		var usersCode = $(this).closest("tr").children().eq(1).text();
		var careerCode = $(this).closest("tr").children().eq(3).text();
	 	var query = "page="+${page}+"&usersCode="+usersCode+"&careerCode="+careerCode;
	 	
		var url = "<%=cp%>/career/info?"+query;
	 	
	 	location.href = url;
	}); 

});
function searchList(){
	var usersCode = $("#searchValue").val();
	
	var url = "<%=cp%>/career/getlist";
	var query = "page="+${page}+"&usersCode="+usersCode;
	
	$.ajax({
		type:"post"
		,url:url	//서버의 주소
		,data:query	//서버로 보내는 값
		,success:function(data){
			$("#listLayout").html(data);
			$("#codeLayout").html("사원번호 : "+usersCode);
		}
		,error:function(e){
			console.log(e.responseText);
			$("#resultLayout").html("갱신에러발생@!!!");	
		}
	}); 
}
</script>
<div class="sub-container" style="width: 960px;">
    
    <div class="sub-title">
	  <h3>직원 발령 <small>이력관리</small></h3>
	</div> 
    
    <div>
  		<form name="searchForm" method="post" action="<%=cp%>/notice/list">
          	<div class="col-xs-8 col-xs-offset-2">
			  		<div class="input-group">
			            <input type="hidden" name="searchKey" value="all">         
			            <input type="text" class="form-control" name="searchValue" id="searchValue" placeholder="검색할 직원의 사번을 입력해 주세요...">
			            <span class="input-group-btn">
			                <button class="btn btn-default btn-info" type="button" onclick="searchList()"><span class="glyphicon glyphicon-search"></span></button>
			            </span>
			        </div>
			</div>
		</form>
  	</div>
    
    
    
    
    <div>

		<div id="codeLayout"></div>
		<div id="listLayout"></div>
		
		<div id="resultLayout"></div>

    </div>
</div>