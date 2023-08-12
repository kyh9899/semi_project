<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />

<style>
	h2 {
		margin-bottom: 30px;
	}
	#badminton {
		width: 400px;
		height: 250px;
		margin-bottom: 30px;
		align: center;
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
	.badmintonprogram {
		width: 100%;
		margin-bottom: 10px;
	}
	h5{
		font-weight: bold;
	}
	
	#bt{
		width: 100%;
	}
</style>

<article class="art1" style="width: 60%;"> 
	 <div class="w-[1200px], h-[800px], m-1">
        <div class="w-full, h-1/5, flex, flex-col">      
			<h2 align="center">배드민턴</h2>		
        </div>
        <div class="w-full h-4/5 flex-row flex">
            <div class="h-full w-1/5">
            </div>
            <div class="h-full w-full">
            	<div id="div1">
            		<table class="table-centered">
						<tr>
							<td><img id="badminton" src="${ path }/resources/images/badminton.jpg"></td>
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
							배드민턴은 공이 날아오는 방향으로 빠르게 움직여 민첩성과 집중력 향상에 큰 도움을 주고 공을 치는 격한 움직임으로 스트레스 해소에 탁월합니다.<br> 
							또한 고강도의 무산소 운동과 유산소 운동을 동시에 하는 전신운동으로 호흡 순환계 발달에 큰 효과를 주는 운동입니다.
							</p>
							<h5>▣ 프로그램 안내</h5>
							<img class="badmintonprogram" src="${ path }/resources/images/badmintonpro1.png">
							
							<h5>▣ 강습특징</h5>
							<p>회원들의 관절보호를 위해 특수충격 흡수공법의 인도네시아산 단풍나무 바닥재로 시공한 국제 규격의 배드민턴 코트 9개를 구비하고 국가대표 출신 전문 지도강사를 기용해<br> 
							성인남녀와 청소년을 대상으로 기본 스윙에서 고난도 드롭샷에 이르기까지 체계적인 강습을 제공합니다.<br>
							또한 회원의 다양한 수요를 충족하기 위해 주5일반과 단기속성반, 배드민턴과 헬스를 함께 이용할 수 있는 패키지 프로그램 등 다양한 프로그램을 운영하고 있습니다.
							</p>
							
							<br>
							
							<h5>▣ 강습내용</h5>
							<img class="badmintonprogram" src="${ path }/resources/images/badmintonpro2.png">
							
							<br><br>
							
							<h5>▣ 운동효과</h5>
							<p>
							● 전신운동으로 비만 등 성인병 예방에 효과적<br>
							● 심폐지구력, 근지구력, 유연성, 근력, 순발력, 민첩성 발달<br>
							● 순간 동작의 강도를 기술이나 체력에 맞게 조절하여 심장과 혈액·순환계, 팔, 다리, 배근육 등 강화<br>
							● 정신적 긴장과 스트레스 해소에 탁월한 효과<br>
							● 회원 간 친교 및 동호회 활동 등을 통한 사회성 함양과 삶의 질 향상
							</p>
						</li>
						<li id="mu2">
							<img id="bt" src="${ path }/resources/images/badmitonprg3.png">		
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