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

	<h4>비밀번호 찾기</h4>
	
	<form name="pwfindscreen" method = "POST">
			<div class = "search-title">
			</div>
		<section class = "form-search">
			<div class = "find-id">
				<label>아이디 : </label>
				<input type="text" name="member_mid" class = "btn-name" placeholder = "아이디 입력">
			<br>
			</div>
		
		 <div class = "find-phone">
				<label>번호 :  &nbsp;</label>
				<input type="text" onKeyup = "addHypen(this);" name="member_phone" class = "btn-phone" placeholder = "휴대폰번호 입력">
			</div> 
			<br>
	</section>
	<div class ="btnSearch">
		<input type="button" name="enter" value="찾기"  onClick="pw_search()">
		<input type="button" name="cancle" value="취소" onClick="history.back()">
 	</div>
 </form>
</div>
</body>
</html>