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
	
	#space1 { letter-spacing:18.7px; margin-left: -25px;}
	#space2 { letter-spacing:10px; }
	#space3 { margin-left: 112px;}
	
	#btn1 {
		border-color: white;
		width: 310px;
 		height: 40px;
 		margin-left: 20px;
 		display :inline-block;
 		box-shadow: none;
		border:none;
		background-color: white;
	}
	#btn2 {
		border-color: white;
		background-color: white;
		box-shadow: none;
		border:none;
		background-color:transparent;
		padding-left: 30px;
	}
	#btn2:hover { text-decoration: underline;}
	#btn3 {
		border-color: white;
		background-color: white;
		box-shadow: none;
		border:none;
		background-color:transparent;
	}
	#btn3:hover { text-decoration: underline;}
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
	
	}
	#pwd {
		padding-left: 20px;
		margin-left: 50px;
	}
	
	#inid {margin-left: 200px;}
	
</style>
<article class="art1" style="width: 60%; margin: 10px auto;">
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
					<input type="text" name="id" id="inid" placeholder="아이디" 
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
				<td colspan="2">
					<label id="space3"><input type="checkbox" name="saveId" id="saveId"
								${ empty cookie.saveId ? "" : "checked" }>아이디 저장</label> 
					<br>
					
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
</article>
<article class="art2" style="width: 20%;">
</article>



</div>
 	</div>
</section>

<link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">
<jsp:include page="/views/common/footer.jsp" />
<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/sidebars.js"></script>
