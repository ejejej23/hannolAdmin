<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<style>
	.today{margin:30px 0; padding:10px; font-size:15px; font-weight:600; text-align:center; color:#666666; background-color:#fafafa; border:1px solid #efefef;}
	 
	/*searchBox*/
	.searchBox{margin:30px 0 50px 0;}  
	.searchBox:after{content:""; display:block; clear:both;} 
	.searchBox select{float:left; margin-right:5px; border:1px solid #ccc;} 
	.searchBox .input-group{float:left; width:570px;}  
 
	.col-xs-8{width:100%; padding: 0px; } 
	.select-menu{width:130px; padding:8px; border-radius:5px;} 
	
	
	/*list table*/
	.tableBox{margin-bottom:70px;}   
	.tableBox h4{margin-bottom:12px; margin-left:6px; font-size:16px; font-weight:600;}
	
	.table th,
	.table td{text-align:center;}     
	.table>tbody>tr>th,  
	.table>tbody>tr>td{height:45px; vertical-align:middle;}     
	.renBtn{padding:5px 9px; font-size:12px;} 
	
	td.rentWarning{font-weight:bold; color:#eb532f !important;}  
	   
	td.listData_no{text-align:center;}  
	
	
	
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
	
	/**modal**/
	.modalTable{width:100%; margin-top:20px; color:#444444;}
	.modalTable th,
	.modalTable td{padding:10px 0;} 
	.modalTable th{width:100px; padding-top:13px; padding-right:20px; text-align:right; vertical-align:top;}
	
	.boxTF,
	.boxTA,
	.modalTable .selectField{width:206px; vertical-align:middle;} 
	/*.boxTF[readonly]{background-color:#ffffff;}*/
	.boxTA[disabled]{background-color:#f3f3f3; padding:10px 15px;}
	.selectField{padding:6px; vertical-align:middle;}  
	.boxTF.tel,
	.selectField.tel{width:60px; text-align:center;}        
	
	.btnBox{margin:40px 0; text-align:center;}
	.btnBox .btn{margin:0 3px;}
	
	.modalTable input[type=radio]{margin:0 1px 0 15px; vertical-align:middle;}    
	.modalTable input[type=radio]:first-child{margin-left:0;}     
	 
	
	/*페이징 오류 테스트*/            
	.header a:active{line-height:inherit !important; border:0 none !important;}   
</style>   
 
<script>
	$(function(){
		statusPageList(1);
		reservationPageList(1);
		rentalOkListPage(1);
	});
	 
	
	//nav 클릭 이벤트
	$(function(){  
		$("body").on("click", ".nav-item", function(){
			$(".nav-item").removeClass("active");  
			$(this).addClass("active");  
			
			statusPageList(1);  
			reservationPageList(1);
			rentalOkListPage(1);     
		}); 
	});
	
	
	
	//리스트 뿌리기
	//대여 현황
	function statusPageList(page){  
		var query = "page="+page;
		
		//active되어있는 tab의 번호가져오기(편의시설 구분번호)
		var tab = "";
		$(".nav-item").each(function(){
			if($(this).hasClass("active")){
				tab = $(this).children(".nav-link").attr("data-tab");  
			}
		});
		
		//검색 
		var searchthema,
			searchKey,
			searchValue;      
		 
			searchthema= $("select[name=searchthema]").val(); //테마 코드
			searchKey = $("select[name=searchKey]").val(); //검색키  
			searchValue = $("input[name=searchValue]").val(); //검색값  
			
			query += "&tab="+tab+"&searchthema="+searchthema;   
		
			if(searchValue!="")
				query += "&searchKey="+searchKey+"&searchValue="+searchValue; 
		

		var url = "<%=cp%>/assets/assetsStatusList";
		
		$.ajax({ 
			type:"post",
			url:url,
			data:query, 
			success:function(data){ 
				$(".list-status").html(data);   
			},
			error:function(e){  
				console.log(e.responseText);
			} 
		});
	} 
	
	//대여 신청 목록
	function reservationPageList(page){  
		var query = "page="+page;
		  
		//active되어있는 tab의 번호가져오기(편의시설 구분번호)
		var tab = "";
		$(".nav-item").each(function(){
			if($(this).hasClass("active")){
				tab = $(this).children(".nav-link").attr("data-tab");  
			}
		});
		
		//검색 
		var searchthema,
			searchKey,
			searchValue;      
		 
			searchthema= $("select[name=searchthema]").val(); //테마 코드
			searchKey = $("select[name=searchKey]").val(); //검색키  
			searchValue = $("input[name=searchValue]").val(); //검색값  
			
			query += "&tab="+tab+"&searchthema="+searchthema;   
		
			if(searchValue!="")
				query += "&searchKey="+searchKey+"&searchValue="+searchValue; 
		
		var url = "<%=cp%>/assets/assetsReservationList";
		
		$.ajax({ 
			type:"post",
			url:url,
			data:query, 
			success:function(data){
				$(".list-reservation").html(data);  
			},
			error:function(e){
				console.log(e.responseText);
			} 
		});
	} 
	
	//대여 완료 리스트
	function rentalOkListPage(page){  
		var query = "page="+page;
		
		//active되어있는 tab의 번호가져오기(편의시설 구분번호)
		var tab = "";
		$(".nav-item").each(function(){
			if($(this).hasClass("active")){
				tab = $(this).children(".nav-link").attr("data-tab");  
			}
		});
		
		//검색 
		var searchthema,
			searchKey,
			searchValue;      
		 
			searchthema= $("select[name=searchthema]").val(); //테마 코드
			searchKey = $("select[name=searchKey]").val(); //검색키  
			searchValue = $("input[name=searchValue]").val(); //검색값  
			
			query += "&tab="+tab+"&searchthema="+searchthema;   
		
			if(searchValue!="")
				query += "&searchKey="+searchKey+"&searchValue="+searchValue; 
		
		
		var url = "<%=cp%>/assets/rentalOkList";
		
		$.ajax({ 
			type:"post",
			url:url,
			data:query, 
			success:function(data){ 
				$(".list-rentalOk").html(data);   
			},
			error:function(e){
				console.log(e.responseText);
			} 
		});
	}  
	 
	//검색
	function searchList(){
		statusPageList(1);
		reservationPageList(1);
		rentalOkListPage(1);     
	}  
</script>


<div class="sub-container">
	<div class="sub-title">
		<h3>대여/반납</h3>
	</div>

	<div class="sub_container">
		<div>
			<ul class="nav nav-tabs">
				<li class="nav-item active">  
					<a class="nav-link" data-tab="1">유모차</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-tab="2">휠체어</a>
				</li>
			</ul>
		</div>
		
		<div class="today">오늘날짜 : ${today}</div> 
		
		<div class="searchBox">
			<form name="searchForm" method="post">
				<div class="col-xs-8">
					<select name="searchthema" class="select-menu">
						<option value="0">전체테마</option>
						<c:forEach var="list" items="${themeList}"> 
							<option value="${list.THEMECODE}">${list.THEMENAME}</option>
						</c:forEach>
					</select>
					 
					<select id="searchKey" name="searchKey" class="select-menu">
						<option value="id">아이디</option>
						<option value="name">이름</option>
						<option value="tel">전화번호</option> 
					</select> 
					
					<div class="input-group">
						<input type="text" style="height: 34px;" class="form-control" name="searchValue" id="searchValue" placeholder="검색할 키워드를 입력해 주세요..." value="${searchValue}">
						<span class="input-group-btn">
							<button class="btn btn-default btn-info" type="button" onclick="searchList()">
								<span class="glyphicon glyphicon-search"></span>
							</button> 
						</span>
					</div>
				</div>
			</form>
		</div>
		
		<div>
			<div class="list-status"></div>
			<div class="list-reservation"></div> 
			<div class="list-rentalOk"></div>  
		</div>
	</div>
</div>




<!-- 모달창 -->
<div id="modal" class="modal">
	<form name="formData" method="post">
		<table class="modalTable">
			<tr>
				<th scope="row">입장권</th>
				<td>   
					<input type="text" name="ticketCode" class="boxTF" data-name="입장권을">
					<input type="button" id="searchTicket" class="btn btn-default" value="확인"/>  
				</td> 
			</tr>
			<tr>
				<th scope="row">시간</th>
				<td>   
					<input type="radio" id="afternoon" name="bookTime" value="0" checked="checked" disabled="disabled"> 오후
					<input type="radio" id="allDay" name="bookTime" value="1" disabled="disabled"> 종일 
				</td>
			</tr>
			<tr>
				<th scope="row">이름</th>
				<td>
					<input type="text" name="name" class="boxTF" data-name="이름을" disabled="disabled"> 
				</td>
			</tr>
			<tr>
				<th scope="row">연락처</th>
				<td>
					<select name="tel1" class="selectField tel" data-name="연락처를" disabled="disabled">
						<option value="010" selected="selected">010</option> 
						<option value="011">011</option>
						<option value="017">017</option>
						<option value="016">016</option>
						<option value="019">019</option>
					</select> - <input type="text" name="tel2" class="boxTF tel" maxlength="4" data-name="연락처를" disabled="disabled"> - <input type="text" name="tel3" class="boxTF tel" maxlength="4" data-name="연락처를" disabled="disabled">
				</td> 
			</tr>
		</table>
		
		<div class="btnBox">
	        <button type="button" class="btn btn-info" id="insertRent">현장등록</button>
	        <button type="reset" class="btn btn-default">다시입력</button> 
	        <button type="button" class="btn btn-default" id="modalCloseBtn">등록취소</button>
	    </div> 
	</form>
</div> 