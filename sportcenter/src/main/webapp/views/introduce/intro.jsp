<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/views/common/header.jsp" />

<!DOCTYPE html>
<html>

<head>
   <title>Kakao 지도 시작하기</title>
</head>

  <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
    </style>
<section id="content" style="display: flex; align-items: center;">
    <ul style="display: flex; flex-direction: column;">
    </ul>

    
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
    
    
    <div style="width: 700px;">
        <h2>센터 소개 페이지</h2>
        
	<link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">
        <body>
            <div id="map" style="width:1500px;height:550px;margin: 0 auto;" align="center">
            <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1c570a4bb062a63d6e8c95aa274b0531"></script>
            <script>
                var container = document.getElementById('map');
                var options = {
                    center: new kakao.maps.LatLng(33.450701, 126.570667),
                    level: 3
                };

                var map = new kakao.maps.Map(container, options);
            </script>
            </div>
           
        </body>
</html>


    </div>
</section>

<jsp:include page="/views/common/footer.jsp" />
