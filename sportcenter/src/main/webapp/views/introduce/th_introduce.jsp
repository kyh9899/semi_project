<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/views/common/header.jsp" />

<style>
	.h1 {
	}
	
    .instructor-card {
      border: 1px solid #ccc;
      border-radius: 5px;
      padding: 20px;
      margin: 20px;
      width: 200px;
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

<article class="art1" style="width: 60%;"> 
<h1 style="font-size: 50px;"> &nbsp;강사 소개</h1>
<div class="instructor-card" style="width: 380px; align-content: center;" onclick="toggleDescription('instructor1')">
  <img style="width: 200px; height: 150px;" src="https://w7.pngwing.com/pngs/565/454/png-transparent-user-computer-icons-anonymity-head-miscellaneous-face-service.png" alt="강사1">
  <div class="instructor-info">
    <div class="instructor-name" >홍길동</div>
    <div class="instructor-specialty">수영 강사</div><br>
    <div class="instructor-description" id="instructor1-description" style="display: none;">
  	<!-- Instructor 1 description goes here -->
  	<ul>
  		<li>체육학 전공</li>
  		<li>생활체육지도자 2급(수영)</li>
  		<li>인명구조원</li>
  		<li>동작구시설관리공단 등 근무</li>
  		<li>마포아트센터 근무</li>
  	</ul>
</div>
  </div>
</div>

<div class="instructor-card" style="width: 380px; align-content: center;" onclick="toggleDescription('instructor2')">
  <img style="width: 200px; height: 150px;" src="https://w7.pngwing.com/pngs/565/454/png-transparent-user-computer-icons-anonymity-head-miscellaneous-face-service.png" alt="강사2">
  <div class="instructor-info">
    <div class="instructor-name" >성춘향</div>
    <div class="instructor-specialty">요가 강사</div><br>
    <div class="instructor-description" id="instructor2-description" style="display: none;">
  	<!-- Instructor 1 description goes here -->
 	<ul>
  		<li>한국체육대학교 운동건강관리학과 졸업</li>
		<li>생활체육지도사(보디빌딩2급) 자격증</li>
  		<li>스포츠테이핑 자격증</li>
  		<li>스포츠마사지 자격증</li>
  	</ul>
</div>
  </div>
</div>

<div class="instructor-card" style="width: 380px; align-content: center;" onclick="toggleDescription('instructor3')">
  <img style="width: 200px; height: 150px;" src="https://w7.pngwing.com/pngs/565/454/png-transparent-user-computer-icons-anonymity-head-miscellaneous-face-service.png" alt="강사3">
  <div class="instructor-info">
    <div class="instructor-name" >이용대</div>
    <div class="instructor-specialty">배드민턴 강사</div><br>
    <div class="instructor-description" id="instructor3-description" style="display: none;">
  	<!-- Instructor 1 description goes here -->
  	<ul>
  		<li>세계배드민턴연맹 바르셀로나 스페인 마스터스 남자복식 우승</li>
  		<li>중국 마스터즈 배드민턴 그랑프리골드 남자복식 1위</li>
  		<li>인도네시아오픈 배드민턴 슈퍼시리즈프리미어 남자복식 1위</li>
  		<li>제30회 런던 올림픽 남자 배드민턴 국가대표</li>
  		<li>세계배드민턴연맹 선수위원회 선수위원</li>
  	</ul>
</div>
  </div>
</div>

<div class="instructor-card" style="width: 380px; align-content: center;" onclick="toggleDescription('instructor4')">
  <img style="width: 200px; height: 150px;" src="https://w7.pngwing.com/pngs/565/454/png-transparent-user-computer-icons-anonymity-head-miscellaneous-face-service.png" alt="강사4">
  <div class="instructor-info">
    <div class="instructor-name" >홍영현</div>
    <div class="instructor-specialty">탁구 강사</div><br>
    <div class="instructor-description" id="instructor4-description" style="display: none;">
  	<!-- Instructor 1 description goes here -->
  	<ul>
  		<li>제96회 전국체육대회 단식 1위</li>
  		<li>포스코에너지컵 단식 3위</li>
  		<li>독일오픈 단식 2위</li>
  		<li>ITTF 월드투어 그랜드 파이널스 단식 2위</li>
  		<li>벨기에 오픈 단식 1위</li>
  	</ul>
</div>
  </div>
</div>

<div class="instructor-card" style="width: 380px; align-content: center;" onclick="toggleDescription('instructor5')">
  <img style="width: 200px; height: 150px;" src="https://w7.pngwing.com/pngs/565/454/png-transparent-user-computer-icons-anonymity-head-miscellaneous-face-service.png" alt="강사5">
  <div class="instructor-info">
    <div class="instructor-name" >이아영</div>
    <div class="instructor-specialty">필라테스 강사</div><br>
    <div class="instructor-description" id="instructor5-description" style="display: none;">
  	<!-- Instructor 1 description goes here -->
  	<ul>
  		<li>필라테스(국제재활필라테스) 자격증</li>
  		<li>서대문청소년수련관 필라테스 강사</li>
  		<li>문정교육문화관 필라테스 강사</li>
  	</ul>
</div>
  </div>
</div>

<div class="instructor-card" style="width: 380px; align-content: center;" onclick="toggleDescription('instructor6')">
  <img style="width: 200px; height: 150px;" src="https://w7.pngwing.com/pngs/565/454/png-transparent-user-computer-icons-anonymity-head-miscellaneous-face-service.png" alt="강사6">
  <div class="instructor-info">
    <div class="instructor-name" >김근육</div>
    <div class="instructor-specialty">헬스 강사</div><br>
    <div class="instructor-description" id="instructor6-description" style="display: none;">
  	<!-- Instructor 1 description goes here -->
  	<ul>
  		<li>체육학 전공</li>
  		<li>한국체육대학교 스포츠청소년지도학과 졸업</li>
  		<li>생활체육지도사(보디빌딩2급) 자격증</li>
  		<li>호텔신라 vantt 근무</li>
  		<li>트램폴린 외 3종 자격증</li>
  	</ul>
</div>
  </div>
</div>





  <!-- Add more instructor cards as needed -->

  <div class="clear"></div>
  
  <script>
  function toggleDescription(instructorId) {
    var description = document.getElementById(instructorId + '-description');
    if (description.style.display === "none") {
      description.style.display = "block";
    } else {
      description.style.display = "none";
    }
  }
</script>

</article>
<article class="art2" style="width: 20%;">

<link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">
<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.js"></script>
<jsp:include page="/views/common/footer.jsp" />
<script src="${ pageContext.request.contextPath }/resources/js/sidebars.js"></script>