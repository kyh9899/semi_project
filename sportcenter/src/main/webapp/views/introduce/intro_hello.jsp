<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/views/common/header.jsp" />


<article class="art1" style="width: 60%;"> 
<table>
	<div>
        <td><div style="margin-bottom: 20px; padding-top: 47px;"> <!-- Add margin to create space between image and text -->
         <img src="https://www.ksponco.or.kr/sports/img/olparkswim/intro.jpg" alt="올림픽수영장 직원일동" class="sign" style="width: 600px; height: 550px;"/>
         </div></td>
    <div class="cont">
            <th style="font-size: 19px;"><div class="txt_box" style="width: 600px; border: 1px; padding: 20px;">
                <p>올림픽수영장은 88서울올림픽수영경기가 열린 곳으로, 국제 규격의 50m 레인과 깨끗한 수질, 우수한 강사진들의 열정적인 지도로 대한민국을 대표하는 생활체육의 장으로 자리매김하고 있습니다. </p>
                <p>그러나 이에 만족하지 않고 더욱 쾌적하고 안전한 환경에서 운동을 즐기실 수 있도록 2007년 리모델링 공사를 실시한 바 있습니다. </p>
                <p>리모델링 공사를 통하여 수영 외에도 헬스, 스피닝바이크, 가요교실 등 다양한 스포츠, 문화교실 프로그램을 운영하고 있습니다. 또한 스포츠용품점, 편의점, 식당, 잡화점 등 고객편의시설을 확충하여 여러분께서 올림픽수영장을 편리하게 이용하실 수 있도록 노력하고 있습니다. </p>
                <p>아무쪼록 종합스포츠문화공간으로 거듭난 올림픽수영장에서 즐겁고 활기찬 시간을 보내시기 바라며 여러분들께서 이용하시는 데 불편함이 없도록 올림픽수영장 전 직원은 최선을 다하겠습니다. </p>
                <p><strong>  감사합니다.</strong></p>
            </div></th>
    </div>
</div>
</table>
</article>

 <article class="art2" style="width: 20%;">
        <p>현재 접속중인 사용자: <span id="MB_ID"></span></p>
    </article>

    <script>
        // 서버에서 현재 접속중인 사용자 정보를 가져오는 함수
        function getCurrentUser() {
            // 실제 서버 URL을 여기에 입력하세요.
            const serverUrl = "/CCU";

            $.ajax({
                url: serverUrl,
                type: "GET",
                success: function(response) {
                    const userNameElement = document.getElementById("MB_ID");
                    userNameElement.textContent = response;
                },
                error: function() {
                    console.error("서버와의 통신 중 오류 발생");
                }
            });
        }

        // 페이지 로딩 시 현재 접속중인 사용자 표시
        $(document).ready(function() {
            getCurrentUser();
        });
    </script>

<link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">
<jsp:include page="/views/common/footer.jsp" />
<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/sidebars.js"></script>