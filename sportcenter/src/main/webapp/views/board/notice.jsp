<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/views/common/header.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>


<style>

	section #board-list-container{width:700px; height:100%; margin:10px auto; text-align:center;  float:left;}
	section #board-list-container h2{margin:0px 0;}
	/* 게시글 목록 표 */
	table#tbl-board{ width:100%;  margin:0 auto; border-collapse:collapse; border-top: 2px solid black; clear:both; }
	table#tbl-board th {  background-color: #f9f9f9; }
	table#tbl-board th, table#tbl-board td {border:1px solid transparent; padding: 5px 0; text-align:center;} 

	/*페이지바*/
	div#pageBar{margin-top:10px; text-align:center; }
	#div-title { align: center; }
	#div-menubar { align:center; margin:20px 50px 0px 150px;  float:left; } 
	
	#div-notice1 { margin-top: 40px; float:left; align: center; }
	#content { align: center;  background-color:yellow;  }
	#notice-write { float:left; font-size: 13px;}
	
	/* 검색 바 */	
	#searchbar { width:90%; float:left; height:30px; padding-left:250px; margin-bottom: 20px;  }
	
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

<article class="art1" style="width: 60%;" items="notice1"> 
	
		<div id="div-title">	
		<h2 align="center">고객센터</h2>    
		
		
	
	
	    <div id="div-notice1" align="center">
	     <h4>공지사항</h4>
	     <p>새로운 소식을 알려드립니다.</p>
    
	    
		<div id="board-list-container">
			 <%--  
			<c:if test="${ not empty loginMember }">
				<button class="btn btn-sm btn-outline-secondary" type="button">글쓰기</button><br>
			</c:if>
			--%>
				
				<%-- 검색기능_필요시 활성화
	            <div class="search-wrapper">
	                <fieldset class="search">
	                    
	                    <select class="sort" title="검색조건">
	                        <option value="1">전체</option>
	                        <option value="1">제목</option>
	                        <option value="1">내용</option>
	                        <option value="1">작성자</option>
	                    </select>
	                    
	                    <nav class="navbar bg-body-tertiary">
						  <div class="container-fluid">
						    <form class="d-flex" role="search">
						      <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
						      <button type="button" id="btn-search" class="btn btn-secondary btn-sm">검색</button>
						    </form>
						  </div>
						</nav>
						
	                </fieldset>
	            </div>
	             --%>  		
			
			<div>
				<div id="writebutton">
				<button class="btn btn-sm btn-outline-secondary" type="button" onclick="location.href='${ path }/board/write'">글쓰기</button>
				</div>
				<div id="searchbar">
					<form action="${ path }/board/search" method="POST" name="search" style="margin-right:0px;">
						<table class="pull-right">
							<tr>
								<td><select class="form-control" name="searchField">
										<option value="0">선택</option>
										<option value="bbsTitle">제목</option>
										<option value="userId">작성자</option>
								</select></td>
								<td><input type="text" class="form-control"
									placeholder="검색어 입력" name="searchText" maxlength="100"></td>
								<td><button type="submit" class="btn btn-secondary ">검색</button></td>
								
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
						<tr>
							<td>${ board.no }</td>
							<td>
								<a href="${ path }/board/view?no=${ board.no }" class="updateCount">
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
			    
			
			</div>
			
			<div id="pageBar">
			<!-- 맨 처음으로 -->
			    <button onclick="location.href='${ path }/board/notice?boardId=notice1&page=${ pageInfo.startPage }'">&lt;&lt;</button>
			    	
				<!-- 이전 페이지로 -->
				<button onclick="location.href='${ path }/board/notice?boardId=notice1&page=${ pageInfo.prevPage }'">&lt;</button>
	
				<!--  10개 페이지 목록 -->
				<c:forEach var="current" begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }">
					<c:choose>
						<c:when test="${ current == pageInfo.currentPage }">					
							<button disabled>${ current }</button>			
						</c:when>
						<c:otherwise>
							<button onclick="location.href='${ path }/board/notice?boardId=notice1&page=${ current }'">${ current }</button>			
						</c:otherwise>
					</c:choose>
				</c:forEach>
	
				<!-- 다음 페이지로 -->
				<button onclick="location.href='${ path }/board/notice?boardId=notice1&page=${ pageInfo.nextPage }'">&gt;</button>
	
				<!-- 맨 끝으로 -->
				<button onclick="location.href='${ path }/board/notice?boardId=notice1&page=${ pageInfo.maxPage }'">&gt;&gt;</button>
			</div>
		</div>
		</div>
		</div>
	</section>
	<script>
		$(document).ready(() => {
			$('.updateCount').on('click', () => {
				if (confirm('조회수를 증가 하시겠습니까?')) {
					location.assign('${ path }/board/view');
			      
			    }		
			}		
		});
	</script>
<article class="art2" style="width: 20%;">
       
</article>

<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/sidebars.js"></script>
<link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">
<jsp:include page="/views/common/footer.jsp" />