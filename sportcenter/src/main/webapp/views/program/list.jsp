<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/views/common/header.jsp" />
<style>
 #box {
 	display: flex;
    justify-content: center;
    margin left: 10px;
 }
 img {
 	width: 300px;
 	height: 250px;
 }
</style>
 <section id="content">
 	<h2 align="center">프로그램 안내 페이지</h2>
 	<div id="box">
 		<div> 		
			<table>
				<tr>
					<td><a href="#"><img src="${ pageContext.request.contextPath }/resources/images/swim.jpg"></a></td>
				</tr>
				<tr>
					<td>
						<a href="#">
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
					<td><a href="#"><img src="${ pageContext.request.contextPath }/resources/images/health.jpg"></a></td>
				</tr>
				<tr>
					<td>
						<a href="#">
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
					<td><a href="#"><img src="${ pageContext.request.contextPath }/resources/images/pilates.jpg"></a></td>
				</tr>
				<tr>
					<td>
						<a href="#">
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
 </section>
<body>
	
</body>
<jsp:include page="/views/common/footer.jsp" />