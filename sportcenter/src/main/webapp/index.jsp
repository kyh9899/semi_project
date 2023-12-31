<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />




    <style>
    h2 {
        width: 100%;
        height: 200px;
        text-align: center;
    }

    .circle-container {
        display: flex;
        justify-content: center;
        margin: 20px 0; /* 동그라미 컨테이너와의 간격 조절 */
    }

    .circle {
	    width: 100px;
	    height: 100px;
	    border-radius: 50%;
	    margin: 10px; /* 각 동그라미 간의 간격 조절 */
	    position: relative;
	    overflow: hidden;
  }
    
    .notice {
        width: 400px;
        height: 200px;
        margin: 20px auto;
    	margin-top : 145px;
    }
    
    .recommend {
        width: 400px;
        height: 200px;
        margin: 20px auto;
        margin-top : 30px;
    }
   
    .left-column {
        display: flex;
        flex-direction: column;
        align-items: center;
        height: 100%;
    }

    .rectangle1 {
        width: 400px;
        height: 123px;
        border:1px solid black;
        margin: 20px auto;
        margin-top: 170px;
    }
    
    .rectangle2 {
        width: 400px;
        height: 123px;
        border:1px solid black;
        margin: 0px auto;
        margin-bottom : 20px;
    }
    
    .rectangle3 {
        width: 400px;
        height: 123px;
        border:1px solid black;
        margin: 0px auto;
        margin-bottom : 20px;
    }

    
    .nested-article {
        width: 50%;
        float: left;
        height: 100%;
    }
    
    #link {
    	font-family: 'Noto Sans', sans-serif;
    	text-decoration: none;
        color: black;
    }
    
    .circle img {
    max-width: 100%;
    height: auto;
    transition: filter 0.3s ease;
  	}
    
    #text {
    	font-family: 'Noto Sans', sans-serif;
    	font:20px;
    	color: white;
    	text-align:center;
    }
    
    .text {
    font-family: 'Noto Sans', sans-serif;
    font-size: 20px;
    color: white;
    text-align: center;
    opacity: 0;
    transition: opacity 0.3s ease;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    pointer-events: none;
    z-index: 2;
  	  }

  .circle:hover .text {
    opacity: 1;
	  }
	  
  .circle:hover img {
	filter: brightness(70%);
	}
  }
  
  .mySwiper {
    width: 100%; /* Swiper 컨테이너의 너비 설정 */
    height: 200px; /* Swiper 컨테이너의 높이 설정 */
}

</style>



<article class="art1" style="width: 60%; margin: 10px auto;"> 
    <section id="content" style="height : 200px;">
        <h2 style="margin:0px;"> [ Sports Center 메인페이지 ] <br> 안녕하세요 Sports Center에 오신 것을 환영합니다.</h2>

        <div class="circle-container">
            <a class="circle" href="${ path }/tabletennis/info"><img class="circle" style="margin:0px;" src="${ path }/resources/images/TableTennis.png">
            <p class="text">탁구</p>
            </a>
            <a class="circle" href="${ path }/health/info"><img class="circle" style="margin:0px;" src="${ path }/resources/images/training.png">
            <p class="text">헬스</p>
            </a>
            <a class="circle" href="${ path }/swim/info"><img class="circle" style="margin:0px;" src="${ path }/resources/images/Swim.png">
            <p class="text">수영</p>
            </a>
            <a class="circle" href="${ path }/yoga/info"><img class="circle" style="margin:0px;" src="${ path }/resources/images/Yoga.png">
            <p class="text">요가</p>
            </a>
            <a class="circle" href="${ path }/badminton/info"><img class="circle" style="margin:0px;" src="${ path }/resources/images/Badminton.png">
            <p class="text">배드민턴</p>
            </a>
            <a class="circle" href="${ path }/pilates/info"><img class="circle" style="margin:0px;" src="${ path }/resources/images/QPilates.jpeg">
            <p class="text">필라테스</p>
            </a>
        </div>
    </section>
    
    
     <article class="nested-article" style="width: 50%; float: left;">
		 <div class="notice">
		 <div style="display: flex; justify-content: space-between;">
		 <p style = "margin:0">공지사항</p>
		 <span style = "margin:0;"><a id="link" href="${ path }/board/notice?boardId=notice">더보기 &#62;</a></span>
		 </div>
		 <div style="width:100%; height:100%; border:1px solid black;"></div>
		 </div>
		 <div class="recommend">
		 <div style="display: flex; justify-content: space-between;">
		 <p style = "margin:0">추천강좌</p>
		 <span style = "margin:0;"><a id="link" href="${ path }/program/info">더보기 &#62;</a></span>
		 </div>
		 <div class="swiper mySwiper">
                <div class="swiper-wrapper">
		              <div class="swiper-slide"><a href="${ path }/swim/info"><img class="pic1" style="width:400px; height:200px;" src="${ path }/resources/images/swim.jpg"></a></div>
		              <div class="swiper-slide"><a href="${ path }/health/info"><img class="pic1" style="width:400px; height:200px;" src="${ path }/resources/images/health.jpg"></a></div>
		              <div class="swiper-slide"><a href="${ path }/tabletennis/info"><img class="pic1" style="width:400px; height:200px;" src="${ path }/resources/images/tabletennis.jpg"></a></div>
		              <div class="swiper-slide"><a href="${ path }/yoga/info"><img class="pic1" style="width:400px; height:200px;" src="${ path }/resources/images/yoga.jpg"></a></div>
		              <div class="swiper-slide"><a href="${ path }/pilates/info"><img class="pic1" style="width:400px; height:200px;" src="${ path }/resources/images/pilates.jpg"></a></div>
		              <div class="swiper-slide"><a href="${ path }/badminton/info"><img class="pic1" style="width:400px; height:200px;" src="${ path }/resources/images/badminton.jpg"></a></div>
              	</div>
             <div class="swiper-button-next"></div>
             <div class="swiper-button-prev"></div>
         </div>

		 </div>
    </article>
    <article class="nested-article" style="width: 50%; float: left;">
        <div class="left-column">
        <a href="${ path }/application/enrollment">
        <div class="rectangle1">
        	<p id="text" style="color:black;">온라인 수강신청 안내</p>
        </div>
        </a>
        <div class="rectangle2">
        	<p id="text" style="color:black;">시설 이용시간 안내</p>
        </div>
        <div class="rectangle3">
        	<p id="text" style="color:black;">안내데스크 및 대표 번호</p>
        </div>
    </div>
    </article>
</article>

<article class="art2" style="width: 20%;">
    
</article>

<jsp:include page="/views/common/footer.jsp" />

<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<script>
    function fnMove(seq){
        // offset() 좌표값,위치
        // var 변수 선언
        var offset = $("#section"+seq).offset();
        $("html, body").animate({
            scrollTop : offset.top-10
        }, 400);
    }

    var swiper = new Swiper(".mySwiper", {
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
        // 자동 슬라이드 설정
        autoplay: {
            delay: 2000, // 2초 간격으로 슬라이드
        },
    });
</script>


<link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">
<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/sidebars.js"></script>