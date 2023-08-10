<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />

<style>

   section#board-list-container{width:600px; margin:0 auto; text-align:center;}
   section#board-list-container h2{margin:10px 0;}
   table#tbl-board{width:100%; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
   table#tbl-board th, table#tbl-board td {border:1px solid; padding: 5px 0; text-align:center;} 
   section#board-list-container {
    width: 600px;
    margin: 0 auto;
    text-align: center;
  }
  section#board-list-container h2 {
    margin: 10px 0;
  }
  table#tbl-board {
    width: 100%;
    margin: 0 auto;
    border: 1px solid black;
    border-collapse: collapse;
    clear: both;
    font-family: Arial, sans-serif; /* Change the font to Arial */
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2); /* Add a boxShadow */
  }
  table#tbl-board th, table#tbl-board td {
    border: 1px solid;
    padding: 6px 60px;
    text-align: center;
    background-color: #f8f8f8; /* Add a light gray background color */
  }
  table#tbl-board th {
    background-color: #24648F; /* Add a dark blue background color */
    color: white; /* Set the text color to white */
  }
  table#tbl-board tr:hover td {
    background-color: #ddd; /* Change the background color on hover */
  }
   /*글쓰기버튼*/
   input#btn-add{float:right; margin: 0 0 15px;}
   /*페이지바*/
   div#pageBar{margin-top:10px; text-align:center; background-color:rgba(0, 188, 212, 0.3);}
   
   
   
</style>
<section id="content">
   <h1 align="center">수강 신청</h1>
   <div id="board-list-container">
   
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
      </section>
	   			<br><br>
   				
   <c:if test="${ not empty loginMember }">
   	<button type="button" onclick="location.href='${ path }/board/write'">신청</button>
   <div class="course-list-container">
   <table class="table table-bordered table-striped" id="courseTable">
   </c:if>
     
      <table id="tbl-board">
         <tr>
            <th>강좌명</th>
            <th>강의장명</th>
            <th>강사명</th>
            <th>강습시간</th>
            <th>수강료</th>
            <th>정원</th>
            <th>수강인원</th>
            <th>수강신청</th>
			
         </tr>
         <c:if test="${ empty list }">
            <tr>
               <td colspan="9">
                  조회된 강습목록이 없습니다.
               </td>
            </tr>            
         </c:if>
          <c:if test="${ not empty list }">
         	<c:forEach var="enroll" items="${ list }">
         
            <tr>
               <td>${ enroll.pgTitle }</td>
               <td>${ enroll.fcName }</td>
               <td>${ enroll.chName }</td>
               <td>${ enroll.pgTime }</td>
               <td>${ enroll.pgFee }</td>
               <td>${ enroll.pgMax }</td> 
               <td>${ enroll.pgNum }</td>
               <td><form method="POST" action="/sportcenter/views/application/cation.jsp" onsubmit="return checkLoginStatus()">
                            <input type="hidden" name="courseId" value="코스ID">
                            <input type="submit" value="신청">
                        </form></td> 
            </tr>         
         	</c:forEach>
         </c:if>
      </table>
      </div>
      <div id="pageBar">
         <!-- 맨 처음으로 -->
         <button onclick="location.href='${path}/board/list?page=1'">&lt;&lt;</button>

         <!-- 이전 페이지로 -->
         <button onclick="location.href='${path}/board/list?page=${pageInfo.prevPage}'">&lt;</button>

         <!--  10개 페이지 목록 -->
         <c:forEach var="current" begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }">
            <c:choose>
               <c:when test="${ current == pageInfo.currentPage }">
                  <button disabled>${ current }</button>               
               </c:when>
               <c:otherwise>
                  <button onclick="location.href='${ path }/board/list?page=${ current }'">${ current }</button>
               </c:otherwise>
            </c:choose>
         </c:forEach>
         <!-- 
         <button disabled>1</button>
         <button>2</button>
         <button>3</button>
         <button>4</button>
         <button>5</button>
         <button>6</button>
         <button>7</button>
         <button>8</button>
         <button>9</button>
         <button>10</button>
         -->
         
 
         <!-- 다음 페이지로 -->
         <button onclick="location.href='${path}/board/list?page=${pageInfo.nextPage}'">&gt;</button>

         <!-- 맨 끝으로 -->
         <button onclick="location.href='${path}/board/list?page=${pageInfo.maxPage}'">&gt;&gt;</button>
      </div>
   </div>
</section>

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

<jsp:include page="/views/common/footer.jsp" />