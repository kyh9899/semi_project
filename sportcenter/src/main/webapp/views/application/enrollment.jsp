<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/views/common/header.jsp" />
<jsp:include page="/views//MenuBar.jsp" />
<!DOCTYPE html>
<html>
<head>
<style>
   
      #courseList {
      margin: 0 auto; /* Center the element with auto margin on left and right */
      padding-left: 200px; /* Add padding to the left */
      padding-right: 200px; /* Add padding to the right */
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
        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            list-style: none;
            padding: 20px;
        }

        .pagination li {
            margin: 0 5px;
        }

        .pagination a {
            background-color: #fff;
            padding: 8px 12px;
            text-decoration: none;
            color: #449d44;
            border-radius: 4px;
            border: 1px solid #a3a3a3;
        }

        .pagination a:hover {
            background-color: #449d44;
            color: #fff;
        }

        .pagination .active a {
            background-color: #449d44;
            color: #fff;
            cursor: default;
        }  
      
    
  </style>
</head>
<body>
  <div id="wrapper">

  

 <section id="courseList">
        <h2>강좌 목록</h2>
        <form method="GET" action="/search">
      <input type="text" name="query" id="searchInput" placeholder="강좌 검색" />
     <%--<button type="submit">검색</button> --%> 
      <input type="reset" value="초기화">
    	</form>
    	<br>
    	   <p style="font-size: 14px; color: gray;">원하시는 종목 및 강습반을 선택해 주세요.</p>
		   <p style="font-size: 14px; color: gray;">강습명 검색시 선택된 종목, 강습반은 초기화 됩니다.</p>
		   <p style="font-size: 14px; color: gray;">마감 된 강좌를 제외하고 잔여자리가 있는 강좌만 조회 가능합니다.</p>
	
        <table class="table table-bordered table-striped" id="courseTable">
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
         <nav aria-label="Table page navigation">
                <ul class="pagination">
                    <li><a href="?page=1" aria-label="Previous">&laquo;</a></li>
                    <li><a href="?page=1">1</a></li>
                    <li><a href="?page=2">2</a></li>
                    <li><a href="?page=3">3</a></li>
                    <li><a href="?page=4">4</a></li>
                    <li><a href="?page=5">5</a></li>
                    <li><a href="?page=2" aria-label="Next">&raquo;</a></li>
                </ul>
            </nav>
       
    </section>
  
  

  <footer id="footer">
  <jsp:include page="/views/common/footer.jsp" />
</body>
<script>
document.getElementById('searchInput').addEventListener('input', function () {
  const searchText = this.value.toLowerCase(); // Get the search text in lower case
  const table = document.getElementById('courseTable'); // Get the table element
  const rows = table.getElementsByTagName('tr'); // Get all the table rows

  // Loop through all table rows, and hide those that don't match the search query
  for (let i = 1; i < rows.length; i++) { // Start from 1 to skip the header row
    let td = rows[i].getElementsByTagName('td')[0]; // Get the first cell (강좌명) of the row
    if (td) {
      let txtValue = td.textContent || td.innerText;
      if (txtValue.toLowerCase().indexOf(searchText) > -1) {
        rows[i].style.display = ''; // Show the row if it matches
      } else {
        rows[i].style.display = 'none'; // Hide the row if it doesn't match
      }
    }
  }
});
</script>


<link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">
<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/sidebars.js"></script>

</html>


