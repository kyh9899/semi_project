<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />
<style>
  #main {
    display: flex;
  }
  #box {  
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    width: 100%;
    padding-left: 50px; 
    padding-right: 340px;
  }
  .image-container {
    display: flex;
    justify-content: center;
    width: 100%;
  }
  img {
    width: 300px;
    height: 250px;
  }
  table {
    margin-left: 30px;
  }
  .sidebar {
    min-width: 280px;
    max-width: 280px;
  }
</style>
<body>
  <h2 align="center">프로그램 안내</h2>
  <div id="main">
  <section id="content" style="display: flex; align-items: center;">
    <ul style="display: flex; flex-direction: column;">
    </ul>
    <div class="sidebar">
      <!-- Sidebar content -->
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
            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded"></a></li>
            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded"></a></li>
            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded"></a></li>
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
    </div>
    <section id="content">
      <!-- Content -->
      <div id="box">
 		<div> 		
			<table>
				<tr>
					<td class="image-container">
						<a href="${ path }/views/program/swim.jsp"><img src="${ path }/resources/images/swim.jpg"></a>
					</td>
				</tr>
				<tr>
					<td>
						<a href="${ path }/views/program/swim.jsp">
							<p><span>수영</span></p>
						</a>
						<p>
							수영은 육상에서 하는 운동과 달리...
						</p>
					</td>
				</tr>
			</table>
 		</div>
		<div>
			<table>
				<tr>
					<td class="image-container">
						<a href="${ path }/views/program/health.jsp"><img src="${ path }/resources/images/health.jpg"></a>
					</td>
				</tr>
				<tr>
					<td>
						<a href="${ path }/views/program/health.jsp">
							<p><span>헬스</span></p>
						</a>
						<p>
							헬스클럽에서 기구를 사용하여 하는 운동
						</p>
					</td>
				</tr>
			</table>
		</div>
		<div>
			<table>
				<tr>
					<td class="image-container">
						<a href="${ path }/views/program/pilates.jsp"><img src="${ path }/resources/images/pilates.jpg"></a>
					</td>
				</tr>
				<tr>
					<td>
						<a href="${ path }/views/program/pilates.jsp">
							<p><span>필라테스</span></p>
						</a>
						<p>
							필라테스는 근육강화운동이다.
						</p>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div id="box">
			<div>
				<table>
					<tr>
						<td class="image-container">
							<a href="${ path }/views/program/tabletennis.jsp"><img src="${ path }/resources/images/tabletennis.jpg"></a>
						</td>
					</tr>
					<tr>
						<td>
							<a href="${ path }/views/program/tabletennis.jsp">
								<p><span>탁구</span></p>
							</a>
							<p>
								전신 운동으로서 근지구력을
							</p>
						</td>
					</tr>
				</table>
			</div>
			<div>
				<table>
					<tr>
						<td class="image-container">
							<a href="${ path }/views/program/yoga.jsp"><img src="${ path }/resources/images/yoga.jpg"></a>
						</td>
					</tr>
					<tr>
						<td>
							<a href="${ path }/views/program/yoga.jsp">
								<p><span>요가</span></p>
							</a>
							<p>
								라인을 날씬하게 잡아주는데 도움
							</p>
						</td>
					</tr>
				</table>
			</div>
			<div>
				<table>
					<tr>
						<td class="image-container">
							<a href="${ path }/views/program/badminton.jsp"><img src="${ path }/resources/images/badminton.jpg"></a>
						</td>
					</tr>
					<tr>
						<td>
							<a href="${ path }/views/program/badminton.jsp">
								<p><span>배드민턴</span></p>
							</a>
							<p>
								고강도의 무산소 운동과 유산소 운동
							</p>
						</td>
					</tr>
				</table>
			</div>
	</div>
    </section>
  </div>
 
<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/sidebars.js"></script>
<link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">
<jsp:include page="/views/common/footer.jsp" />