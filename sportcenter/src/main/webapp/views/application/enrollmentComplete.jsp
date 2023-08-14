<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<jsp:include page="/views/common/header.jsp" />


<!-- Import Bootstrap CSS -->


<style>

  .payment-success {
    text-align: center;
    margin: 30px auto;
   
    max-width: 700px;
  }

  h1, h2, h3 {
    color: #000000;
    margin-bottom: 30px;
  }

 /* 완료 버튼에도 적용된 스타일 */
.finish-btn {
  display: inline-block;
  text-decoration: none;
  background-color: #455a64; /* 어두운 회색 계열 */
  color: #fff;
  border: none;
  padding: 25px 55px;
  cursor: pointer;
  transition-duration: 0.4s;
  border-radius: 5px;
}

/* 완료 버튼 호버 효과 */
.finish-btn:hover {
  background-color: #CCCC99;
}
 .pay{
 font-weight: bold;

 }  
 .home2{
 color: #0033FF; /* 원하는 글씨 색상으로 변경하세요 */
  text-shadow: 1px 1px 2px #888888; /* 입체감있게 만드는 텍스트 그림자 설정 */
}
 
 
 

</style>

<article class="art1" style="width: 60%;"> 
<div>
<div class="payment-success">
  <h2>결제 완료 페이지</h2>
  <br><br><br><br><br><br>
  <%-- <h4 class="pay">강좌 신청 완료</h4>--%>
  <br><br>
 
  <h5 class="pay"> 결제 완료 및 선택하신 강좌 정상적으로 신청되었습니다. <br></h5>
   <h3>^_^</h3>
      <br><br><br><br>
  <h3 class="home2">완료 버튼을 누르면 홈 화면으로 돌아갑니다</h3>
  <br><br>
  <a href="/sportcenter/" class="finish-btn">완료</a>
</div>
</div>
<article class="art2" style="width: 20%;">
</article>

<link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">
<jsp:include page="/views/common/footer.jsp" />
<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/sidebars.js"></script>
