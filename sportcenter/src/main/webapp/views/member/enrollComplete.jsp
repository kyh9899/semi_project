<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');

	h1 {
	  text-align: center;
	}
	  
	#root {
	  font-size:30px;
	  color: lightgray;
	  text-align: center;
	}
	  
	#root > strong{
		color : black;
	}
</style>
<jsp:include page="/views/common/header.jsp" />
<body>
<div id="container">
	<h1>회원가입</h1>
 	<br><br>
 	<p id="root">01약관동의 ➝ 02본인인증 ➝ 03정보입력 ➝ <strong>04가입완료</strong></p>
 	<br><br>
</div>

</body>
</html>