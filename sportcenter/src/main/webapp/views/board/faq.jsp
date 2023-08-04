<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/views/common/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>	

<style>
	section #board-list-container{width:700px; height:100%; margin:10px auto; text-align:center;  float:left;}
	section #board-list-container h2{margin:0px 0;}
	table#tbl-board{width:100%;  margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
	table#tbl-board th, table#tbl-board td {border:1px solid transparent; border-top:1px solid black; padding: 5px 0; text-align:center;} 
	/*글쓰기버튼*/
	input#btn-add{float:right; margin: 0 0 15px;}
	/*페이지바*/
	div#pageBar{ margin-top:10px; text-align:center; background-color:rgba(0, 188, 212, 0.3);}
	#div-title { margin:auto; }
	#div-menubar { margin:20px 50px 0px 150px;  float:left; }
	#div-notice1 { margin-top: 40px; }
</style>

</head>
<body>
<section id="content">
	<div id="div-title">	
	<h2 align="center">고객센터</h2>    
	</div>
	<div id="div-menubar" class="flex-shrink-0 p-3 bg-white" style="width: 280px;">
	  <a href="javascript:" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
	    <svg class="bi pe-none me-2" width="30" height="24"><use xlink:href="#bootstrap"/></svg>
	    <span class="fs-5 fw-semibold">MENU</span>
	  </a>
	  <ul class="list-unstyled ps-0">
	    <li class="mb-1">
	      <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">
	        고객 센터
	      </button>
	      <div class="collapse show" id="home-collapse">
	        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
	          <li><a href="${ path }/views/board/notice.jsp" class="link-dark d-inline-flex text-decoration-none rounded">공지사항</a></li>
	          <li><a href="${ path }/views/board/lost.jsp" class="link-dark d-inline-flex text-decoration-none rounded">분실물센터</a></li>
	          <li><a href="${ path }/views/board/faq.jsp" class="link-dark d-inline-flex text-decoration-none rounded">자주하는질문(FAQ)</a></li>
	        </ul>
	      </div>
	    </li>
	  </ul>
	</div>
  
    
    <div id="div-notice1">
     <h4>자주하는질문(FAQ)</h4>
     <p>자주하는 질문과 답변을 알려드립니다.</p>
    </div>
    
       
    <div id="board-list-container">
		<c:if test="${ not empty loginMember }">
			<button type="button" class="btn btn-primary" onclick="location.href='${ path }/board/write'">글쓰기</button>
		</c:if>
		<table id="tbl-board">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>첨부파일</th>
				<th>조회수</th>
			</tr>
			
			<c:if test="${ empty list }">			
				<tr>
					<td colspan="6">
						조회된 게시글이 없습니다.
					</td>
				</tr>	
			</c:if>
			<c:if test="${ not empty list }">
				<c:forEach var="board" items="${ list }">
					<tr>
						<td>${ board.rowNum }</td>
						<td>
							<a href="${ path }/board/view?no=${ board.no}">
								${ board.title }
							</a>
						</td>
						<td>${ board.writerId }</td>
						<td>${ board.createDate }</td>
						<td>
							<c:if test="${ empty board.originalFilename }">
								<span> - </span>
							</c:if>
							
							<c:if test="${ not empty board.originalFilename }">
								<span> ${ board.originalFilename } </span>
							</c:if>
						</td>
						<td>${ board.readCount }</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<div id="pageBar">
			<!-- 맨 처음으로 -->
			<button onclick="location.href='${ path }/board/list?page=1'">&lt;&lt;</button>

			<!-- 이전 페이지로 -->
			<button onclick="location.href='${ path }/board/list?page=${ pageInfo.prevPage }'">&lt;</button>

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

			<!-- 다음 페이지로 -->
			<button onclick="location.href='${ path }/board/list?page=${ pageInfo.nextPage }'">&gt;</button>

			<!-- 맨 끝으로 -->
			<button onclick="location.href='${ path }/board/list?page=${ pageInfo.maxPage }'">&gt;&gt;</button>
		</div>
	</div>
</section>

<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/sidebars.js"></script>
<link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">
<jsp:include page="/views/common/footer.jsp" />
</body>


</html>