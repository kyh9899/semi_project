<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/views/common/header.jsp" />

<section id="content" style="text-align: center;">
    <h2>센터 소개 페이지</h2>
    <h3>오시는 길</h3>
<!DOCTYPE html>
  <html>
    <head>
        <meta charset="utf-8"/>
        <title>Kakao 지도 시작하기</title>
    </head>
    <body>
        <div id="map" style="width:700px;height:400px;margin: 0 auto;"></div>
        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1c570a4bb062a63d6e8c95aa274b0531"></script>
        <script>
            var container = document.getElementById('map');
            var options = {
                center: new kakao.maps.LatLng(33.450701, 126.570667),
                level: 3
            };

            var map = new kakao.maps.Map(container, options);
        </script>
    </body>
   </html>
</section>

<jsp:include page="/views/common/footer.jsp" />
