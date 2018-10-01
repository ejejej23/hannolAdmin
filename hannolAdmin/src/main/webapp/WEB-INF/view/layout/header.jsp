<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   String cp = request.getContextPath();
%>
<div class="header-top">
    <div style="width: 960px; height: 120px; margin-top: 20px;" align="center">
        <div style="margin: 2px;">
            <a href="<%=cp%>/" style="text-decoration: none;">
        		<img width="180px" height="120px" src="<%=cp%>/resource/images/logo.jpg">            
            </a>
        </div>
    </div>
    
    <div style="width: 960px; height: 20px;" >
        <div align="right">
            <c:if test="${empty sessionScope.staff}">
                <a  href="<%=cp%>/staff/login">로그인</a>
                    &nbsp;|&nbsp;
                <a href="<%=cp%>/staff/staff">회원가입</a>
            </c:if>
            <c:if test="${not empty sessionScope.staff}">
                <span style="color:black; font-weight: bold;">${sessionScope.staff.staffName}</span>님
                &nbsp;|&nbsp;
                <a href="<%=cp%>/staff/logout">로그아웃</a>
                &nbsp;|&nbsp;
                <a href="<%=cp%>/">마이페이지</a>
            </c:if>
        </div>
    </div>
</div>

<div class="menu">
   	<p class="menu_icon"><a href="#"><span>▦</span></a></p>
   	
    <ul class="navMenu">
    	<li>
            <span class="dep1">공지사항</span>
            <ul>
                <li><a href="<%=cp %>/notice/list">사용자 공지</a></li>
                <li><a href="<%=cp %>/noticeS/list">사내 공지</a></li>
            </ul>
        </li>
    
    	<li>
            <span class="dep1">재정관리</span>
            <ul>
                <li><a href="<%=cp%>/finance/main">재정통계표</a></li>
                <li><a href="<%=cp%>/finance/profit">매출</a></li>
                <li><a href="<%=cp%>/finance/loss">지출</a></li>
                <li><a href="<%=cp%>/budget/list">예산</a></li>
                <li><a href="#">현장 매출 등록</a></li>
            </ul>
        </li>
        
        <li>
            <span class="dep1">시스템 관리</span>
            <ul>
                <li><a href="<%=cp%>/ticket/list">이용권 관리</a></li>
                <li><a href="<%=cp%>/card/list">할인카드 관리</a></li>
                <li><a href="#">이용객 현황 관리</a></li>
                <li><a href="<%=cp%>/payment/list">구매 관리</a></li>
                <li><a href="<%=cp%>/reservation/list">예약 관리</a></li>
                <li><a href="<%=cp%>/magicpass/list">매직패스 예약관리</a></li>
            </ul>
        </li>
        
        <li>
            <span class="dep1">사용자 관리</span>
            <ul>
                <li><a href="<%=cp%>/coupon/list">쿠폰 발송</a></li>
                <li><a href="#">등급 관리</a></li>
                <li><a href="<%=cp%>/member/list">회원리스트</a></li>                
            </ul>
        </li>
        
        <li>
            <span class="dep1">직원 관리</span>
            <ul>
                <li><a href="<%=cp%>/staff/list">인사정보 관리</a></li>
                <li><a href="<%=cp%>/career/list">발령 관리</a></li>
            </ul>
        </li>
        
        <li>
            <span class="dep1">고객소리함</span>
            <ul>
                <li><a href="#">FAQ</a></li>
                <li><a href="#">1:1 문의</a></li>
                <li><a href="#">후기</a></li>
            </ul>
        </li>
        
        <li class="mr0">
            <span class="dep1">스케쥴</span>
            <ul>
                <li><a href="<%=cp%>/guide/list">가이드</a></li>
                <li><a href="<%=cp%>/show/list">공연</a></li>
                <li><a href="#">이벤트</a></li>
            </ul>
        </li>
        
        <li>
            <span class="dep1">시설</span>
            <ul>
                <li><a href="<%=cp%>/facility/list">관리</a></li>
            </ul>
        </li>
        
        <li>
            <span class="dep1">놀이기구</span>
            <ul>
                <li><a href="#">통계</a></li>
                <li><a href="<%=cp%>/state/list">상태</a></li>
                <li><a href="<%=cp%>/rides/list">정보</a></li>
            </ul>
        </li>

        <li>
            <span class="dep1">편의시설</span>
            <ul>
                <li><a href="#">대여/반납</a></li>
                <li><a href="<%=cp %>/amenity/storage">보관</a></li>
            </ul>
        </li>
        
        <li>
            <span class="dep1">정비</span>
            <ul>
                <li><a href="<%=cp%>/repair/list">수리</a></li>
                <li><a href="<%=cp%>/inspection/list">점검</a></li>  
            </ul>
        </li>

        <li>
            <span class="dep1">기프트샵</span>
            <ul>
                <li><a href="<%=cp%>/giftshop/list">품목관리</a></li>
                <li><a href="<%=cp%>/goodsIn/list">입고관리</a></li>
                <li><a href="<%=cp%>/goodsOut/list">출고관리</a></li>
                <li><a href="<%=cp%>/magam/list">마감</a></li>
                <li><a href="#">구매내역</a></li>
            </ul>
        </li>
        
        <li>
            <span class="dep1">업체 관리</span>
            <ul>
                <li><a href="<%=cp%>/company/list">업체 정보</a></li>
                <li><a href="#">거래 내역</a></li>
            </ul>
        </li>
        <li style="width: 30%; float: right;">
    		<a href="#"><img style="width: 100%;" src ="<%=cp%>/resource/images/park.JPG"></a>  
    	</li>  
    </ul>  
</div>
