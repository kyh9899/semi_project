<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <style>
        h2 {
            border: 1px solid green;
            width : 100%;
            text-align : "center";
        }

    </style>

<jsp:include page="/views/common/header.jsp" />

<article class="art1" style="width: 60%;"> 
<section id="content">
<h2> [ Sports Center 메인페이지 ] <br> 안녕하세요 Sports Center에 오신것을 환영합니다.</h2>

<a><img src="/0f79bc26ca9c33a9d357494fd2386899_t.jpeg"></a>
<a><img src="/2020도쿄올림픽_배드민턴.svg.png"></a>
<a><img src="/2020도쿄올림픽_수영.svg.png"></a>
<a><img src="/2020도쿄올림픽_탁구.svg.png"></a>
<a><img src="/png-transparent-computer-icons-pilates-exercise-physical-fitness-gymnastics-physical-fitness-hand-logo.png"></a>
<a><img src="/png-transparent-pictogram-personal-trainer-stick-figure-fitness-centre-world-health-day-blue-physical-fitness-text.png"></a>

</section>

<article class="art2" style="width: 20%;">
</article>

<link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">
<jsp:include page="/views/common/footer.jsp" />
<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/sidebars.js"></script>