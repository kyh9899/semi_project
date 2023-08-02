<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ path }/resources/css/style.css">
<script src="${ path }/resources/js/jquery-3.7.0.js"></script>
</head>
<body>
	<header>
		<h1>스포츠 센터(Semi-Project)</h1>
		<div class="login-container">
			<c:if test="${ empty loginMember }">
				<form id="loginFrm" action="${ path }/login" method="post">
					<table>
						<tr>
							<td>
								<input type="text" name="userId" id="userId" placeholder="아이디" 
										value="${ cookie.saveId.value }" required>
							</td>
							<td></td>
						</tr>
						<tr>
							<td>
								<input type="password" name="userPwd" id="userPwd" placeholder="비밀번호" required>
							</td>
							<td>
								<input type="submit" value="로그인">						
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<label><input type="checkbox" name="saveId"
											${ empty cookie.saveId ? "" : "checked" }>아이디 저장</label>
								<input type="button" value="회원가입" onclick="location.href = '${ path }/member/enroll';"> 
							</td>
						</tr>
					</table>
				</form>
			</c:if>
			<c:if test="${ not empty loginMember }">
				<table>
					<tr>
						<td colspan="2">
							${ loginMember.name }님 안녕하세요.
						</td>
					</tr>
					<tr>
						<td>
							<button onclick="location.href='${ path }/member/myPage'">내 정보</button>
						</td>
						<td>
							<button onclick="location.replace('${ path }/logout')">로그아웃</button>						
						</td>
					</tr>
				</table>
			</c:if>
		</div>
		<nav>
			<ul class="main-nav">
				<li class="home"><a href="${ path }/">센터 소개</a></li>
				<li id="program"><a href="${ path }/board/list">프로그램 안내</a></li>
				<c:if test="${ not empty loginMember && loginMember.role == 'ROLE_ADMIN'}">
					<li id="admin-member">
						<a href="${ path }/admin/members">회원관리</a>
					</li>
				</c:if>
				<li class="application"><a>수강 신청</a></li>
				<li class="customerService"><a>고객센터</a></li>
				<li class="myPage"><a>마이페이지</a></li>
				
			</ul>
		</nav>
	</header> 