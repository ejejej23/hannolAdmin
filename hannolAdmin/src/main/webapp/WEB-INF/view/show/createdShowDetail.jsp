<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
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
				<div class="col-sm-4"><input name="showName" type="text" placeholder="2018-08-01"  value="" size="15">
						 ~ <input name="showName" type="text" placeholder="2018-08-31"  value="" size="15"></div> 
				<div class="col-sm-2">상영시간</div>
				<div class="col-sm-4"><input name="showName" type="text" placeholder="상영시간(분)"  value="" size="10"></div>
			</div><br>
			<div class="form-group">
				<div class="col-sm-2">공연장소</div>
				<div class="col-sm-4"><mark>${dto.name}</mark></div>
				<div class="col-sm-2">시작시간</div>
				<div class="col-sm-4">
					<mark>
					
					</mark>
				</div>
			</div><br>
		</div><br>
	</form>	
		
</div>

