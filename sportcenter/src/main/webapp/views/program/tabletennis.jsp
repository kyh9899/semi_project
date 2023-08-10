<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />

<article class="art1" style="width: 60%;"> 
<style>
	h2 {
		margin-bottom: 30px;
	}
	#swim {
		width: 400px;
		height: 250px;
		margin-bottom: 30px;
	}
	#guide {
		width: 100%;
        max-width: 100%;
        height: auto;
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
	#btn1 {
		margin-bottom: 20px;
		width: 140px;
		height: 50px;
	}
	#btn2 {
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
	#tabletennisprogram {
		width: 1200px;
		margin-bottom: 10px;
	}
	h5, h6{
		font-weight: bold;
	}
</style>

	 <div class="w-[1200px], h-[800px], m-1">
        <div class="w-full, h-1/5, flex, flex-col">      
			<h2 align="center">탁구</h2>		
        </div>
        <div class="w-full h-4/5 flex-row flex">
            <div class="h-full w-1/5">
            </div>
            <div class="h-full w-full">
            	<div id="div1">
            		<table class="table-centered">
						<tr>
							<td><img id="swim" src="${ path }/resources/images/tabletennis.jpg"></td>
						</tr>
					</table>	
					<button id="btn1" onclick="location.href='${ path }/application/enrollment'">온라인 수강신청</button>
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
								탁구는 부상위험이 적은 안전한 운동 중 하나로 공의 방향과 속도를 가늠하는 두뇌 운동이기 때문에 순발력과 반응시간, 판단력이 좋아져 치매 예방에 도움을 줍니다.<br> 
								또한 전신 운동으로서 근지구력을 기르는데 탁월한 운동입니다.
							</p>
							<h5>▣ 프로그램 안내</h5>
							<img id="tabletennisprogram" src="${ path }/resources/images/tabletennisprogram.png">
							<h5>▣ 운동효과, 건강은 물론 생활에 활력을 더해주는 라켓 스포츠</h5>
							<p>
								과격하지 않아 연령과 성별에 관계없이 누구나 즐길 수 있는 탁구는 육체적으로는 심폐지구력과 근력, 근지구력 발달 및 순발력과 유연성, 민첩성 향상에 좋습니다.<br> 
								또한 정신적으로는 집중력을 길러주고 스트레스를 해소하는 데 큰 도움을 주는 스포츠로, 건강을 유지하고 생활에 활력을 불어넣어주는 레크리에이션 종목으로 제격입니다.
							</p>
							<h6>육체적 효과</h6>
							<p>
								● 심폐지구력(안정시 맥박수 감소) 및 근력,근지구력 증가<br>
								● 순발력, 유연성, 민첩성, 조정력 발달(반사신경 기능 향상)<br>
							</p>				
							<h6>정신적 효과</h6>
							<p>
								● 스트레스 해소 및 집중력 강화<br>
								● 소속감, 성취감(만족감),생활에 활기와 즐거움<br>
								● 치매 및 우울증 예방<br>
							</p>				
						</li>
						<li id="mu2">
							<img src="${ path }/resources/images/tabletennisteacher.png">
						</li>
						<li id="mu3">
							<img id="guide" src="${ path }/resources/images/guide.png">
						</li>		
					</ul>
				</div>
				<div id="div2">	
					<button id="btn2" onclick="location.href='${ path }/program/info'">목록으로</button>
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