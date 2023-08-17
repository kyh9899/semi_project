<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />


<style>
	h2 {
		margin-bottom: 30px;
	}
	#yoga {
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
	#yogaprogram {
		width: 100%;
		margin-bottom: 10px;
	}
	h5{
		font-weight: bold;
	}
	
	#img1{
		width: 100%;
	}
</style>

<article class="art1" style="width: 60%;">
	 <div class="w-[1200px], h-[800px], m-1">
        <div class="w-full, h-1/5, flex, flex-col">      
			<h2 align="center">요가</h2>		
        </div>
        <div class="w-full h-4/5 flex-row flex">
            <div class="h-full w-1/5">
            </div>
            <div class="h-full w-full">
            	<div id="div1">
            		<table class="table-centered">
						<tr>
							<td><img id="yoga" src="${ path }/resources/images/yoga.jpg"></td>
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
							<p> 요가는 명상과 호흡, 스트레칭 등이 결합된 복합적인 심신 수련 방법 국민생활체육회로,<br>
							    5천여 년 전 인도에서 유래되었지만 오늘날에는 일상에 지친 현대인들이 긴장과 스트레스를 해소하고 <br>
							    몸과 마음의 건강을 유지할 수 있도록 도와주는 생활스포츠로 인기가 높습니다.</p>
							<h5>▣ 프로그램 안내</h5>
								<img id="yogaprogram" src="${ path }/resources/images/yogapro.png">	   
							 <p>
							   ● 준비물 : 운동복, 샤워도구, 수건
							 </p>   
							  <h5>▣ 강습특징</h5>  
							 <p> 265㎡ 규모의 넓고 쾌적한 요가 강습장을 구비하고 전문 지도강사를 초빙해 체계적인 요가 강습 서비스를 제공하고 있습니다.<br> 
							     건강하고 젊게 살고 싶다면, 척추와 장기의 위치를 바로 잡아주고 기와 혈이 흐르는 경락을 자극해 온몸을 건강하게 만들어주는 요가를 시작해 보세요.
							 </p> 
							  <h5>▣ 교육효과</h5>
							  <p>
							     요가는 몸의 균형을 바로 잡아주고 유연성을 향상시키며, 기혈의 순환을 원활하게 하여 노화 방지와 미용에 효과적입니다.<br>
							     또한 체내 독소와 노폐물 배출을 촉진해 내장기관을 튼튼히 하는 데 도움이 되며,<br>
							     평소 잘 쓰지 않는 근육을 사용하게 되므로 몸의 군살을 없애는 데에도 효과적입니다.<br>
			                     뿐만아니라 스트레스 해소에 도움을 주고 집중력과 기억력을 향상시키는 효과가 있습니다.
							  </p>						  
						</li>
						<li id="mu2">
							<table style="margin-bottom: 50px;">
								<tr>
									<td>
										<img style="width: 300px; height: 300px;" src="https://w7.pngwing.com/pngs/565/454/png-transparent-user-computer-icons-anonymity-head-miscellaneous-face-service.png" alt="강사3">
									</td>
									<td style="padding-left: 150px;">
										<h3>방주아</h3>
										<br>
										<h5><i class="fa-regular fa-comment-dots"></i> 요가와 함께 몸과 마음을 건강하게 지켜보세요.</h5>
										<br>
										<p>● 요가운동처방사 3급자격</p>
										<p>● 요가라이프 지도교사</p>	
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
										<h5><i class="fa-regular fa-comment-dots"></i> 다양한 프로그램 경험을 바탕으로 재미있는 요가강습을 선보이겠습니다.</h5>
										<br>
										<p>● 대한 요가 협회 요가 지도자 자격 취득</p>	
										<p>● 한국아쿠아운동협회 아쿠아피트니스 지도자 자격 취득</p>	
										<p>● 한국아쿠아운동협회 아쿠아요가 지도자 자격 취득</p>	
										<p>● 재저 사이즈 힙합 아카데미 지도자과정 이수</p>	
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