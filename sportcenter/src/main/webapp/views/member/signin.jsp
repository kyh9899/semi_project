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
	
	#space1 { letter-spacing:18.7px; }
	#space2 { letter-spacing:10px; }
	
	#btn1 {
		border-color: white;
		width: 280px;
 		height: 30px;
 		margin-left: 20px;
 		display :inline-block;
 		box-shadow: none;
		border:none;
	}
	#btn2 {
		border-color: white;
		background-color: white;
		box-shadow: none;
		border:none;
	}
	#btn3 {
		border-color: white;
		background-color: white;
		box-shadow: none;
		border:none;
	}
	#signin-container {
		margin-top: 70px;
	}
	#loginFrm {
		margin-top: 50px;
		text-align: center;
	}
	#userPwd {
		margin-bottom: 50px;
	}
	#id {
		padding-left: 5px;
	}
	#pwd {
		padding-left: 3px;
	}
	td {
 	 margin-bottom: 10px;
	}
</style>
<section id="content">
	<div id="signin-container">
	<h1 align="center">로그인</h1>

<div class="signin-container">

<c:if test="${ empty loginMember }">


	<form id="loginFrm" action="${ path }/login" method="post">
	

		<table>
		
			<tr>
				<td id="id">
					<label><span id="space1">아이디</span>:</label>
					<input type="text" name="id" id="id" placeholder="아이디" 
							value="${ cookie.saveId.value }" required>
				</td>
			</tr>
			
			<tr>
				<td id="pwd">
				<label><span id="space2">비밀번호</span>:</label>
					<input type="password" name="pwd" id="pwd" placeholder="비밀번호" required>

				</td>
			</tr>
			<tr>
				<td colspan="2">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
					<label><input type="checkbox" name="saveId" id="saveId"
								${ empty cookie.saveId ? "" : "checked" }>아이디 저장</label> 
					<br>
					<%-- 
						<a href="#" onClick="alert('로그인 성공!!')">
					<button id="btn1" type="button" onclick="location.href='/sportcenter/views/introduce/intro_hello.jsp'">로그인</button>
					--%>
					<input id="btn1" type="submit" value="로그인" >
				</td>
			</tr>
       
			<tr>
				<td>  &nbsp; &nbsp; &nbsp; &nbsp;  
					<input id="btn2" type="button" value="아이디 찾기" onclick="location.href = '${ path }/member/findid'"> |
					<input id="btn3" type="button" value="비밀번호 찾기" onclick="location.href='${ path }/member/findpwd'">
				</td>
			</tr>
		</table>
	</form>
</c:if>




<%-- 
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
--%>
</div>
 	</div>
</section>
  <jsp:include page="/views/common/footer.jsp" /> 
