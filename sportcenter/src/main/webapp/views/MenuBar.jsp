<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="flex-shrink-0 p-3 bg-white" style="width: 280px; float:left; align:center; margin:20px 50px 0px 150px;"} >
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
            <li><a href="http://localhost:8087/sportcenter/views/introduce/intro_hello.jsp" class="link-dark d-inline-flex text-decoration-none rounded">인사말</a></li>
 			<li><a href="http://localhost:8087/sportcenter/views/introduce/route.jsp" class="link-dark d-inline-flex text-decoration-none rounded">오시는 길</a></li>
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

</body>
</html>