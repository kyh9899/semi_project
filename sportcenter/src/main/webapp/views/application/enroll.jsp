<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="path" value="${ pageContext.request.contextPath }" />
<jsp:include page="/views/common/header.jsp" />

<style>
    section#content {
        background-color: #DFEAF7;
    }
      
    section#board-list-container {
        width: 600px;
        margin: 0 auto;
        text-align: center;
    }
    section#board-list-container h2 {
        margin: 10px 0;
        background-color: #DFEAF7;
    }
          
    table#tbl-board {
        width: 100%;
        margin: 0 auto;
        border-collapse: collapse;
        clear: both;
        font-family: Arial, sans-serif;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.25);
        border-radius: 6px;
        overflow: hidden;
    }

    table#tbl-board th, table#tbl-board td {
        border: 1px solid #d6d6d6;
        padding: 12px 10px;
        text-align: center;
        background-color: #ffffff;
        padding: 10px 10px; 
        line-height: 1.8; 
    }

    table#tbl-board th {
        background-color: #4a90e2;
        color: white;
        font-weight: 1100;
        text-transform: uppercase;
        letter-spacing: 0.08em;
        border-bottom: 2px solid #295788;
        text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
        border: 2px solid #3974b9;
        border-radius: 5px;
    }

    table#tbl-board tr:nth-child(even) td {
        background-color: #f2f2f2;
    }

    table#tbl-board tr:hover td {
        background-color: #e0ebeb;
        cursor: pointer;
    }

    .enroll-button {
        background-color: #455a64;
        color: #fff;
        border: none;
        padding: 5px 10px;
        cursor: pointer;
        transition-duration: 0.4s;
        border-radius: 5px;
    }

    .enroll-button:hover {
        background-color: #CCCC99;
    }

    #pageBar {
        font-family: Arial, sans-serif;
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 7px; 
        align-items: center;
        background: #DFEAF7;
        padding: 10px;
        border-radius: 5px;
        box: 0 1px 3px rgba(0, 0, 0, 0.2);
        margin-bottom: 20px; 
    }

    #pageBar button {
        background: #24648F;
        color: #fff;
        font-size: 14px;
        border: none;
         padding: 5px 10px;
        cursor: pointer;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        transition-duration: 0.4s;
        border-radius: 5px;
    }

    #pageBar button:hover {
        background: #5399CA;
    }

    #pageBar button:disabled {
        background: #bcd3e6;
        cursor: not-allowed;
    }
</style>

<article class="art1" style="width: 60%;"> 
    <div>
        <section id="content">
            <h2 align="center">수강 신청</h2>
            <div id="board-list-container" >
                <br><br>
                <section id="courseList">
                    <h3>강좌 목록</h3>
                    <input type="text" name="query" id="searchInput" placeholder="강좌 검색" />
                    <button type="submit" id="searchButton" onclick="searchCourses();">검색</button>
                    <button type="button" id="resetButton" onclick="resetCourses();">초기화</button>
                    <br><br><br>
                    <p style="font-size: 14px; color: gray;">원하시는 종목 및 강습반을 선택해 주세요.</p>
                    <p style="font-size: 14px; color: gray;">강습명 검색시 선택된 종목, 강습반은 초기화 됩니다.</p>
                    <p style="font-size: 14px; color: gray;">마감 된 강좌를 제외하고 잔여자리가 있는 강좌만 조회 가능합니다.</p>
                </section>
                <br>

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
                            <th class="course-title">요일</th>
                            <th class="course-title">수강료</th>
                            <th class="course-title">정원</th>
                            <th class="course-title">수강인원</th>
                            <th class="course-title">수강신청</th>
                        </tr>
                        <c:if test="${ empty list }">
                            <tr>
                                <td colspan="10">조회된 강습목록이 없습니다.</td>
                            </tr>            
                        </c:if>
                        <c:if test="${ not empty list }">
                        <c:forEach var="enroll" items="${ list }">
                            <tr>
                                <td>${ enroll.pgTitle }</td>
                                <td>${ enroll.fcName }</td>
                                <td>${ enroll.chName }</td>
                                <td>${ enroll.pgTime }</td>
                                <td>${ enroll.pgDate }</td>
                                <td>${ enroll.pgFee }</td>
                                <td>${ enroll.pgMax }</td> 
                                <td>${ enroll.pgNum }</td>
                                <td>
                                <button type="button" class="enroll-button" onclick="checkLogin('${ enroll.pgTitle }');">신청</button>
                                </td>
                            </tr>         
                            </c:forEach>
                        </c:if>
                    </table>
                </div>
                <br>

                <div id="pageBar">
                    <c:if test="${pageInfo.maxPage > 1}">
                        <button onclick="changePage(1)">&lt;&lt;</button>
                        <button onclick="changePage(${pageInfo.prevPage})">&lt;</button>

                        <c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
                            <c:choose>
                                <c:when test="${i == pageInfo.currentPage}">
                                    <button onclick="changePage(${i})" disabled>${i}</button>
                                </c:when>
                                <c:otherwise>
                                    <button onclick="changePage(${i})">${i}</button>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>

                        <button onclick="changePage(${pageInfo.nextPage})">&gt;</button>
                        <button onclick="changePage(${pageInfo.maxPage})">&gt;&gt;</button>
                    </c:if>
                </div>
            </div>
        </section>
    </div>
</article>
        <article class="art2" style="width: 20%;"></article>
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
        function submitEnrollment(kind) {
            location.href = '${path}/application/payment?kind=' + kind;
        } 
        function checkLogin(kind) {
            <c:choose>
                <c:when test="${ not empty loginMember }">
                    submitEnrollment(kind);
                </c:when>
                <c:otherwise>
                    alert("로그인한 회원만 가능합니다. 로그인 해주세요!");
                </c:otherwise>
            </c:choose>
        }
        function changePage(page) {
            location.href = '${path}/application/enrollment?page=' + page;
        }
    </script>
    <link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">
    <jsp:include page="/views/common/footer.jsp" />
    <script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/sidebars.js"></script>
