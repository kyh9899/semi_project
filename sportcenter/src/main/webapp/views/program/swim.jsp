<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />

<style>
	h2 {
		margin-bottom: 30px;
	}
	#swim {
		width: 400px;
		height: 250px;
		margin-bottom: 30px;
	}
	
	#guideline {
		width: 100%;
	}
	
	#div1 {
		text-align: center;
	}
	#div2 {
		text-align: center;
		margin-top: 20px;
	}
	.table-centered {
		margin-left: auto;
		margin-right: auto;
	}
	#btn {
		margin-bottom: 20px;
	}
	#button {
		width: 140px;
		height: 50px;
		margin-bottom: 20px;
	}
	.content{
		width:1200px; 
		margin:0 auto;
	}
	ul, li{list-style:none;}
	.tab{padding:0;}
	.tab li{
		float:left;
		width:calc(100% / 3); 
		font-size:16px;
		font-weight:bold;
		height:40px;
		margin-bottom: 15px;
	}
	.tab li a{
		display:block;
		color:#222;
		text-align:center;
		text-decoration:none;
		line-height:40px;
		border:1px solid;
	}
	.tab_con{
		border-top:0;
		padding:0;
	}
	.tab_con li{
		padding:10px;
		font-size:14px;
		color:#333;
	}
	#swimmingprogram2 {
		width: 100%;
		margin-bottom: 10px;
	}
	h5{
		font-weight: bold;
	}
	#p1{
		font-size: 1.2em;
	}
</style>

