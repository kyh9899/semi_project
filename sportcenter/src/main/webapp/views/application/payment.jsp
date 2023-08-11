<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

<jsp:include page="/views/common/header.jsp" />

<div class="container">
  <h2 class="text-center my-4">결제 페이지</h2>

  <div class="row justify-content-center">
    <div class="col-sm-12 col-md-8">
      <div class="card">
        <div class="card-body">
          <h4 class="text-center">카드 정보 입력</h4>
          <form action="${path}/application/completePayment" method="post">
              <div class="form-group">
                <label for="cardNumber">카드 번호:</label>
                <input type="text" class="form-control" name="cardNumber" id="cardNumber" required>
              </div>
              <div class="form-group">
                <label for="expiryDate">유효 기간:</label>
                <input type="text" class="form-control" name="expiryDate" id="expiryDate" required>
              </div>
              <div class="form-group">
                <label for="cvc">CVC:</label>
                <input type="text" class="form-control" name="cvc" id="cvc" required>
              </div>
              <button type="submit" class="btn btn-primary btn-block">결제</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

<jsp:include page="/views/common/footer.jsp" />

</body>
</html>

