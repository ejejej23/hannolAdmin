<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String cp = request.getContextPath();
%>
<div style="display: none;" id="facilityModal" role="dialog" class="modal" tabindex="-1">
	<div class="modal-dialog" >
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">	
					<span aria-hidden="true">×</span>
				</button>
				<h4 class="modal-title" id="myModalLabel" style="font-weight: bold;">예약 가능한 시설 목록</h4>
			</div>
			<div class="modal-body" style="height: 400px;">
			
				<div>
					<div align="center" style="position: relative; float: left; width: 30%;">
						시설번호
					</div>
					<div align="center" style="position: relative; float: left; width: 30%">
						시설명
					</div>
					<div align="center" style="position: relative; float: left; width: 30%">
						&nbsp;
					</div>
				</div><br>
				<hr>
				<c:forEach items="${list}" var="dto">
					<div>
						<div align="center" style="position: relative; float: left; width: 30%;">
							${dto.FACILITYCODE}
						</div>
						<div align="center" style="position: relative; float: left; width: 30%">
							${dto.NAME}
						</div>
						<div align="center" style="position: relative; float: left; width: 30%">
							<button type="button" class="btn" data-facilityCode="${dto.FACILITYCODE}">선택</button>
						</div>
					</div>
				</c:forEach>
				
			</div>
		</div>
	</div>
</div>

