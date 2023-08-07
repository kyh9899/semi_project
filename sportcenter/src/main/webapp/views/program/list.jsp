<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />
<style>
  #box {  
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    width: 1200px;
  }
  .image-container {
    display: flex;
    justify-content: center;
    width: 100%;
  }
  img {
    width: 300px;
    height: 250px;
  }
  table {
  	float: left;
    margin-left: 30px;
  }
  h2 {
  	margin-bottom: 50px;
  }
</style>
<body>
	<div class="w-[1000px], h-[800px], m-1">
		<div class="w-full, h-1/5, flex, flex-col">
 		 	<h2 align="center">프로그램 안내</h2>
       	</div>
        <div class="w-full h-4/5 flex-row flex">
        <div class="h-full w-1/5">
        	<jsp:include page="/views//MenuBar.jsp" />
        </div>
        <div class="h-full w-full">
			<section id="content">
		      <!-- Content -->
		      <div id="box">
		 		<div> 		
					<table>
						<tr>
							<td class="image-container">
								<a href="${ path }/views/program/swim.jsp"><img src="${ path }/resources/images/swim.jpg"></a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="${ path }/views/program/swim.jsp">
									<p><span>수영</span></p>
								</a>
								<p>
									수영은 육상에서 하는 운동과 달리...
								</p>
							</td>
						</tr>
					</table>
		 		
					<table>
						<tr>
							<td class="image-container">
								<a href="${ path }/views/program/health.jsp"><img src="${ path }/resources/images/health.jpg"></a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="${ path }/views/program/health.jsp">
									<p><span>헬스</span></p>
								</a>
								<p>
									헬스클럽에서 기구를 사용하여 하는 운동
								</p>
							</td>
						</tr>
					</table>
					<table>
						<tr>
							<td class="image-container">
								<a href="${ path }/views/program/pilates.jsp"><img src="${ path }/resources/images/pilates.jpg"></a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="${ path }/views/program/pilates.jsp">
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
			<div id="box">
					<div>
						<table>
							<tr>
								<td class="image-container">
									<a href="${ path }/views/program/tabletennis.jsp"><img src="${ path }/resources/images/tabletennis.jpg"></a>
								</td>
							</tr>
							<tr>
								<td>
									<a href="${ path }/views/program/tabletennis.jsp">
										<p><span>탁구</span></p>
									</a>
									<p>
										전신 운동으로서 근지구력을
									</p>
								</td>
							</tr>
						</table>
					</div>
					<div>
						<table>
							<tr>
								<td class="image-container">
									<a href="${ path }/views/program/yoga.jsp"><img src="${ path }/resources/images/yoga.jpg"></a>
								</td>
							</tr>
							<tr>
								<td>
									<a href="${ path }/views/program/yoga.jsp">
										<p><span>요가</span></p>
									</a>
									<p>
										라인을 날씬하게 잡아주는데 도움
									</p>
								</td>
							</tr>
						</table>
					</div>
					<div>
						<table>
							<tr>
								<td class="image-container">
									<a href="${ path }/views/program/badminton.jsp"><img src="${ path }/resources/images/badminton.jpg"></a>
								</td>
							</tr>
							<tr>
								<td>
									<a href="${ path }/views/program/badminton.jsp">
										<p><span>배드민턴</span></p>
									</a>
									<p>
										고강도의 무산소 운동과 유산소 운동
									</p>
								</td>
							</tr>
						</table>
					</div>
			</div>
		    </section>
            </div>
        </div>
        
    </div>

 
<link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">
<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/sidebars.js"></script>
<jsp:include page="/views/common/footer.jsp" />