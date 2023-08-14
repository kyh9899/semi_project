<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />


<style>
	div#board-write-container {
		background-color: #f9f9f9;
		width:1200px;
		margin:0 auto;
		padding-top:5px;
		text-align:center;
		align:left;
		border-top: 2px solid black;
		float: left;
		height: 670px;
	}

	/* 글쓰기 폼 내부 */
	.deco { width: 90%; float:left; }	
		
	h4 { padding-right: 600px;}
		
	table#tbl-board{ width:100%;  margin:0 auto; border-collapse:collapse; clear:both; }
	table#tbl-board th { width: 140px; text-align:center; }
	table#tbl-board th, table#tbl-board td { padding: 5px 0; padding:6px; text-align:center;} 


	/*페이지바*/
	div#pageBar{margin-top:10px; text-align:center; background-color:rgba(0, 188, 212, 0.3);}
	#div-title { align: center; }
	#div-menubar { align:center; margin:20px 50px 0px 150px;  float:left; } 
	#div-notice1 { margin-top: 40px; float:left; }
	#content { align: center; background-color: none; }
	#notice-write { float:left; font-size: 13px;}
	.btn-outline-secondary { float:left; margin-bottom: 5px;}
	.btn-secondary { width:50px; margin-bottom:5px; }
	.search-wrapper { width: 100%; height:50%; margin-bottom: 10px; background-color: lightgray; }
	.sort { width: 10%; margin: 13px 0px 13px 150px; float:left; align: center; }
	.form-control me-2 { width: 400px;  background-color:yellow; align:center; }
	#btn-search { width: 80px; margin-top: 3px;}
	
	
</style>

<article class="art1" style="width: 60%;"> 
	<section id="content">
			<div id="div-title">	
			<h2 align="center">고객센터</h2>    
			</div>
			  
		<div id="rightContent">
		   <div id="div-notice1">
		      <c:if test="${ boardId == 'notice'}">
			     <h4> 공지사항 > 게시글 작성</h4>
			  </c:if>
			  <c:if test="${ boardId == 'faq'}">
			     <h4> 자주묻는질문(FAQ) > 게시글 작성</h4>
			  </c:if>
			  <c:if test="${ boardId == 'question'}">
			     <h4> 1:1 문의게시판 > 게시글 작성</h4>
			  </c:if>
		   </div> 
			
			
			<%-- 게시글 작성 --%>
			<section id="content" style="margin:0px;">
				<div id="board-write-container">
					<form action="${ path }/board/write" method="POST" enctype="multipart/form-data">
						<%-- ✔ 게시판아이디를 hidden 으로 넘겨주면 doPost에서 boardId값을 가져올 수 있다. --%>
						<input type="hidden" name="boardId" value="${ boardId }"> 
						<table id='tbl-board'>
						
							<tr>
								<th>boardId</th>
								<td style="font-weight:bold; text-align:left;">${ boardId }</td>
							</tr>
						
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
							<c:if test="${ boardId == 'faq'}">
								<tr>
									<th>답변</th>
									<td><textarea name="content2" cols="50" rows="15" class="deco"></textarea></td></tr>
								<tr>
							</c:if>
								<th colspan="2">
									<input type="submit" value="등록"> 
									<input type="reset" value="취소">
									<input type="button" value="목록으로" onclick="location.href='${ path }/board/${ boardId }?boardId=${ boardId }'" >
								</th>
							</tr>
						</table>
					</form>
				</div>
				 
			</section>
		</div>
<article class="art2" style="width: 20%;">
</article>


<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.js"></script>
<jsp:include page="/views/common/footer.jsp" />
<script src="${ pageContext.request.contextPath }/resources/js/sidebars.js"></script>
<link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">