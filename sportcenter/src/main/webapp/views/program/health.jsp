<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	h2 {
		margin-bottom: 30px;
	}
	#swim {
		width: 400px;
		height: 250px;
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
		clear:both;
		border-top:0;
		padding:0;
	}
	.tab_con li{
		padding:10px;
		font-size:14px;
		color:#333;
	}
	#healthprogram{
		width: 100%;
	}
</style>
<body>
	<h2 align="center">헬스</h2>
	<div id="div1">
		<table class="table-centered">
			<tr>
				<td><img id="swim" src="${ path }/resources/images/health.jpg"></td>
			</tr>
		</table>	
		
		<br><br>
		
		<button id="btn1" onclick="location.href='${ path }/views/application/list.jsp'">온라인 수강신청</button>
	</div>
	<div class="content">
		<ul class="tab">
			<li><a href="#mu1" class="selected">강좌소개</a></li>
			<li><a href="#mu2">강사소개</a></li>
			<li><a href="#mu4">수강신청 안내</a></li>
		</ul>
		<ul class="tab_con">
			<li id="mu1">
				<h5>▣ 강좌 개요</h5>
				<p>
					헬스는 유연성 향상 및 운동상해 예방을 위한 스트레칭과 체조, 무산소 운동인 웨이트 트레이닝(weight training), 그리고 조깅, 사이클 등의 유산소 운동을 병행함으로써 건강하고 균형 잡힌<br>
					신체를 가꾸는 데 기본이 되는 운동입니다.
				</p>
				<h5>▣ 프로그램 안내</h5>
				<img id="healthprogram" src="${ path }/resources/images/healthprogram.png">
				<br><br>
				<h5>▣ 강습내용</h5>
				<img id="healthprogram" src="${ path }/resources/images/healthprogram2.png">
				<br><br>
				<h5>▣ 운동효과</h5>
				<p>
					● 근섬유의 비대, 모세혈관의 증가, 대사능력의 향상과 관절의 인대 및 건의 강화<br>
					● 관절의 안정성과 모든 운동기능의 향상으로 일상생활에서의 피로 해소<br>
					● 유연성, 심폐지구력 등 심폐기능 향상, 체중조절, 혈당량 감소, 자세교정, 체형개선, 골다공증 및 성인병 예방에 큰 효과<br>
				</p>
			</li>
			<li id="mu2">
				<strong>강사소개</strong>
				
			</li>
			<li id="mu3">
				<strong>요금/시간안내</strong>
				
			</li>
			<li id="mu4">
				<img id="guide" src="${ path }/resources/images/guide.png">
			</li>		
		</ul>
	</div>
	<div id="div2">	
	<button id="btn2" onclick="location.href='${ path }/views/program/list.jsp'">목록으로</button>
	</div>

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
</body>
</html>
<jsp:include page="/views/common/footer.jsp" />