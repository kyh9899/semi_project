<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
	h1 {
	  text-align: center;
	}
	  
	#root {
	  font-size:30px;
	  color: gray;
	  text-align: center;
	}
	  
	#root > strong{
		color : black;
	}
	
	#p1 {
		text-align: center;
		font-size: 2.5em;
	}
	
	#button {
		margin-top: 80px;
		display: flex;
      	justify-content: center;
	}
	
	#containers {
		 background-color: #DFEAF7;
		 width: 100%;
		 height: 100vh; 
	}
</style>

<article class="art1" style="width: 60%;"> 
<div id="containers">
	<h1>회원가입</h1>
 	<br><br>
 	<p id="root">01약관동의 ➝ 02본인인증 ➝ 03정보입력 ➝ <strong>04가입완료</strong></p>
 	<br><br>
 	<p id="p1">${ name } 님의 회원가입을<br>환영합니다!</p>
 	
 	<div id="button">
 		<button type="button" class="btn btn-outline-primary me-2" onclick="location.href='${ path }/login'">로그인</button>
 		<button type="button" class="btn btn-primary" onclick="location.href='${ path }'">메인으로</button>
 	</div>
</div>

<article class="art2" style="width: 20%;" >
</article>

<link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">
<jsp:include page="/views/common/footer.jsp" />
<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/sidebars.js"></script>