<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />


<style>
	h2 {
		margin-bottom: 30px;
	}
	#health {
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
	#healthprogram {
		width: 100%;
		margin-bottom: 10px;
	}
	h5, h6{
		font-weight: bold;
	}
	
	#ht{
		width: 100%;
	}
</style>

<article class="art1" style="width: 60%;"> 
	 <div class="w-[1200px], h-[800px], m-1">
        <div class="w-full, h-1/5, flex, flex-col">      
			<h2 align="center">헬스</h2>		
        </div>
        <div class="w-full h-4/5 flex-row flex">
            <div class="h-full w-1/5">
            </div>
            <div class="h-full w-full">
            	<div id="div1">
            		<table class="table-centered">
						<tr>
							<td><img id="health" src="${ path }/resources/images/health.jpg"></td>
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
								헬스는 유연성 향상 및 운동상해 예방을 위한 스트레칭과 체조, 무산소 운동인 웨이트 트레이닝(weight training), 그리고 조깅, 사이클 등의 유산소 운동을 병행함으로써 건강하고 균형 잡힌<br>
								신체를 가꾸는 데 기본이 되는 운동입니다.
							</p>
							<h5>▣ 프로그램 안내</h5>
							<img id="healthprogram" src="${ path }/resources/images/healthpro1.png">
							
							<h5>▣ 강습내용</h5>
							<img id="healthprogram" src="${ path }/resources/images/healthpro2.png">
							
							<h5>▣ 운동효과</h5>
							<p>
								● 근섬유의 비대, 모세혈관의 증가, 대사능력의 향상과 관절의 인대 및 건의 강화<br>
								● 관절의 안정성과 모든 운동기능의 향상으로 일상생활에서의 피로 해소<br>
								● 유연성, 심폐지구력 등 심폐기능 향상, 체중조절, 혈당량 감소, 자세교정, 체형개선, 골다공증 및 성인병 예방에 큰 효과<br>
							</p>
							<h6>유연성 운동</h6>
							<p>
								● 체조,스트레칭<br>
								● 운동상해 예방<br>
								● 근육의 스트레스에 의한 운동상해 예방 및 회복<br>
							</p>
							<h6>심폐지구력 운동</h6>
							<p>
								● 사이클,트레드밀<br>
								● 스포츠심장 강화(심장 좌심실 근육증대)<br>
								● 심박출량, 체지방량, 폐활량, 지구력, 최대 산소 섭취능력 증가<br>
								● 산소 부채량 증가(빠른 회복 능력)<br>
							</p>
							<h6>근력 운동</h6>
							<p>
								● 기구운동<br>
								● 근육의 증대<br>
								● 자세 및 체형 교정<br>
								● 힘, 순발력, 근지구력 증가<br>
							</p>
						</li>
						<li id="mu2">
							<table style="margin-bottom: 50px;">
								<tr>
									<td>
										<img style="width: 300px; height: 300px;" src="https://w7.pngwing.com/pngs/565/454/png-transparent-user-computer-icons-anonymity-head-miscellaneous-face-service.png" alt="강사3">
									</td>
									<td style="padding-left: 150px;">
										<h3>정재우</h3>
										<br>
										<h5><i class="fa-regular fa-comment-dots"></i> 구체적이고 체계적인 운동방법을 제시하는 맞춤형 트레이닝을 실시하겠습니다.</h5>
										<br>
										<p>● 생활스포츠지도사 1급</p>
										<p>● 코치아카데미 2급</p>
										<p>● FISAF Korea(퍼스널 트레이너)</p>		
									</td>								
								</tr>
							</table>
							<table>
								<tr>
									<td>
										<img style="width: 300px; height: 300px;" src="https://w7.pngwing.com/pngs/565/454/png-transparent-user-computer-icons-anonymity-head-miscellaneous-face-service.png" alt="강사3">
									</td>
									<td style="padding-left: 150px;">
										<h3>오승민</h3>
										<br>
										<h5><i class="fa-regular fa-comment-dots"></i> 건강한 몸과 건강한 정신! 헬스를 통해 만들어 보아요!</h5>
										<br>
										<p>● 생활스포츠지도사 2급</p>	
									</td>								
								</tr>
							</table>	
						</li>
						<li id="mu3">
							<img id="guideline" src="${ path }/resources/images/guideline.png">
						</li>		
					</ul>
				</div>
				<div id="div2">	
					<button id="button" class="btn btn-secondary" onclick="location.href='${ path }/program/info'">목록으로</button>
				</div>
            </div>
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