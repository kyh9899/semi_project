<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/views/common/header.jsp" />

 <section id="content">
 	<h2 align="center">프로그램 안내 페이지</h2>
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
 </section>
<body>
	
</body>
<jsp:include page="/views/common/footer.jsp" />