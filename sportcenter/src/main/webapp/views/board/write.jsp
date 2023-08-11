<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />


<style>
	div#board-write-container {
		background-color: #f9f9f9;
		width:700px;
		margin:0 auto;
		padding-top:5px;
		text-align:center;
		align:left;
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
	#div-notice1 { margin-top: 40px; float:left; }
	#content { align: center; }
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
		     <h4 align="center">공지사항 > 게시글 작성</h4>
		   </div> 
			
			<%-- 게시글 작성 폼 --%>
			<section id="content" style="margin:0px;">
				<div>
					<form action="${ path }/board/write" method="POST" enctype="multipart/form-data">
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
									<input type="reset" value="취소">
									<input type="button" value="목록으로" onclick="location.href='${ path }/board/notice'"> 
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