<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />

<!DOCTYPE html>
<html>
<head>	
<style>
	div#board-write-container {
		background-color: #f9f9f9;
		width:650px;
		margin:0 auto;
		padding-top:5px;
		text-align:center;
		border-top: 2px solid black;
		float: left;
	}
	
	/* 글쓰기 폼 내부 */
	.deco { width: 90%; float:left; }	
		
		
	table#tbl-board{width:100%;  margin:0 auto;border-collapse:collapse; clear:both; }
	table#tbl-board th { width: 140px; text-align:center; }
	table#tbl-board th, table#tbl-board td { padding: 5px 0; text-align:center;} 


	/*페이지바*/
	div#pageBar{margin-top:10px; text-align:center; background-color:rgba(0, 188, 212, 0.3);}
	#div-title { align: center; }
	#div-menubar { align:center; margin:20px 50px 0px 150px;  float:left; } 
	#div-notice1 { margin-top: 40px; }
	#content { align: center; }
	#notice-write { float:left; font-size: 13px;}
	.btn-outline-secondary { float:left; margin-bottom: 5px;}
	.btn-secondary { width:50px; margin-bottom:5px; }
	.search-wrapper { width: 100%; height:50%; margin-bottom: 10px; background-color: lightgray; }
	.sort { width: 10%; margin: 13px 0px 13px 150px; float:left; align: center; }
	.form-control me-2 { width: 400px;  background-color:yellow; align:center; }
	#btn-search { width: 80px; margin-top: 3px;}
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
			      
			      <%-- 좌측 메뉴바 --%>
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
		     <h4>공지사항 > 게시글 작성</h4>
		    </div> 
			
			<%-- 게시글 작성 폼 --%>
			<section id="content">
				<div id='board-write-container'>
					<form action="${ path }/board/write" method="POST"  enctype="multipart/form-data">
						<table id='tbl-board'>
							<tr>
								<th>제목</th>
								<td><input type="text" name="title" class="deco"></td>
							</tr>
							<tr>
								<th>작성자</th>
								<td><input type="text" name="writer" class="deco" value="${ loginMember.id }" readonly></td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td><input type="file" name="upfile" class="deco"></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea name="content" cols="50" rows="15" class="deco"></textarea></td>
							</tr>
							<tr>
								<th colspan="2">
									<input type="submit" value="등록"> 
									&nbsp;&nbsp;
									<input type="reset" value="취소">
								</th>
							</tr>
						</table>
					</form>
				</div>
			</section>

<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/sidebars.js"></script>
<link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">
<jsp:include page="/views/common/footer.jsp" />

</body>
</html>