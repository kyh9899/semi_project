<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/views/common/header.jsp" />

<!DOCTYPE html>
<html>
<head>
 
</head>
<body>
  <div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">
    <a href="/" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
      <svg class="bi pe-none me-2" width="30" height="24"><use xlink:href="#bootstrap"/></svg>
      <span class="fs-5 fw-semibold">MENU</span>
    </a>
    <ul class="list-unstyled ps-0">
      <li class="mb-1">
        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">
          센터 소개
        </button>
        <div class="collapse show" id="home-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">인사말</a></li>
            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">오시는 길</a></li>
            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">강사 소개</a></li>
          </ul>
        </div>
      </li>
      <li class="greeting">
        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
          프로그램 안내
        </button>
        <div class="collapse" id="dashboard-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">시설 안내</a></li>
            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">이용 시간표</a></li>
            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">요금</a></li>
          </ul>
        </div>
      </li>
      <li class="mb-1">
        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
          수강 신청 
        </button>
        <div class="collapse" id="orders-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">프로그램</a></li>
            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">이용 시간</a></li>
            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">요금</a></li>
          </ul>
        </div>
      </li>
      <li class="border-top my-3"></li>
      <li class="mb-1">
        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
          고객 센터
        </button>
        <div class="collapse" id="account-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Q&A</a></li>
            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">자주 묻는 질문</a></li>
            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">고객 문의</a></li>
            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">분실물</a></li>
          </ul>
        </div>
      </li>
    </ul>
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
    <div style="width: 700px;">
  

<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/sidebars.js"></script>
<jsp:include page="/views/common/footer.jsp" />
<link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">
</body>
</html>


