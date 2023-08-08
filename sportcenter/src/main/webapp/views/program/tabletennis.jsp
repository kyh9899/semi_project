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
		margin-bottom: 30px;
		margin-right: 380px;
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
		margin-right: 380px;
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
	#swimmingprogram {
		width: 900px;
		margin-bottom: 10px;
	}
	#img1{
		margin-top: 30px;
	}
	h5{
		font-weight: bold;
	}
</style>
<body>
	 <div class="w-[1200px], h-[800px], m-1">
        <div class="w-full, h-1/5, flex, flex-col">      
			<h2 align="center">탁구</h2>		
        </div>
        <div class="w-full h-4/5 flex-row flex">
            <div class="h-full w-1/5">
            	<jsp:include page="/views//MenuBar.jsp" />
            </div>
            <div class="h-full w-full">
            	<div id="div1">
            		<table class="table-centered">
						<tr>
							<td><img id="swim" src="${ path }/resources/images/tabletennis.jpg"></td>
						</tr>
					</table>	
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
					탁구는 부상위험이 적은 안전한 운동 중 하나로 공의 방향과 속도를 가늠하는 두뇌 운동이기 때문에 순발력과 반응시간, 판단력이 좋아져 치매 예방에 도움을 줍니다.<br> 
					또한 전신 운동으로서 근지구력을 기르는데 탁월한 운동입니다.
				</p>
				<h5>▣ 프로그램 안내</h5>
				<img src="${ path }/resources/images/tabletennisprogram.png">				
			</li>
			<li id="mu2">
				
				
			</li>
			<li id="mu3">
				
				
			</li>
			<li id="mu4">
				<img id="guide" src="${ path }/resources/images/guide.png">
			</li>		
		</ul>
				</div>
				<div id="div2">	
					<button id="btn2" onclick="location.href='${ path }/views/program/list.jsp'">목록으로</button>
				</div>
            </div>
        </div>
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
<link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">
<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/sidebars.js"></script>
<jsp:include page="/views/common/footer.jsp" />