<article class="art1" style="width: 60%;"/> 
	 <div class="w-[1200px], h-[800px], m-1">
        <div class="w-full, h-1/5, flex, flex-col">      
			<h2 align="center">수영</h2>		
        </div>
        <div class="w-full h-4/5 flex-row flex">
            <div class="h-full w-1/5">
            </div>
            <div class="h-full w-full">
            	<div id="div1">
            		<table class="table-centered">
						<tr>
							<td><img id="swim" src="${ path }/resources/images/swim.jpg"></td>
						</tr>
					</table>	
					<button id="btn" class="btn btn-primary btn-lg" onclick="location.href='${ path }/application/enrollment'"><i class="fa-regular fa-calendar-days"></i> 온라인 수강신청</button>
				</div>
				<div class="content">
					<ul class="tab">
						<li><a href="#mu1" class="selected">강좌소개</a></li>
						<li><a href="#mu2">강사소개</a></li>
						<li><a href="#mu3">수강신청 안내</a></li>
					</ul>
					<ul class="tab_con">
						<li id="mu1">
							<h5>▣ 강좌 개요</h5>
							<p>
								수영은 육상에서 하는 운동과 달리 “자기 체중의 대부분을 지지할 필요가 없으므로 체격 제한이 없고,<br>
								스포츠 종목 중 비교적 운동으로서의 숙달 방법이 단순한 편”(출처 : 스포츠 백과, 2008., 국민생활체육회)이어서 남녀노소 누구나 즐길 수 있는 운동입니다.
							</p>
							<h5>▣ 종합적인 체력단련에 적합한 전신운동</h5>
							<p>
								수영은 물의 저항을 극복하며 앞으로 나아가기 위해 상당한 수준의 근력이나 에너지가 필요한 전신운동으로서,<br>
								“큰 호흡운동을 요구하기 때문에 근육이나 심폐의 발달에 좋으며”(출처 : 스포츠 백과, 2008., 국민생활체육회) 종합적인 체력단련에 적합한 운동입니다.
							</p>
							<h5>▣ 프로그램 안내</h5>
							<img id="swimmingprogram2" src="${ path }/resources/images/swimmingprogram2.png">
							<p id="p1">
								► 개인준비물 : 수영복, 수영보자, 수경, 샤워도구, 수건 <br>
								► 강습시간 이외 자유수영 없음 <br>
								► 강습시간 30분 전 입장/종료시간 30분 전 입장 마감 <br>
								► 강습 종료 후 30분 내 퇴장 <br>
								► 개인운동장비(킥판,헬퍼,오리발,구명조끼,튜브,비치볼 등) 사용금지 <br>
								► 신청한 강습과 등급이 상이한 경우 환불 규정에 따라 환불처리(반 변경 불가) <br>
								► 강습 개시 후 반 변경 불가 <br>
								► 어린이반의 경우 매월 마지막 강습일은 안전교육 및 테스트 <br>
								► 어린이 프로그램 등록 시 연령확인 서류 반드시 지참 <br>
							</p>
						</li>
						<li id="mu2">
							<table style="margin-bottom: 50px;">
								<tr style=" width:100%;">
									<td>									
										<img style="width: 300px; height: 300px;" src="https://w7.pngwing.com/pngs/565/454/png-transparent-user-computer-icons-anonymity-head-miscellaneous-face-service.png" alt="강사3">								
									</td>
									<td style="padding-left: 150px;">									
										<h3>김민상</h3>
										<br>
										<h5><i class="fa-regular fa-comment-dots"></i> 정성을 다해 지도하겠습니다!</h5>
										<br>
										<p>● 동국대학교 체육교육과 졸업</p>
										<p>● 생활스포츠지도사 1급(수영)</p>
										<p>● 수상인명구조원</p>	
									</td>
								</tr>
							</table>
							<table style="margin-bottom: 50px;">
								<tr>
									<td>
										<img style="width: 300px; height: 300px;" src="https://w7.pngwing.com/pngs/565/454/png-transparent-user-computer-icons-anonymity-head-miscellaneous-face-service.png" alt="강사3">
									</td>
									<td style="padding-left: 150px;">
										<h3>문상훈</h3>
										<br>
										<h5><i class="fa-regular fa-comment-dots"></i> 웃음이 가득한 강습반으로 지도하겠습니다.</h5>
										<br>
										<p>● 생활스포츠지도사 2급(수영)</p>
										<p>● 수상인명구조원</p>		
									</td>								
								</tr>
							</table>
							<table style="margin-bottom: 50px;">
								<tr>
									<td>
										<img style="width: 300px; height: 300px;" src="https://w7.pngwing.com/pngs/565/454/png-transparent-user-computer-icons-anonymity-head-miscellaneous-face-service.png" alt="강사3">
									</td>
									<td style="padding-left: 150px;">
										<h3>김민희</h3>
										<br>
										<h5><i class="fa-regular fa-comment-dots"></i> 매일매일 재미있는 수영수업이 되도록 지도하겠습니다.</h5>
										<br>
										<p>● 스포츠의학 전공</p>
										<p>● 생활스포츠지도사 2급(수영)</p>
										<p>● 노인체육지도자</p>		
									</td>								
								</tr>
							</table>
							<table>
								<tr>
									<td>
										<img style="width: 300px; height: 300px;" src="https://w7.pngwing.com/pngs/565/454/png-transparent-user-computer-icons-anonymity-head-miscellaneous-face-service.png" alt="강사3">
									</td>
									<td style="padding-left: 150px;">
										<h3>조수아</h3>
										<br>
										<h5><i class="fa-regular fa-comment-dots"></i> 매일매일 재미있는 수영수업이 되도록 지도하겠습니다.</h5>
										<br>
										<p>● 스포츠의학 전공</p>
										<p>● 생활스포츠지도사 2급(수영)</p>
										<p>● 노인체육지도자</p>		
										<p>● 수상인명구조원</p>		
									</td>								
								</tr>
							</table>
						</li>
						<li id="mu3">
							<img id="guideline" src="${ path }/resources/images/guideline.png">
						</li>		
					</ul>
				</div>
            </div>
        </div>
		<div id="div2">	
			<button id="button" class="btn btn-secondary" onclick="location.href='${ path }/program/info'">목록으로</button>
		</div>
    </div>
<article class="art2" style="width: 20%;">
</article>
<script>
	$(function(){
		$("ul.tab_con li:not("+$(".tab li a.selected").attr("href")+")").hide();
		$(".tab li a").click(function(){
			$(".tab li a").removeClass("selected");
			$(this).addClass("selected");
			$(".tab_con li").hide();
			$($(this).attr("href")).fadeIn();
		});
	});
</script>

<link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">
<jsp:include page="/views/common/footer.jsp" />
<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/sidebars.js"></script>