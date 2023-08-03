<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/views/common/header.jsp" />
	<div style="text-align: center;">

	<h4>아이디 찾기</h4>
	
		<c:if test="${ empty loginMember }">
		<form name="idfindscreen" method = "POST">
		<section class = "form-search">
			<div class = "find-name">
				<label>이름 : </label>
				<input type="text" name="member_name" class = "btn-name" size="6" maxlength="6" placeholder = "이름">
			<br>
			</div>
			<div class = "find-phone">
				<label>번호 : </label>
				<input type="text" onKeyup = "addHypen(this);" name="member_phone" class = "btn-phone" size="12" maxlength="11" placeholder = "휴대폰번호 입력">
			</div>
			<br>
	</section>
	<div class ="btnSearch">
		<input type="button" name="enter" value="찾기"  onClick="">
		<input type="button" name="cancle" value="취소" onClick="history.back()">
 	</div>
 </form>
		</c:if>
	</div>
</body>
</html>