<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />
<style>
    body {
        background-color: #f4f4f4;
    }

    .container {
        max-width: 600px;
        margin-top: 80px;
    }

    .card {
        border-radius: 12px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, .1);
    }

    .card-title {
        font-weight: bold;
    }
    .title {  
        font-family: "Roboto", sans-serif;
        font-size: 24px;
        font-weight: bold;
        color: #0077B5;
        text-shadow: 2px 2px 3px rgba(0, 0, 0, 0.3);
    }


</style>




<div class="container">
  <h2 class="text-center my-4">결제 페이지</h2>

  <div class="col-md-6 mx-auto">
  
    <div class="card">
      <div class="card-header">
      	<h3 class="title" align="center">${ param.kind }</h3>
        <h4 class="card-title m-0">카드 정보 입력</h4>
      </div>
      <div class="card-body">
        <form action="${path}/paymentservlet" method="GET">
          <div class="form-group">
            <label for="cardName">사용자 이름:</label>
            <input type="text" class="form-control" name="cardName" id="cardName">
          </div>
          <div class="form-group">
            <label for="cardNumber">카드 번호:</label>
            <input type="text" class="form-control" name="cardNumber" id="cardNumber">
          </div>
          <div class="form-group">
            <label for="expiryDate">유효 기간:</label>
            <input type="text" class="form-control" name="expiryDate" id="expiryDate">
          </div>
          <div class="form-group">
            <label for="cvc">CVC:</label>
            <input type="text" class="form-control" name="cvc" id="cvc">
          </div>
          <button type="submit" class="btn btn-primary btn-block">결제 하기</button>
        </form>
      </div>
    </div>
  </div>
</div>
<jsp:include page="/views/common/footer.jsp" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" defer></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" defer></script>
<link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">
<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/sidebars.js"></script>
