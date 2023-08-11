<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class="flex-shrink-0 p-3 bg-white" style="width: 280px ;">
    <a href="/" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
      <svg class="bi pe-none me-2" width="30" height="24"><use xlink:href="#bootstrap"/></svg>
      <span class="fs-5 fw-semibold">MENU</span>
    </a>
    <ul class="list-unstyled ps-0">
      <li class="mb-1">
        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" 
        	data-bs-toggle="collapse" 
        	data-bs-target="#home-collapse" 
        	aria-expanded="false"
        	id="introId" >
          센터 소개
        </button>
        <div class="collapse" id="home-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="${ pageContext.request.contextPath }/introduce/Center" class="link-dark d-inline-flex text-decoration-none rounded">인사말</a></li>
 			<li><a href="${ pageContext.request.contextPath }/introduce/Route" class="link-dark d-inline-flex text-decoration-none rounded">오시는 길</a></li>
            <li><a href="${ pageContext.request.contextPath }/introduce/Teacher" class="link-dark d-inline-flex text-decoration-none rounded">강사 소개</a></li>
          </ul>
        </div>
      </li>
      <li class="greeting">
        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" 
        	data-bs-toggle="collapse" 
        	data-bs-target="#dashboard-collapse" 
        	aria-expanded="false"
        	id="programId">
          프로그램 안내
        </button>
        <div class="collapse" id="dashboard-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="http://localhost:8087/sportcenter/swim/info" class="link-dark d-inline-flex text-decoration-none rounded">수영</a></li>
            <li><a href="http://localhost:8087/sportcenter/health/info" class="link-dark d-inline-flex text-decoration-none rounded">헬스</a></li>
            <li><a href="http://localhost:8087/sportcenter/pilates/info" class="link-dark d-inline-flex text-decoration-none rounded">필라테스</a></li>
            <li><a href="http://localhost:8087/sportcenter/tabletennis/info" class="link-dark d-inline-flex text-decoration-none rounded">탁구</a></li>
            <li><a href="http://localhost:8087/sportcenter/yoga/info" class="link-dark d-inline-flex text-decoration-none rounded">요가</a></li>
            <li><a href="http://localhost:8087/sportcenter/badminton/info" class="link-dark d-inline-flex text-decoration-none rounded">배드민턴</a></li>
          </ul>
        </div>
      </li>
      <li class="mb-1">
        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" 
        	data-bs-toggle="collapse" 
        	data-bs-target="#orders-collapse" 
        	aria-expanded="false"
        	id="enrollId">
          수강 신청 
        </button>
        <div class="collapse" id="orders-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="http://localhost:8087/sportcenter/application/enrollment" class="link-dark d-inline-flex text-decoration-none rounded">목록</a></li>
          </ul>
        </div>
      </li>
      <li class="border-top my-3"></li>
      <li class="mb-1">
        <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" 
        	data-bs-toggle="collapse" 
        	data-bs-target="#account-collapse" 
        	aria-expanded="false"
        	id="noticeId">
          고객 센터
        </button>
        <div class="collapse" id="account-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="${ pageContext.request.contextPath }/board/notice?boardId=notice" class="link-dark d-inline-flex text-decoration-none rounded">공지사항(Q&A)</a></li>
            <li><a href="${ pageContext.request.contextPath }/board/lost?boardId=lost" class="link-dark d-inline-flex text-decoration-none rounded">분실물 센터</a></li>
            <li><a href="${ pageContext.request.contextPath }/board/faq?boardId=faq" class="link-dark d-inline-flex text-decoration-none rounded">자주 묻는 질문(FAQ)</a></li>
          </ul>
        </div>
      </li>
    </ul>
  </div>
 

<button id="scrollButton" onclick="scrollToTop()";>
	<img src="https://cdn3.iconfinder.com/data/icons/feather-5/24/chevrons-up-512.png" style="width: 35px; height: 40px;">
</button>


<script>
	const page = '<%= request.getRequestURI() %>';
	console.log(page);
// introduce	
	if(page === '/sportcenter/views/introduce/intro.jsp'){		
		 $('#home-collapse').addClass("show");
		 $('#introId').attr("aria-expanded", "true");
	} else if(page === '/sportcenter/views/introduce/route.jsp'){		
		 $('#home-collapse').addClass("show");
		 $('#introId').attr("aria-expanded", "true");
	} else if(page === '/sportcenter/views/introduce/intro_hello.jsp'){		
		 $('#home-collapse').addClass("show");
		 $('#introId').attr("aria-expanded", "true");
	} else if(page === '/sportcenter/views/introduce/th_introduce.jsp'){		
		 $('#home-collapse').addClass("show");
		 $('#introId').attr("aria-expanded", "true");
// program		 
	} else if(page === '/sportcenter/views/program/list.jsp'){
		$('#dashboard-collapse').addClass("show");	
		$('#programId').attr("aria-expanded", "true");
	} else if(page === '/sportcenter/views/program/swim.jsp'){
		$('#dashboard-collapse').addClass("show");	
		$('#programId').attr("aria-expanded", "true");
	} else if(page === '/sportcenter/views/program/health.jsp'){
		$('#dashboard-collapse').addClass("show");	
		$('#programId').attr("aria-expanded", "true");
	} else if(page === '/sportcenter/views/program/pilates.jsp'){
		$('#dashboard-collapse').addClass("show");	
		$('#programId').attr("aria-expanded", "true");
	} else if(page === '/sportcenter/views/program/tabletennis.jsp'){
		$('#dashboard-collapse').addClass("show");	
		$('#programId').attr("aria-expanded", "true");
	} else if(page === '/sportcenter/views/program/badminton.jsp'){
		$('#dashboard-collapse').addClass("show");	
		$('#programId').attr("aria-expanded", "true");
	} else if(page === '/sportcenter/views/program/yoga.jsp'){
		$('#dashboard-collapse').addClass("show");	
		$('#programId').attr("aria-expanded", "true");
// 수강신청		
	} else if(page === '/sportcenter/views/application/enroll.jsp'){
		$('#orders-collapse').addClass("show");	
		$('#enrollId').attr("aria-expanded", "true");
// 고객센터		
	} else if(page === '/sportcenter/views/board/notice.jsp'){
		$('#account-collapse').addClass("show");	
		$('#noticeId').attr("aria-expanded", "true");
	} else if(page === '/sportcenter/views/board/faq.jsp'){
		$('#account-collapse').addClass("show");	
		$('#noticeId').attr("aria-expanded", "true");
	} else if(page === '/sportcenter/views/board/lost.jsp'){
		$('#account-collapse').addClass("show");	
		$('#noticeId').attr("aria-expanded", "true");
	} else if(page === '/sportcenter/views/board/write.jsp'){
		$('#account-collapse').addClass("show");	
		$('#noticeId').attr("aria-expanded", "true");
	};
    // 스크롤 버튼 보이기/숨기기
    window.onscroll = function() {
        if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
            document.getElementById("scrollButton").style.display = "block";
        } else {
            document.getElementById("scrollButton").style.display = "none";
        }
    };

    // 위로 스크롤 이동
    function scrollToTop() {
        document.body.scrollTop = 0;
        document.documentElement.scrollTop = 0;
    }	
</script>
