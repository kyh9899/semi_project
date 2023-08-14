<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }" />
<jsp:include page="/views/common/header.jsp" />


<!-- Import Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style>
  body {
    font-family: Arial, sans-serif;
  }
 

  .payment-success {
    text-align: center;
    margin: 30px auto;
    margin-right: calc(50% - 215px); 
    max-width: 700px;
  }

  h1, h2, h3 {
    color: #000000;
    margin-bottom: 30px;
  }

 .finish-btn {
    background-color: #000000;
    border: none;
    color: white;
    padding: 15px 30px;
    text-align: center;
    text-decoration: none;
    font-size: 16px;
    margin: 20px 2px;
    cursor: pointer;
    border-radius: 5px;
  }

  .finish-btn:hover {
    background-color: #3e8e41;
  }
</style>

<div class="payment-success">
  <h1>결제 완료 페이지</h1>
  <br><br>
  <h2>강좌 신청 완료</h2>
  <br><br>
 
  <h3> 결제 완료 및 선택하신 강좌 정상적으로 신청되었습니다. ^_^</h3>
      <br><br>
  <h3>완료 버튼을 누르면 홈 화면으로 돌아갑니다</h3>
  <br><br>
  <a href="/sportcenter/" class="finish-btn">완료</a>
</div>

	<link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">
	<jsp:include page="/views/common/footer.jsp" />
	<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/sidebars.js"></script>

