<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />

<!DOCTYPE html>
<html>
<head>	
<style>
	div#board-view-container {
		background-color: #f9f9f9;
		width:700px;
		margin:0 auto;
		padding-top:20px;
		padding-bottom:50px;
		text-align:center;
		align:left;
		border-top: 2px solid black;
		float: left;
	}
	h4 { marin-top: 50px; margin-bottom: 10px;}
	
	div#rightContent {
		float:left;
	}
	
	#div-notice1 { margin-top: 40px; float:left; }
	
	table#tbl-board{  margin:0 auto;border-collapse:collapse; clear:both; }
	table#tbl-board th { width: 140px;  padding: 5px 0; text-align:center; }
	table#tbl-board td { padding: 5px 0; width: 90px; text-align:left;} 
	

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
		
	  
		<div id="rightContent">
		    <div id="div-notice1">
		     <h4>공지사항 > 게시글 조회</h4>
		    </div> 
			
			<%-- 게시글 조회 
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
			--%>
			
		<%-- 게시글 조회 --%>
		<section id="content" style="margin:0px;">   
			<div id="board-view-container">
				<h4> [공지] ${ board.title } </h4>
				<table id="tbl-board" style="padding-right:50px;">
					<%-- 
					<tr>
						<th>글번호</th>
						<td>${ board.no }</td>
					</tr>
					 --%>
					<tr>
						<th>작성자</th>
						<td> 
							<c:choose>
							    <c:when test="${ board.writerId == 'admin' }">
							        관리자
							    </c:when>
							    <c:otherwise>
							        ${ board.writerId }
							    </c:otherwise>
							</c:choose>
						</td>
						<th>작성일자</th>
						<td> ${ board.createDate } </td> <%-- @@작성일자추가 --%>
						<th>조회수</th>
						<td>${ board.readCount }</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td colspan="5">
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
						<td colspan="5" style="height: 500px; padding-top:20px; vertical-align:top;">${ board.content }</td>
				
					</tr>
					<%--작성자의 경우 수정/삭제 가능 --%>
					<tr>
						<th colspan="6">
						<%--  
							<c:if test="${ not empty loginMember && loginMember.id == board.writerId }">
								<input type="button" value="수정" onclick="location.href='${ path }/board/update?no=${ board.no }'">
								<input type="button" value="삭제" id="btnDelete">
							</c:if>
						--%>
							<input type="button" value="수정" onclick="location.href='${ path }/board/update?no=${ board.no }'">
							<input type="button" value="삭제" id="btnDelete">
							<input type="button" value="목록으로" id="goBack" >
						</th>
					</tr>
				</table>
				
				<%-- 
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
	     		--%>
		    </div>
	    </div>
	     
	</section>
	
	<script>
		$(document).ready(() => {	
			$('#goBack').on('click', () => {
				location.href = document.referrer;
			});
			
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