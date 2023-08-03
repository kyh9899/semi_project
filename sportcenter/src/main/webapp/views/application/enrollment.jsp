<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/views/common/header.jsp" />

<!DOCTYPE html>
<html>
<head>
<style>
   
      #courseList {
      margin: 0 auto; /* Center the element with auto margin on left and right */
      padding-left: 160px; /* Add padding to the left */
      padding-right: 160px; /* Add padding to the right */
      font-family: "Arial", sans-serif;
    }
    table {
        width: 90%;
        margin-left: auto;
        margin-right: auto;
        border-collapse: collapse;
    }
    th, td {
      padding: 15px;
      text-align: left;
      font-size: 14px;
    }
    th {
      background-color: #A3A3A3;
      color: white;
    }
    tr:nth-child(odd) {
      background-color: #ECECEC;
    }
    tr:nth-child(even) {
      background-color: #F8F8F8;
    }
    input[type="submit"] {
      background-color: #449D44;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
    html, body {
      height: 100%;
    }
    #wrapper {
      min-height: 100%;
      position: relative;
    } 
   
    #footer {
      position: absolute;
      bottom: 0;
      width: 100%;
    }
  </style>
</head>
<body>
  <div id="wrapper">

  

 <section id="courseList">
        <h2>강좌 목록</h2>
        <form method="GET" action="/search">
      <input type="text" name="query" placeholder="강좌 검색" />
      <button type="submit">검색</button>
      <input type="reset" value="초기화">
    	</form>
    	
        <table class="table table-bordered table-striped">
        <br><br>
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
                        <form method="POST" action="/sportcenter/views/application/cation.jsp">
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
                        <form method="POST" action="/sportcenter/views/application/cation.jsp">
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
                        <form method="POST" action="/sportcenter/views/application/cation.jsp">
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
                        <form method="POST" action="/sportcenter/views/application/cation.jsp">
                            <input type="hidden" name="courseId" value="코스ID">
                            <input type="submit" value="신청">
                        </form>
                    </td>
                </tr>
                
                <tr>
                    <td>배드민턴</td>
                    <td>강의실5</td>
                    <td>이웅대</td>
                    <td>16:00-19:00</td>
                    <td>70,000원</td>
                    <td>10명</td>
                    <td>모집완료</td>
                    <td>
                        <form method="POST" action="/sportcenter/views/application/cation.jsp">
                            <input type="hidden" name="courseId" value="코스ID">
                            <input type="submit" value="신청">
                        </form>
                    </td>
                </tr>
                
                  <tr>
                    <td>야구</td>
                    <td>강의실6</td>
                    <td>왕홈런</td>
                    <td>13:00-16:00</td>
                    <td>150,000원</td>
                    <td>30명</td>
                    <td>모집중</td>
                    <td>
                        <form method="POST" action="/sportcenter/views/application/cation.jsp">
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


