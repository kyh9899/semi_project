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
    width: 75%;
    margin: 0 auto;
    border: 1px solid black;
    border-collapse: collapse;
    clear: both;
    font-family: Arial, sans-serif; /* Change the font to Arial */
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.2); /* Add a boxShadow */
  }
  table#tbl-board th, table#tbl-board td {
    border: 1px solid;
    padding: 6px 5px;
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
<article class="art1" style="width: 60%;"> 
<div>
<section id="content">
   <h1 align="center">수강 신청</h1>
   <div id="board-list-container">
   
    <section id="courseList">
        <h2>강좌 목록</h2>
      	<input type="text" name="query" id="searchInput" placeholder="강좌 검색" />
     	<%-- <button type="submit" id="search" onclick="location.href='${path}/application/enrollment?query">검색</button>--%>
    	<button type="submit" id="searchButton" onclick="searchCourses();">검색</button>
    	<button type="button" id="resetButton" onclick="resetCourses();">초기화</button>
    	<br><br>
    	   <p style="font-size: 14px; color: gray;">원하시는 종목 및 강습반을 선택해 주세요.</p>
		   <p style="font-size: 14px; color: gray;">강습명 검색시 선택된 종목, 강습반은 초기화 됩니다.</p>
		   <p style="font-size: 14px; color: gray;">마감 된 강좌를 제외하고 잔여자리가 있는 강좌만 조회 가능합니다.</p>
      </section>
	   			<br><br>
   				
   <c:if test="${ not empty loginMember }">
   	
   <div class="course-list-container">
   <table class="table table-bordered table-striped" id="courseTable">
   </c:if>
     
      <table id="tbl-board">
         <tr>
            <th class="course-title">강좌명</th>
            <th class="course-title">강의장명</th>
            <th class="course-title">강사명</th>
            <th class="course-title">강습시간</th>
            <th class="course-title">수강료</th>
            <th class="course-title">정원</th>
            <th class="course-title">수강인원</th>
            <th class="course-title">수강신청</th>
			
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
            <%-- <td>   <button type="button" onclick="location.href='${ path }/application/payment'">신청</button></td>--%>
             <td> <button type="button" onclick="checkLogin('${ enroll.pgTitle }', '${ enroll.pgFee }');">신청</button></td>
              <%--  <td><form method="POST" action="/sportcenter/views/application/cation.jsp" onsubmit="return checkLoginStatus()">
                            <input type="hidden" name="courseId" value="코스ID">
                            <input type="submit" value="신청">
                        </form></td> --%>
            </tr>         
         	</c:forEach>
         </c:if>
      </table>
      </div>
      <%-- <div id="pageBar">
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
      </div>--%>
   </div>
</section>

<article class="art2" style="width: 20%;">
</article>

</div>

<script>
function searchCourses() {
  const searchInput = document.getElementById("searchInput");
  const search = searchInput.value;
  location.href = '${path}/application/enrollment?search=' + encodeURIComponent(search);
  
}
function resetCourses() {
	  const searchInput = document.getElementById("searchInput");
	  searchInput.value = '';
	  location.href = '${path}/application/enrollment';
	}
function submitEnrollment(kind, price) {
	//console.log('${path}/application/payment?kind='+kind);
	//console.log('pgFee 값:', pgFee);
    location.href = '${path}/application/payment?kind=' + kind + '&price=' + price;
  } 
function checkLogin(kind, price) {
    <c:choose>
      <c:when test="${ not empty loginMember }">
        submitEnrollment(kind,price); // 신청하기 전 로그인 상태를 확인하고 신청 진행
      </c:when>
      <c:otherwise>
        alert("로그인한 회원만 가능합니다. 로그인 해주세요!");
      </c:otherwise>
    </c:choose>
}
	
</script>

<link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">
<jsp:include page="/views/common/footer.jsp" />
<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/sidebars.js"></script>