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
				<div class="col-sm-4"><input name="showName" type="text" placeholder="30(분)"  value="" size="10"></div>
			</div><br>
			<div class="form-group">
				<div class="col-sm-2">공연장소</div>
				<div class="col-sm-4" style="display: inline-block; height: 30px; width: 70%">
					<input type="text" 
						name="searchValue" placeholder="공연장을 검색하세요">
					<button class="btn btn-default btn-info" type="button" onclick="searchList()"><span class="glyphicon glyphicon-search"></span></button>
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
						      <td width="30%"><input name="showName" type="text" placeholder="2018-08-01"  value="" size="15"></td>
						      <td width="70%" align="left" style="padding-left: 1em; padding-right: 1em;">
							      <span id="showTime" style="text-align: left; margin-left: 15px;">  
					                   <input type="text" name="showTime" size="4" class="boxTF" placeholder="11:30"/>
					              </span>
					              <button type="button" class="btn" onclick="" style="height: 80%">+</button>
						      </td>
						  </tr>
						  <tr align="center" height="30em" style="border-bottom: 1px solid #cccccc;"> 
						      <td width="30%"><button type="button" class="btn" onclick="" style="height: 80%">+</button></td>
						      <td width="70%" align="left" style="padding-left: 1em; padding-right: 1em;"></td>
						  </tr>
					</table>
				
				</div>
			</div><br>
		</div><br>
		<div align="center"><button class="btn btn-default btn-info" type="button" onclick="searchList()">등록</button></div>
	</form>	
	<br><br>	
</div>

