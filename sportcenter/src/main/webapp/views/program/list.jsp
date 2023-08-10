<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />
<style>
  .image-container {
    display: flex;
    justify-content: center;
    width: 100%;
  }
  img {
    width: 380px;
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
<article class="art1" style="width: 60%;"> 
<h2 align="center">프로그램 안내</h2>

		      <!-- Content -->

		 		<div> 		
					<table>
						<tr>
							<td class="image-container">
								<a href="${ path }/swim/info"><img src="${ path }/resources/images/swim.jpg"></a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="${ path }/swim/info">
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
								<a href="${ path }/health/info"><img src="${ path }/resources/images/health.jpg"></a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="${ path }/health/info">
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
								<a href="${ path }/pilates/info"><img src="${ path }/resources/images/pilates.jpg"></a>
							</td>
						</tr>
						<tr>
							<td>
								<a href="${ path }/pilates/info">
									<p><span>필라테스</span></p>
								</a>
								<p>
									필라테스는 근육강화운동이다.
								</p>
							</td>
						</tr>
					</table>
				</div>

					<div>
						<table>
							<tr>
								<td class="image-container">
									<a href="${ path }/tabletennis/info"><img src="${ path }/resources/images/tabletennis.jpg"></a>
								</td>
							</tr>
							<tr>
								<td>
									<a href="${ path }/tabletennis/info">
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
									<a href="${ path }/yoga/info"><img src="${ path }/resources/images/yoga.jpg"></a>
								</td>
							</tr>
							<tr>
								<td>
									<a href="${ path }/yoga/info">
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
									<a href="${ path }/badminton/info"><img src="${ path }/resources/images/badminton.jpg"></a>
								</td>
							</tr>
							<tr>
								<td>
									<a href="${ path }/badminton/info">
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
    </div>
</article>
<article class="art2" style="width: 20%;">    

<link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">
<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/sidebars.js"></script>
<jsp:include page="/views/common/footer.jsp" />