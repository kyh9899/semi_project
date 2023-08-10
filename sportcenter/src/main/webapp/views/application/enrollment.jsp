<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/views/common/header.jsp" />

<style>
  .course-list-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-right: 200px; /* 오른쪽 여백을 추가합니다. 원하는 값으로 조절하세요. */
  }

  .course-list-container > h3 {
    margin-top: 10px;
  }

  /* 표를 가운데 정렬합니다. */
  #courseTable {
    margin-left: auto;
    margin-right: auto;
  }
</style>

  
<article class="art1" style="width: 60%;">   
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
	<br><br>
 <div class="course-list-container">
        <table class="table table-bordered table-striped" id="courseTable">
        <br><br>
            <thead>
                <tr>
                    <th>강좌명</th>
                    <th>강의장명</th>
                    <th>강사명</th>
                    <th>강습시간</th>
                    <th>수강료</th>
                    <th>수강인원</th>
                    <th>사용가능 여부</th>
                    <th>신청</th>
                </tr>
            </thead>
            <tbody>
               
                <tr>
                    <td>수영</td>
                    <td>강의실1</td>
                    <td>김물개</td>
                    <td>18:00-19:00</td>
                    <td>100,000원</td>
                    <td>30명</td>
                    <td>모집중</td>
                    <td>
                        <form method="POST" action="/sportcenter/views/application/cation.jsp" onsubmit="return checkLoginStatus()">
                            <input type="hidden" name="courseId" value="코스ID">
                            <input type="submit" value="신청">
                        </form>
                    </td>
                </tr>
                
                <tr>
                    <td>헬스</td>
                    <td>강의실2</td>
                    <td>왕근육</td>
                    <td>15:00-18:00</td>
                    <td>90,000원</td>
                    <td>20명</td>
                    <td>모집중</td>
                    <td>
                        <form method="POST" action="/sportcenter/views/application/cation.jsp"  onsubmit="return checkLoginStatus()">
                            <input type="hidden" name="courseId" value="코스ID">
                            <input type="submit" value="신청">
                        </form>
                     
                    </td>
                </tr>
                
                  <tr>
                    <td>필라테스</td>
                    <td>강의실3</td>
                    <td>이필라</td>
                    <td>15:00-18:00</td>
                    <td>120,000원</td>
                    <td>20명</td>
                    <td>모집중</td>
                    <td>
                        <form method="POST" action="/sportcenter/views/application/cation.jsp"  onsubmit="return checkLoginStatus()">
                            <input type="hidden" name="courseId" value="코스ID">
                            <input type="submit" value="신청">
                        </form>
                    </td>
                </tr>
                
                  <tr>
                    <td>탁구</td>
                    <td>강의실4</td>
                    <td>김탁구</td>
                    <td>18:00-20:00</td>
                    <td>80,000원</td>
                    <td>40명</td>
                    <td>모집중</td>
                    <td>
                        <form method="POST" action="/sportcenter/views/application/cation.jsp"  onsubmit="return checkLoginStatus()">
                            <input type="hidden" name="courseId" value="코스ID">
                            <input type="submit" value="신청">
                        </form>
                    </td>
                </tr>
                
                <tr>
                
                    <td>요가</td>
                    <td>강의실5</td>
                    <td>정요가</td>
                    <td>16:00-19:00</td>
                    <td>70,000원</td>
                    <td>10명</td>
                    <td>모집완료</td>
                    <td>
                        <form method="POST" action="/sportcenter/views/application/cation.jsp"  onsubmit="return checkLoginStatus()">
                            <input type="hidden" name="courseId" value="코스ID">
                            <input type="submit" value="신청">
                        </form>
                    </td>
                </tr>
                
                  <tr>
                    <td>베드민턴</td>
                    <td>강의실6</td>
                    <td>이웅대</td>
                    <td>13:00-16:00</td>
                    <td>150,000원</td>
                    <td>30명</td>
                    <td>모집중</td>
                    <td>
                        <form method="POST" action="/sportcenter/views/application/cation.jsp"  onsubmit="return checkLoginStatus()">
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
                    <li><a href="?page=5" aria-label="Next">&raquo;</a></li>
                </ul>
            </nav>
         </div>
    </section>
  

  </div>



 
 
<script>
  let isLoggedIn = <%= (session.getAttribute("loginMember") != null) ? "true" : "false" %>;

  function checkLoginStatus() {
    if (isLoggedIn) {
      return true;
    } else {
      alert("로그인이 필요합니다.");
      return false;
    }
  }
</script>

<%-- 
<script>
  function checkLoginStatus() {
    let isLoggedIn = /* 로그인 상태 확인 로직 구현 */;
    if (!isLoggedIn) {
      alert("로그인 후에 강좌를 등록할 수 있습니다.");
      return false;
    }
    return true;
  }
</script>

form method="POST" action="/enroll" onsubmit="return checkLoginStatus()">

</form>
--%>


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

</article>



<link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">
<jsp:include page="/views/common/footer.jsp" />
<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/sidebars.js"></script>