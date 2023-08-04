<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<style>
    body, html {
        height: 100%;
        margin: 0;
    }
    .content-wrap {
  min-height: 60vh;
  position: relative;
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
  text-align: right;
}
 div.content-text {
    font-family: 'Source Sans Pro', Arial, sans-serif;
    font-size: 16px;
    line-height: 1.6;
    color: #333333;
    text-align: right;
  }

.detail-content {
  position: relative;
}

h2, h3 {
  margin-bottom: 15px;
}

p {
  line-height: 24px;
  
}
   
    
    #footer {
        position: absolute;
        bottom: 0;
        width: 100%;
    }
    .row {
        display: flex;
    }
    .column {
        flex: 1;
          padding: 4.2rem;
        box-sizing: border-box;
    }
    h3 {
        cursor: pointer;
        color: #333;
        font-size: 1.5rem;
        padding: 0.5rem;
        margin: 0;
        border-radius: 5px;
        transition: background-color 0.2s ease-in-out, color 0.2s ease-in-out;
        text-align: center;
    }
    h3:hover {
        background-color: #6f6f6f;
        color: #FFF;
    }
     .button-group {
    position: absolute;
    display: flex;
    top: 50;
    right: 405px;
}

    .button-group button {
      display: inline-block;
      margin-top: 5px;
      margin: 5px;
      background-color: #4CAF50;
      border: none;
      color: white;
      text-align: center;
      text-decoration: none;
      font-size: 14px;
      padding: 10px 20px;
      border-radius: 4px;
      cursor: pointer;
    }

    .button-group button:hover {
      background-color: #45a049;
    }

  .back-button:hover {
    background-color: #e1e1e1;
  }
     

    .img {
        max-width: 50%; /* adjust this value based on the desired width */
        position: relative;
    }
   #footer {
      position: absolute;
      bottom: 0;
      width: 100%;
      
    }
    #wrapper {
      min-height: 60%;
      position: relative;
    } 
</style>
<div id="wrapper">
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
    function toggleDisplay(id) {
        let element = document.getElementById(id);
        if (element.style.display === "none") {
            element.style.display = "block";
        } else {
            element.style.display = "none";
        }
    }
</script>
</head>
<body>
    <h2 style="text-align: center;">신청완료 상세 페이지</h2>
    <br>
     <br><br>
    <div class="image-and-text">
        <img class="img" src="${ path }/resources/images/runsport.jpg">
        <div class="content-text">
  <h3 style="text-align: center; font-weight: bold; font-size: 28px; margin-bottom: 15px;">에어로빅 A</h3>
    
  <br><br>

   
       
<p style="font-size: 17px; line-height: 1.8;"> <strong>에어로빅 A</strong><span style="display:inline-block; width: 182px;"></span> <br> 
<strong style="color: #2A9D8F;">강습장소:</strong> 강의실1<span style="display:inline-block; width: 157px;"></span><br>
<strong style="color: #2A9D8F;">강사명:</strong> 김강사<span style="display:inline-block; width: 172px;"></span><br>
<strong style="color: #2A9D8F;">강습기간:</strong> (01개월)<span style="display:inline-block; width: 148px;"></span><br>
<strong style="color: #2A9D8F;">강습시간:</strong> 18:00-19:00<span style="display:inline-block; width: 146px;"></span><br>
<strong style="color: #2A9D8F;">수강요금:</strong> ₩100,000<span style="display:inline-block; width: 146px;"></span><br>
<strong style="color: #2A9D8F;">정원   :</strong> 30명<span style="display:inline-block; width: 185px;"></span><br>
<strong style="color: #2A9D8F;">접수기간:</strong> 접수 중<span style="display:inline-block; width: 151px;"></span> </p>
  
</div>
</div>
            <div class="button-group">
        <button onclick="window.location.href='enrollment.jsp'">목록으로</button>
        <button onclick="window.location.href='cation.jsp'">신청하기</button>
          </div>
         </div>
		</div>
        <!-- 강좌소개, 강좌신청내역, 강좌신청안내 및 주의사항 sections -->
        <div class="row">

            <!-- 강좌소개 section -->	
            <div id="course-introduction" class="column">
                <h3 onclick="toggleDisplay('course-intro-text')">강좌소개</h3>
                <p id="course-intro-text" style="display:none;">남녀노소 성인,청소년,유아까지 모두 쉽게 배울 수 있는 스포츠.<br>
                   기초 수업 : 매주 월요일 / 총 프로그램 : 16회 진행됩니다. </p>
            </div>

            <!-- 강좌세부내역 section -->
            <div id="course-details" class="column">
                <h3 onclick="toggleDisplay('course-details-text')">강좌세부내용</h3>
                <p id="course-details-text" style="display:none;">강의시간은 보통2~3시간 어렵지않은 난이도로 배울 수 있음.<br>
                   준비물 개인 지참, 기타 대여 가능 (단, 수업시간만) </p>
            </div>

            <!--  주의사항 section -->
            <div id="course-application-info" class="column">
                <h3 onclick="toggleDisplay('course-application-info-text')"> 주의사항</h3>
                <p id="course-application-info-text" style="display:none;">강좌 신청시에는 중복 신청이 불가하며 <br>
                외국인등록증 발급 회원은 행정정보공동이용시스템 자동 인증 불가로 성동구민 우선등록 시 현장접수만 가능합니다.</p>
            </div>

        </div>

    </div>
    <jsp:include page="/views/common/footer.jsp" />
</body>
</html>




