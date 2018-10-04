<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String cp = request.getContextPath();
%>
<style type="text/css">
.note{
	border: 1px solid #e1e1e1;
    background: #f8f8f8;
    padding: 5px;
    margin: 20px;
    width: 100px;
    height: 100px;
    float: left;
    text-align: center;
    font-size: 13px;
}
.note:hover{
	box-shadow: 
        10px 10px 20px rgba(0,0,0,.2);

}
.glyphicon{
	padding: 15px;
	font-size: 30px;
}
</style>

<div class="body-container" style="width: 700px;">
    <div>
        <ul>
        	<li><div class="note" style="cursor: pointer;" onclick="location.href='<%=cp %>/notice/list'"><div class="glyphicon glyphicon-volume-down" aria-hidden="true"></div><div>사용자 공지</div></div></li>
        	<li><div class="note" style="cursor: pointer;" onclick="location.href='<%=cp %>/noticeS/list'"><div class="glyphicon glyphicon-volume-up" aria-hidden="true"></div><div>사내 공지</div></div></li>
        	<li><div class="note" style="cursor: pointer;" onclick="location.href='<%=cp%>/finance/main'"><div class="glyphicon glyphicon-usd" aria-hidden="true"></div><div>재정 통계표</div></div></li>
        	<li><div class="note" style="cursor: pointer;" onclick="location.href='<%=cp %>/ticket/list'"><div class="glyphicon glyphicon-envelope" aria-hidden="true"></div><div>이용권 관리</div></div></li>
        	<li><div class="note" style="cursor: pointer;" onclick="location.href='<%=cp %>/reservation/list'"><div class="glyphicon glyphicon-book" aria-hidden="true"></div><div>예약 관리</div></div></li>
        	
        	<li><div class="note" style="cursor: pointer;" onclick="location.href='<%=cp %>/coupon/list'"><div class="glyphicon glyphicon-inbox" aria-hidden="true"></div><div>쿠폰 발송</div></div></li>
        	<li><div class="note" style="cursor: pointer;" onclick="location.href='<%=cp %>/staff/list'"><div class="glyphicon glyphicon-user" aria-hidden="true"></div><div>인사정보관리</div></div></li>
        	<li><div class="note" style="cursor: pointer;" onclick="location.href='<%=cp %>/career/list'"><div class="glyphicon glyphicon-education" aria-hidden="true"></div><div>발령관리</div></div></li>
        	<li><div class="note" style="cursor: pointer;" onclick="location.href='<%=cp %>/guide/list'"><div class="glyphicon glyphicon-calendar" aria-hidden="true"></div><div>가이드</div></div></li>
        	<li><div class="note" style="cursor: pointer;" onclick="location.href='<%=cp %>/show/list'"><div class="glyphicon glyphicon-film" aria-hidden="true"></div><div>공연</div></div></li>
        	
        	<li><div class="note" style="cursor: pointer;" onclick="location.href='<%=cp %>/event/list'"><div class="glyphicon glyphicon-bookmark" aria-hidden="true"></div><div>이벤트</div></div></li>
        	<li><div class="note" style="cursor: pointer;" onclick="location.href='<%=cp %>/rides/main'"><div class="glyphicon glyphicon-stats" aria-hidden="true"></div><div>놀이기구 통계</div></div></li>
        	<li><div class="note" style="cursor: pointer;" onclick="location.href='<%=cp %>/state/list'"><div class="glyphicon glyphicon-alert" aria-hidden="true"></div><div>놀이기구 상태</div></div></li>
        	<li><div class="note" style="cursor: pointer;" onclick="location.href='<%=cp %>/assets/list'"><div class="glyphicon glyphicon-tag" aria-hidden="true"></div><div>대여/반납</div></div></li>
        	<li><div class="note" style="cursor: pointer;" onclick="location.href='<%=cp %>/amenity/storage'"><div class="glyphicon glyphicon-lock" aria-hidden="true"></div><div>보관</div></div></li>
        	
        	<li><div class="note" style="cursor: pointer;" onclick="location.href='<%=cp %>/repair/list'"><div class="glyphicon glyphicon-wrench" aria-hidden="true"></div><div>수리</div></div></li>
        	<li><div class="note" style="cursor: pointer;" onclick="location.href='<%=cp %>/inspection/list'"><div class="glyphicon glyphicon-search" aria-hidden="true"></div><div>점검</div></div></li>
        	<li><div class="note" style="cursor: pointer;" onclick="location.href='<%=cp %>/giftshop/list'"><div class="glyphicon glyphicon-tasks" aria-hidden="true"></div><div>품목관리</div></div></li>
        	<li><div class="note" style="cursor: pointer;" onclick="location.href='<%=cp %>/goodsIn/list'"><div class="glyphicon glyphicon-import" aria-hidden="true"></div><div>입고관리</div></div></li>
        	<li><div class="note" style="cursor: pointer;" onclick="location.href='<%=cp %>/goodsOut/list'"><div class="glyphicon glyphicon-export" aria-hidden="true"></div><div>출고관리</div></div></li>
        </ul>
    </div>
</div>