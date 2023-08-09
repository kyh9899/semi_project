<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/views/common/header.jsp" />

<article class="art1" style="width: 60%;"> 
<section id="content"  align-items: center;  style=" width: 1300px;">
    <ul flex-direction: column; float:left;"></ul>

 <h2 align="center">오시는 길</h2>
	<link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">
            <div id="map" style="width:1230px; float:center; height:700px; margin:10 auto;" align="right" >
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
	<link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">

</section>
</article>
<article class="art2" style="width: 20%;">




<jsp:include page="/views/common/footer.jsp" />
<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/sidebars.js"></script>