<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<script>
$(function(){
	
	//탭선택 EVENT
	$(".nav-link").click(function(){
		$('.nav-item').removeClass('active');
		$(this).parent(".nav-item").addClass("active");
	});
	
});

</script>


<div class="sub-container" style="width: 960px;">
    <div class="sub-title">
	  <h3>예약관리</h3>
	</div> 
	
	<div>
		<ul class="nav nav-tabs">
		  <li class="nav-item active">
		    <a class="nav-link">무대공연</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link">편의시설</a>
		  </li>
		</ul>
    </div>
    
    <div>
        내용...
    </div>
</div>