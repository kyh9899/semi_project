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
				<label>성명 : </label> 
				<input type="text" name="member_name" class = "btn-name" id="userName" size="11" maxlength="11" placeholder = "이름">
			<br>
			</div>
			<div class = "find-phone">
				<label>번호 : </label>
				<input type="tel" onKeyup = "addHypen(this);" name="member_phone" id="phone" class = "btn-phone" size="12" maxlength="11" placeholder = "휴대폰번호 입력">
			</div>
			<br>
	</section>
	<div class ="btnSearch">
		<input type="button"  value="찾기"  onClick="">
		<input type="button"  value="취소" onClick="history.back()">
 	</div>
 </form>
		</c:if>
	</div>
	
	<script>
		function findUserId(event) {
			event.preventDefault(); 

			const userName = document.getElementById("userName").value;
			const phone = document.getElementById("phone").value;

			const data = {
				member_name: userName,
				member_phone: phone
			};

			fetch("/find_user", {
				method: "POST",
				headers: {
					"Content-Type": "application/json"
				},
				body: JSON.stringify(data)
			})
			.then(response => response.json())
			.then(data => {
				if (data.username) {
					alert("찾은 아이디: " + data.username);
				} else {
					alert("일치하는 사용자를 찾을 수 없습니다.");
				}
			})
			.catch(error => {
				console.error("오류 발생:", error);
			});
		}
	</script>
	
	
</body>
</html>