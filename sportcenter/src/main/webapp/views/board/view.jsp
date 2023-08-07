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
	
	
	
    section>div#board-write-container{width:600px; margin:0 auto; text-align:center;}
    section>div#board-write-container h2{margin:10px 0;}
    table#tbl-board{width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
    table#tbl-board th {width: 125px; border:1px solid; padding: 5px 0; text-align:center;} 
    table#tbl-board td {border:1px solid; padding: 5px 0 5px 10px; text-align:left;}
    div#comment-container button#btn-insert{width:60px;height:50px; color:white; background-color:#3300FF;position:relative;top:-20px;}
    
    /*댓글테이블*/
    table#tbl-comment{width:580px; margin:0 auto; border-collapse:collapse; clear:both; } 
    table#tbl-comment tr td{border-bottom:1px solid; border-top:1px solid; padding:5px; text-align:left; line-height:120%;}
    table#tbl-comment tr td:first-of-type{padding: 5px 5px 5px 50px;}
    table#tbl-comment tr td:last-of-type {text-align:right; width: 100px;}
    table#tbl-comment button.btn-delete{display:none;}
    table#tbl-comment tr:hover {background:lightgray;}
    table#tbl-comment tr:hover button.btn-delete{display:inline;}
    table#tbl-comment sub.comment-writer {color:navy; font-size:14px}
    table#tbl-comment sub.comment-date {color:tomato; font-size:10px}
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
			          <li><a href="${ path }/board/notice" class="link-dark d-inline-flex text-decoration-none rounded">공지사항</a></li>
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
									<input type="button" value="뒤로가기" onclick="location.href='${ path }/board/notice'"> 
									&nbsp;&nbsp;
									<input type="submit" value="등록"> 
									&nbsp;&nbsp;
									<input type="reset" value="지우기">
								</th>
							</tr>
						</table>
					</form>
				</div>
			</section>
<section id="content">   
	<div id="board-write-container">
		<h2>게시판</h2>
		<table id="tbl-board">
			<tr>
				<th>글번호</th>
				<td>${ board.no }</td>
			</tr>
			<tr>
				<th>제 목</th>
				<td>${ board.title }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${ board.writerId }</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${ board.readCount }</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<c:if test="${ empty board.originalFilename }">
						<span> - </span>
					</c:if>
					
					<c:if test="${ not empty board.originalFilename }">
					<%-- 
						<a href="javascript:" id="fileDown">
							<span> ${ board.originalFilename } </span>
						</a>
					--%>
						<a href="${ path }/resources/upload/board/${ board.renamedFilename }"
							download="${ board.originalFilename }" >
							<span> ${ board.originalFilename } </span>
						</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<th>내 용</th>
				<td>${ board.content }</td>
			</tr>
			<%--작성자의 경우 수정/삭제 가능 --%>
			<tr>
				<th colspan="2">
					<c:if test="${ not empty loginMember && loginMember.id == board.writerId }">
						<button type="button" 
							    onclick="location.href='${ path }/board/update?no=${ board.no }'">수정</button>
						<button type="button" id="btnDelete">삭제</button>
					</c:if>
					<button type="button" onclick="location.href='${ path }/board/notice'">목록으로</button>
				</th>
			</tr>
		</table>
		<div id="comment-container">
	    	<div class="comment-editor">
	    		<form action="${ path }/board/reply" method="POST">
	    			<input type="hidden" name="boardNo" value="${ board.no }">
					<textarea name="content" id="replyContent" cols="55" rows="3"></textarea>
					<button type="submit" id="btn-insert">등록</button>	    			
	    		</form>
	    	</div>
	    </div>
		<table id="tbl-comment">
	    	<c:forEach var="reply" items="${ board.replies }">
		    	<tr class="level1">
		    		<td>
		    			<sub class="comment-writer"><c:out value="${ reply.writerId }"/></sub>
		    			<sub class="comment-date"><fmt:formatDate type="date" value="${ reply.createDate }"/></sub>
		    			<br>
		    			<span><c:out value="${ reply.content }"/></span>
		    		</td>
		    		<td>
		    			<c:if test="${ not empty loginMember && loginMember.id == reply.writerId }">
	    					<button class="btn-delete">삭제</button>
    					</c:if>
		    		</td>
		    	</tr>
	    	</c:forEach>
	    </table>
    </div>
</section>
<script>
	$(document).ready(() => {
		$('#fileDown').on('click', () => {
			let oname = encodeURIComponent('${ board.originalFilename }');
			let rname = encodeURIComponent('${ board.renamedFilename }');
			
			console.log(oname, rname);
				
			location.assign('${ path }/board/fileDown?oname=' + oname + '&rname=' + rname);
		});
		
		$('#btnDelete').on('click', () => {
			if (confirm('게시글을 삭제 하시겠습니까?')) {
				location.replace('${ path }/board/delete?no=${ board.no }');
			}
		});
		
		$('#replyContent').on('click', () => {
			if(${ empty loginMember }) {
				alert("로그인 후 이용해주세요!");
				
				$("#userId").focus();				
			}
		});
	});
</script>

<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/sidebars.js"></script>
<link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">
<jsp:include page="/views/common/footer.jsp" />

</body>
</html>