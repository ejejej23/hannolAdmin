<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>

<style>
.thumbnail> a> img{
 	margin-bottom: 5%;
}

.giftList:after{
	content:''; display:block; clear:both;
}
.itemTitle{
	display: block;
	margin: 10px 0px;
}

.itemPrice{
	font-weight: 900;
	font-size: 14px;
}

.input-lg{
	height: 35px;
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

.itemSelect{
	min-width : 120px;
	width:30%;
    margin-bottom: 10px;
    float: right;
}

.giftSelect:after {
	content:''; display:block; clear:both;
}

.giftSelect{
	padding: 0px 15px;
	margin-top: 10px;
}

.gitf-form-control{
	background: url(<%=cp%>/resource/images/item_list.png) no-repeat right 2px;
}

select{
    -webkit-appearance: none;
    appearance: none;
}

.nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover{
	background-color: #337ab7;
	color: #ffffff;
}

select::-ms-expand {   display: none; }

.body-title h3{
	margin-bottom: 0px;
}
</style>

<script type="text/javascript">

</script>


<div class="bodyFrame2">
    <div class="body-title">
          <h3><span class="glyphicon glyphicon-gift"></span> 기프트샵 </h3>
    </div>
    
    <div>
		<ul class="nav nav-tabs">
		<li class="nav-item active">
		    <a class="nav-link active" href="#">전체</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#">프린세스빌리지</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#">라이언킹</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="#">미니언즈</a>
		  </li>
		   <li class="nav-item">
		    <a class="nav-link" href="#">토이스토리</a>
		  </li>
		   <li class="nav-item">
		    <a class="nav-link" href="#">니모</a>
		  </li>
		</ul>
				
    </div>
    
    
    <div class="giftList">
    	<div class="giftSelect">
	    	<div class="itemSelect"> 
	    		<select class="form-control gitf-form-control">
	    			<option>↑↓정렬</option>
	    			<option>가격낮은순</option> 
	    			<option>가격높은순</option> 
	    			<option>인기상품순</option> 
	    			<option>신상품순</option> 
	    		</select>
	    	</div>
    	</div>    
    
    	<div style="width: 100%">
		    <div class="col-lg-4">
		      <div class="thumbnail">
		        <a href="<%=cp%>/giftshop/article">
		           <img src="<%=cp %>/resource/images/kingbob.jpg" alt="Lights" style="width:100%">
		           <span class="itemTitle">한놀 마스코트 볼펜</span>
		        </a>
		        <div class="itemPrice">30,000원</div>
		      </div>
		    </div>
		</div>
		
		<div style="width: 100%">
		    <div class="col-lg-4">
		      <div class="thumbnail">
		        <a href="#">
		           <img src="<%=cp %>/resource/images/kingbob.jpg" alt="Lights" style="width:100%">
		           <span class="itemTitle">한놀 마스코트 볼펜</span>
		        </a>
		        <div class="itemPrice">30,000원</div>
		      </div>
		    </div>
		</div>
		
		<div style="width: 100%">
		    <div class="col-lg-4">
		      <div class="thumbnail">
		        <a href="#">
		           <img src="<%=cp %>/resource/images/kingbob.jpg" alt="Lights" style="width:100%">
		           <span class="itemTitle">한놀 마스코트 볼펜</span>
		        </a>
		        <div class="itemPrice">30,000원</div>
		      </div>
		    </div>
		</div>
		
		<div style="width: 100%">
		    <div class="col-lg-4">
		      <div class="thumbnail">
		        <a href="#">
		           <img src="<%=cp %>/resource/images/kingbob.jpg" alt="Lights" style="width:100%">
		           <span class="itemTitle">한놀 마스코트 볼펜</span>
		        </a>
		        <div class="itemPrice">30,000원</div>
		      </div>
		    </div>
		</div>
    </div>  
    
    <div style="width: 100%; text-align: center;">123</div>
    
    
        
    <div class="col-xs-8 col-xs-offset-2">
  		<div class="input-group">
            <input type="hidden" name="search_param" value="all" id="search_param">         
            <input type="text" class="form-control" name="x" placeholder="검색할 키워드를 입력해 주세요...">
            <span class="input-group-btn">
                <button class="btn btn-default btn-info" type="button"><span class="glyphicon glyphicon-search"></span></button>
            </span>
        </div>
    </div>
</div>



