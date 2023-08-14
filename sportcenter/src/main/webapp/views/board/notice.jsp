<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />


<style>

	section #board-list-container{width:1200px; height:100%; margin:10px auto; text-align:center;  float:left;}
	section #board-list-container h2{margin:0px 0;}
	/* 게시글 목록 표 */
	table#tbl-board{ width:100%;  margin:0 auto; border-collapse:collapse; border-top: 2px solid black; clear:both; }
	table#tbl-board th {  background-color: #f9f9f9; }
	table#tbl-board th, table#tbl-board td { border:1px solid transparent; padding: 5px 0; text-align:center; } 
	table#tbl-board tr:hover { background-color: #D5E3F4; cursor:pointer; }

	/*페이지바*/
	div#pageBar{margin-top:10px; text-align:center; }
	#div-title { align: center; }
	#div-menubar { align:center; margin:20px 50px 0px 150px;  float:left; } 
	
	#div-notice1 { margin-top: 40px; float:left; align: center; }
	#content { align: center;  background-color:yellow;  }
	#notice-write { float:left; font-size: 13px;}
	
	/* 검색 바 */	
	#searchbar { width:90%; float:left; height:30px; padding-left:700px; margin-bottom: 20px;  }
	
	/* 글쓰기 버튼 */ 
	#writebutton { width:10%; float:left; }
	.btn-outline-secondary { margin-top:5px; }
	.btn-secondary { width:60px; }
	.search-wrapper { width: 100%; height:50%; margin-bottom: 10px; background-color: lightgray; }
	.sort { width: 10%; margin: 13px 0px 13px 150px; float:left; align: center; }
	.form-control me-2 { width: 400px;  background-color:yellow; align:center; }
	#btn-search { width: 80px; margin-top: 3px;}
	#content-none { height: 300px;}

</style>

<article class="art1" style="width: 60%;"> 
	<div id="div-title">	
		<h2 align="center">고객센터</h2>    
		

	    <div id="div-notice1">
	     <h4>공지사항</h4>
	     <p>새로운 소식을 알려드립니다.</p>
    
	    
		<div id="board-list-container">			
			<div>
				<div id="writebutton">
					<%-- 관리자의 경우에만 글쓰기 가능 --%>
					<c:choose>
					    <c:when test="${ not empty loginMember && loginMember.id == 'admin' }">
					        <button class="btn btn-sm btn-outline-secondary" type="button" onclick="location.href='${ path }/board/write?boardId=${ boardId }'">글쓰기</button>
					    </c:when>
					    <c:when test="${ empty loginMember || loginMember.id != 'admin' }">
					        <button class="btn btn-sm btn-outline-secondary" type="button" onclick="location.href='${ path }/board/write?boardId=${ boardId }'" disabled>글쓰기</button>
				    	</c:when>
					</c:choose>
				</div>
				<div id="searchbar">
					<form action="${ path }/board/notice?boardId=${ boardId }" method="GET" name="searchInput" style="margin-right:0px;">
						<%-- ✔ 게시판아이디를 hidden으로 넘겨주면 doPost에서 boardId값을 가져올 수 있다. --%>
						<input type="hidden" name="boardId" value="${ boardId }"> 
						<table class="pull-right">
							<tr>
								<td><select class="form-control" name="searchField">
										<option value="0">선택</option>
										<option value="title">제목</option>
										<option value="content">작성자</option>
										<option value="userId">작성자</option>										
								</select></td>
								<td><input type="text" class="form-control"
									placeholder="검색어 입력" name="searchText" maxlength="100"></td>
								<td><button type="submit" class="btn btn-secondary">검색</button></td>
							</tr>		
						</table>
					</form>
				</div>
			</div>
					
			<br>
			
			<table id="tbl-board">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>첨부파일</th>
					<th>조회수</th>
				</tr>
				
				<%-- 게시글이 없는 경우 --%>
				<c:if test="${ empty list }">			
					<tr>
						<td colspan="6" id="content-none">
							조회된 게시글이 없습니다.
						</td>
					</tr>	
				</c:if>
				
				<%-- 게시글이 있는 경우 --%>
				<c:if test="${ not empty list }">
					<%-- 조회수를 역순으로 출력 --%>
					<c:forEach var="board" items="${ list }">
						<%-- 행에 마우스를 올려놓으면 효과 및 해당하는 게시글로 이동 --%>
						<tr class="clickable-row" href="${path}/board/view?boardId=${ boardId }&no=${ board.no }">
							<td>${ board.no }</td>
							<td>${ board.title }</td>
							<td>${ board.writerId }</td>
							<td>${ board.createDate }</td>
							<td>
								<%-- 파일이 없는 경우 ' - ' 표시 --%>
								<c:if test="${ empty board.originalFilename }">
									<span> - </span>
								</c:if>									
								<%-- 파일이 있는 경우 '파일명' 표시 --%>
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
			    <button onclick="location.href='${ path }/board/notice?boardId=${ boardId }&page=${ pageInfo.startPage }'">&lt;&lt;</button>
			    	
				<!-- 이전 페이지로 -->
				<button onclick="location.href='${ path }/board/notice?boardId=${ boardId }&page=${ pageInfo.prevPage }'">&lt;</button>
	
				<!--  10개 페이지 목록 -->
				<c:forEach var="current" begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }">
					<c:choose>
						<c:when test="${ current == pageInfo.currentPage }">					
							<button disabled>${ current }</button>			
						</c:when>
						<c:otherwise>
							<button onclick="location.href='${ path }/board/notice?boardId=${ boardId }&page=${ current }'">${ current }</button>			
						</c:otherwise>
					</c:choose>
				</c:forEach>
	
				<!-- 다음 페이지로 -->
				<button onclick="location.href='${ path }/board/notice?boardId=${ boardId }&page=${ pageInfo.nextPage }'">&gt;</button>
	
				<!-- 맨 끝으로 -->
				<button onclick="location.href='${ path }/board/notice?boardId=${ boardId }&page=${ pageInfo.maxPage }'">&gt;&gt;</button>
			</div>
		</div>
		</div>
		</div>
	</section>
<article class="art2" style="width: 20%;">
       
</article>

	<script>
		// 각 행을 클릭할 때 링크로 연결되도록 처리
		  var rows = document.querySelectorAll(".clickable-row");
		  rows.forEach(function(row) {
		    row.addEventListener("click", function() {
		      var href = row.getAttribute("href");
		      if (href) {
		        window.location.href = href;
		      }
		    });
		  });
	</script>


<link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">
<jsp:include page="/views/common/footer.jsp" />
<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/sidebars.js"></script>