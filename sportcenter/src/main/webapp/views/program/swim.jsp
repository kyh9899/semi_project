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
		width: 1200px;
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
			<h2 align="center">수영</h2>		
        </div>
        <div class="w-full h-4/5 flex-row flex">
            <div class="h-full w-1/5">
            	<jsp:include page="/views//MenuBar.jsp" />
            </div>
            <div class="h-full w-full">
            	<div id="div1">
            		<table class="table-centered">
						<tr>
							<td><img id="swim" src="${ path }/resources/images/swim.jpg"></td>
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
								수영은 육상에서 하는 운동과 달리 “자기 체중의 대부분을 지지할 필요가 없으므로 체격 제한이 없고,<br>
								스포츠 종목 중 비교적 운동으로서의 숙달 방법이 단순한 편”(출처 : 스포츠 백과, 2008., 국민생활체육회)이어서 남녀노소 누구나 즐길 수 있는 운동입니다.
							</p>
							<h5>▣ 종합적인 체력단련에 적합한 전신운동</h5>
							<p>
								수영은 물의 저항을 극복하며 앞으로 나아가기 위해 상당한 수준의 근력이나 에너지가 필요한 전신운동으로서,<br>
								“큰 호흡운동을 요구하기 때문에 근육이나 심폐의 발달에 좋으며”(출처 : 스포츠 백과, 2008., 국민생활체육회) 종합적인 체력단련에 적합한 운동입니다.
							</p>
							<h5>▣ 프로그램 안내</h5>
							<img id="swimmingprogram" src="${ path }/resources/images/swimmingprogram.png">
							<p>
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
							<img src="${ path }/resources/images/swimteacher.png">
							<img id="img1" src="${ path }/resources/images/swimteacher2.png">
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