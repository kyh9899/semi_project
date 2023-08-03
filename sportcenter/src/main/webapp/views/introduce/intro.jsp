<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/views/common/header.jsp" />

<section id="content" style="display: flex; align-items: center;">
    <nav style="width: 200px; height: 400px; background-color: #f2f2f2; padding: 10px;">
        <ul style="display: flex; flex-direction: column;">
            <li style="margin-bottom: 10px;"><a href="#greeting">인사말</a></li>
            <li style="margin-bottom: 10px;"><a href="#map">오시는 길</a></li>
            <li style="margin-bottom: 10px;"><a href="#instructors">강사소개</a></li>
            <li><a href="#facilities">시설 안내</a></li>
        </ul>
    </nav>
    
    <div style="width: 700px;">
        <h2>센터 소개 페이지</h2>
        
        <h3 id="greeting">인사말</h3>
        <!-- 인사말 내용 추가 -->

<h3>오시는 길</h3>
<!DOCTYPE html>
<html>
	<head>
    		<title>Kakao 지도 시작하기</title>
	</head>
        <body>
            <div id="map" style="width:700px;height:550px;margin: 0 auto;">
            <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1c570a4bb062a63d6e8c95aa274b0531"></script>
            <script>
                var container = document.getElementById('map');
                var options = {
                    center: new kakao.maps.LatLng(33.450701, 126.570667),
                    level: 3
                };

                var map = new kakao.maps.Map(container, options);
            </script>
            </div>
           
        </body>
</html>

        <h3 id="instructors">강사소개</h3>
        <!-- 강사소개 내용 추가 -->

        <h3 id="facilities">시설 안내</h3>
        <!-- 시설 안내 내용 추가 -->
    </div>
</section>

<jsp:include page="/views/common/footer.jsp" />
