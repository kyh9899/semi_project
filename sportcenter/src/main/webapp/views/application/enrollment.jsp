<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/views/common/header.jsp" />

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Sport Center</title>
  <style>
  html, body {
      margin: 0;
      padding: 0;
      height: 100%;
    }
    
        #footer {
      position: absolute;
      bottom: 0;
      width: 100%;
    }
    
       #content {
      min-height: 100%;
      position: relative;
      flex-grow: 1;
    }
    #main {
      padding-bottom: 60px;
    }
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
</head>
<body>
  <div id="menuBar">
    <a href="/sportcenter/">메인페이지</a>
    <a href="/sportcenter/views/introduce/intro.jsp">센터소개</a>
    <a href="/sportcenter/views/program/list.jsp">프로그램 안내 페이지</a>
    <a href="/sportcenter/views/board/list.jsp">고객 센터</a>
    <a href="/sportcenter/views/member/myPage.jsp">마이 페이지</a>
  </div>

 <section id="courseList">
        <h2>강좌 목록</h2>
        <table>
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
                
                <tr>
                    <td>에어로빅B</td>
                    <td>강의실2</td>
                    <td>이강사</td>
                    <td>15:00-18:00</td>
                    <td>90,000원</td>
                    <td>20명</td>
                    <td>모집중</td>
                    <td>
                        <form method="POST" action="신청URL">
                            <input type="hidden" name="courseId" value="코스ID">
                            <input type="submit" value="신청">
                        </form>
                    </td>
                </tr>
                
                  <tr>
                    <td>수영</td>
                    <td>강의실3</td>
                    <td>황물개</td>
                    <td>15:00-18:00</td>
                    <td>120,000원</td>
                    <td>20명</td>
                    <td>모집중</td>
                    <td>
                        <form method="POST" action="신청URL">
                            <input type="hidden" name="courseId" value="코스ID">
                            <input type="submit" value="신청">
                        </form>
                    </td>
                </tr>
                
                  <tr>
                    <td>축구</td>
                    <td>강의실4</td>
                    <td>손웅민</td>
                    <td>18:00-20:00</td>
                    <td>80,000원</td>
                    <td>40명</td>
                    <td>모집중</td>
                    <td>
                        <form method="POST" action="신청URL">
                            <input type="hidden" name="courseId" value="코스ID">
                            <input type="submit" value="신청">
                        </form>
                    </td>
                </tr>
                
                  <tr>
                    <td>야구</td>
                    <td>강의실5</td>
                    <td>왕홈런</td>
                    <td>13:00-16:00</td>
                    <td>150,000원</td>
                    <td>30명</td>
                    <td>모집중</td>
                    <td>
                        <form method="POST" action="신청URL">
                            <input type="hidden" name="courseId" value="코스ID">
                            <input type="submit" value="신청">
                        </form>
                    </td>
                </tr>
                
            </tbody>
        </table>
    </section>
  
  <footer id="footer">
  <jsp:include page="/views/common/footer.jsp" />
</body>
</html>


