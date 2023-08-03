<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />

<style>
	section #signin-container {
		text-align:center;
	}
	
	section #signin-container input {
		margin:3px ;
	}
	
	section #signin-container table {
		margin:0 auto;
	}
	
	section #signin-container table th {
		padding:0 10px; 
		text-align:right;
	}
	
	section #signin-container table td {
		padding:0 10px; 
		text-align:left;
	}
	
</style>

<section id="content">
	<div id="signin-container">
	<h2 align="center">로그인</h2>

<div class="login-container">
<c:if test="${ empty loginMember }">
	<form id="loginFrm" action="${ path }/login" method="post">
		<table>
			<tr>
				<td>
				<label> 아이디 : </label>
					<input type="text" name="userId" id="userId" placeholder="아이디" 
							value="${ cookie.saveId.value }" required>
				</td>
				<td></td>
			</tr>
			<tr>
				<td>
				<label>비밀번호 : </label>
					<input type="password" name="userPwd" id="userPwd" placeholder="비밀번호" required>
				</td>
				<td>
					<input type="button" value="로그인" >						
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<label><input type="checkbox" name="saveId"
								${ empty cookie.saveId ? "" : "checked" }>아이디 저장</label>
					<input type="button" value="회원가입" onclick="location.href = '${ path }/member/enroll';"> 
				</td>
			</tr>
			<tr>
				<td>
					<input type="button" value="아이디 찾기" onclick="location.href = '${ path }/member/findid'">
					<input type="button" value="비밀번호 찾기" onclick="location.href='${ path }/member/findpwd'">
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
				<button onclick="location.href='${ path }/logout'">로그아웃</button>						
			</td>
		</tr>
	</table>
</c:if>
</div>
 	</div>
</section>