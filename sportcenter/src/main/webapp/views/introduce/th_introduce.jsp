<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/views/common/header.jsp" />
<jsp:include page="/views//MenuBar.jsp" />
<style>
    .instructor-card {
      border: 1px solid #ccc;
      border-radius: 5px;
      padding: 20px;
      margin: 20px;
      width: 140px;
      float: left;
      display: flex;
  	  flex-direction: column;
  	  align-items: center;
    }
    .instructor-name {
      display: flex;
  	  flex-direction: column;
  	  align-items: center;
    }
</style>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Teacher Introduce</title>
</head>
<body>
  <header>
<h1 align="left"> &nbsp;강사 소개</h1> <br>
  </header>
<div class="instructor-card" style="width: 150px; align-content: center;">
  <img style="width: 110px; height: 100px;" src="https://w7.pngwing.com/pngs/565/454/png-transparent-user-computer-icons-anonymity-head-miscellaneous-face-service.png" alt="강사1">
  <div class="instructor-info">
    <div class="instructor-name">홍길동</div>
    <div class="instructor-specialty">수영 강사</div>
  </div>
</div>

<div class="instructor-card" style="width: 150px; align-content: center;">
  <img style="width: 110px; height: 100px;" src="https://w7.pngwing.com/pngs/565/454/png-transparent-user-computer-icons-anonymity-head-miscellaneous-face-service.png" alt="강사1">
  <div class="instructor-info">
    <div class="instructor-name">이몽룡</div>
    <div class="instructor-specialty">헬스 강사</div>
  </div>
</div>

<div class="instructor-card" style="width: 150px; align-content: center;">
  <img style="width: 110px; height: 100px;" src="https://w7.pngwing.com/pngs/565/454/png-transparent-user-computer-icons-anonymity-head-miscellaneous-face-service.png" alt="강사1">
  <div class="instructor-info">
    <div class="instructor-name">성춘향</div>
    <div class="instructor-specialty">필라테스 강사</div>
  </div>
</div>

<div class="instructor-card" style="width: 150px; align-content: center;">
  <img style="width: 110px; height: 100px;" src="https://w7.pngwing.com/pngs/565/454/png-transparent-user-computer-icons-anonymity-head-miscellaneous-face-service.png" alt="강사1">
  <div class="instructor-info">
    <div class="instructor-name">홍백호</div>
    <div class="instructor-specialty">탁구 강사</div>
  </div>
</div>

<div class="instructor-card" style="width: 150px; align-content: center;">
  <img style="width: 110px; height: 100px;" src="https://w7.pngwing.com/pngs/565/454/png-transparent-user-computer-icons-anonymity-head-miscellaneous-face-service.png" alt="강사1">
  <div class="instructor-info">
    <div class="instructor-name">황선명</div>
    <div class="instructor-specialty">요가 강사</div>
  </div>
</div>

<div class="instructor-card" style="width: 150px; align-content: center;">
  <img style="width: 110px; height: 100px;" src="https://w7.pngwing.com/pngs/565/454/png-transparent-user-computer-icons-anonymity-head-miscellaneous-face-service.png" alt="강사1">
  <div class="instructor-info">
    <div class="instructor-name">이용대</div>
    <div class="instructor-specialty">배드민턴 강사</div>
  </div>
</div>



  <!-- Add more instructor cards as needed -->

  <div class="clear"></div>
</body>
</html>
<link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">
<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/sidebars.js"></script>