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
	#pilates {
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
	#pilatesprogram {
		width: 100%;
		margin-bottom: 10px;
	}
	h5{
		font-weight: bold;
	}
	
	#pt{
		width: 100%;
	}
</style>

	 <div class="w-[1200px], h-[800px], m-1">
        <div class="w-full, h-1/5, flex, flex-col">      
			<h2 align="center">필라테스</h2>		
        </div>
        <div class="w-full h-4/5 flex-row flex">
            <div class="h-full w-1/5">
            </div>
            <div class="h-full w-full">
            	<div id="div1">
            		<table class="table-centered">
						<tr>
							<td><img id="pilates" src="${ path }/resources/images/pilates.jpg"></td>
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
								필라테스(pilates)는 제1차 세계대전 당시 영국 랭커스터 포로수용소에서 인턴으로 근무하던 독일의 스포츠 연구가,<br> 
								요제프 필라테스가 포로들의 운동부족과 재활치료, 정신수련을 위해 고안한 근육강화 운동입니다.
							</p>	
							<h5>▣운동효과, 건강하고 아름다운 보디라인을 위한 필수운동</h5>
							<p>	복부와 둔부를 강화하기 위한 반복적인 동작을 통하여 자세를 바로잡고 <br>
							    몸의 균형과 힘,유연성을 증대시킬 수 있어 건강하고 아름다운 보디라인을 가꾸는 데 도움이 됩니다.<br>
								또한 일상생활에서 오는 긴장과 스트레스도 해소할 수 있습니다.<br>
								자세교정 및 구체적인 근력강화, 유연성 향상	상해방지 및 재활에 효과적 입니다.</p>
							<h5>▣ 프로그램 안내</h5>	
							<img id="pilatesprogram" src="${ path }/resources/images/pilatespro.png">	
							
							<h5>▣ 강습 방법</h5>
							<p>
							 ● 반복된 동작을 통해 연속적으로 근육을 단련시키며 통증 없이 근육을 강화시킵니다.<br><br>
							 ● 특히 아랫배와 엉덩이 부분을 파워하우스(Power House)라고 부르며 이 부위를 단련시키는 것이 기본.<br><br>
							 ● 사용하는 근육의 움직임에 집중하고, 강도를 조절하며 정확한 동작을 이루어야 합니다.<br><br>
							 ● 몸의 중심이 되는 척추를 바로잡기 위하여 파워하우스 중심으로 운동합니다.<br><br>
							 ● 또, 동작마다 고유의 호흡 패턴이 있어 이를 따라야 운동효과를 최대화할 수 있습니다.<br><br>
							 ● 각 동작을 할 때에는 정신을 집중하며, 한 동작에서 다음 동작으로 연결할 때에는 부드럽고 유연하게 흐름을 따라 움직입니다.
							 </p>		
						</li>
						<li id="mu2">
							<img id="pt" src="${ path }/resources/images/pilatesprogram2.png">
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