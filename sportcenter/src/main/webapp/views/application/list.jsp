<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/views/common/header.jsp" />

<style>
   #menuBar {
  position: fixed;
  left: 0;
  top: 50%;
  transform: translateY(-50%);
  width: 150px;
  background-color: #f9f9f9;
  padding: 20px 0;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

#menuBar a {
  display: block;
  color: black;
  text-decoration: none;
  padding: 8px 16px;
  margin-bottom: 10px;
}

#menuBar a:hover,
#menuBar a.active {
  background-color: #4CAF50;
  color: #f9f9f9;
}
#registrationButton {
  font-size: larger;
  padding: 12px 24px;
  cursor: pointer;
}

#content {
  margin-left: 180px;
  padding: 20px;
  box-sizing: border-box;
}

/* 추가된 스타일 */
#courseList table {
  border-collapse: collapse;
  width: 100%;
}
#courseList {
  width: 80%;
  margin: 0 auto;
}

#courseList th,
#courseList td {
  border: 1px solid #ccc;
  padding: 8px;
  text-align: center;
}

#courseList tbody tr:nth-child(odd) {
  background-color: #f2f2f2;
}

#courseList tbody tr:hover {
  background-color: #ddd;
}

#courseList th {
  background-color: #4CAF50;
  color: white;
}
</style>



<div id="menuBar">
    <a href="/sportcenter/">메인페이지</a>
    <a href="/sportcenter/views/introduce/intro.jsp" >센터소개</a>
    <a href="/sportcenter/views/board/list.jsp" >고객 센터</a>
    <a href="/sportcenter/views/member/myPage.jsp" >마이 페이지</a>
</div>

<section id="content">
    <h1 align="center">수강신청 페이지</h1>
    <h3 align="center">로그인시에만 수강신청이 가능합니다.</h3>
  
  
    <p align="center">
        <button type="button" id="registrationButton" onclick="registerCourse();">
            수강신청
        </button>
    </p>
    
    <script>
        let isLoggedIn = <%= (session.getAttribute("loginMember") != null) ? "true" : "false" %>;
        
        function registerCourse() {
            if (isLoggedIn) {
                window.location.href = '/sportcenter/views/application/enrollment.jsp';
            } else {
                alert("로그인이 필요합니다.");
            }
        }
    </script>
    

    
</section>

<jsp:include page="/views/common/footer.jsp" />


