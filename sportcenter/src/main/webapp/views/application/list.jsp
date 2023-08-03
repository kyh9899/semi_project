<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/views/common/header.jsp" />

<style>
    #menuBar {
        position: absolute;
        left: 0;
        top: 50%;
        transform: translateY(-50%);
        width: 200px;
        background-color: #FFFFFF;
        padding: 20px 0;
    }
    #menuBar a {
        display: block;
        color: black;
        text-decoration: none;
        padding: 8px 16px;
        margin-bottom: 10px;
    }
    #menuBar a:hover {
        background-color: #FFFFFF;
    }
    #content {
        margin-left: 220px;
    }
</style>

<div id="menuBar">
    <a href="메뉴1URL">메뉴 1</a>
    <a href="메뉴2URL">메뉴 2</a>
    <a href="메뉴3URL">메뉴 3</a>
    <a href="메뉴4URL">메뉴 4</a>
</div>

<section id="courseList">
  <h3>강좌 목록</h3>
  <table border="1">
    <thead>
      <tr>
        <th>강좌명</th>
        <th>강의실</th>
        <th>강사명</th>
        <th>교육시간</th>
        <th>수강료</th>
        <th>정원</th>
        <th>상태</th>
        <th>신청</th>
      </tr>
    </thead>
    <tbody>
      <!-- 예시 강좌 행 -->
      <tr>
        <td>에어로빅A</td>
        <td>강의실1</td>
        <td>김강사</td>
        <td>18:00-19:00</td>
        <td>100,000원</td>
        <td>30명</td>
        <td>모집중</td>
        <td>
          <form method="POST" action="신청URL">
            <input type="hidden" name="courseId" value="코스ID">
            <input type="submit" value="신청">
          </form>
        </td>
      </tr>
      <!-- 강좌 행을 추가하려면 위와 같은 형태로 새로운 <tr>을 만들어주세요. -->
    </tbody>
  </table>
</section>

<section id="content">
    <h2 align="center">수강신청 페이지</h2>
  
    <p align="center">
        <button type="button" id="registrationButton" onclick="registerCourse();">
            수강신청
        </button>
    </p>
    
    <script>
        let isLoggedIn = <%= (session.getAttribute("loginUser") != null) ? "true" : "false" %>;
        
        function registerCourse() {
            if (isLoggedIn) {
                window.location.href = '수강신청URL';
            } else {
                alert("로그인이 필요합니다.");
            }
        }
    </script>
</section>

<jsp:include page="/views/common/footer.jsp" />
