<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />

<style>
	.payment{
    text-align: center;
    margin: 30px auto;
    }
    body {
        background-color: white;
    }

    .container1 {
        margin-top: 5px;
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
     .input-group {
    display: flex;
    align-items: center;
  }

  .input-group input[type="text"] {
    margin-right: 5px; /* Adjust this value as needed */
  }
  .payment-button {
  background-color: #455a64; /* 어두운 회색 계열 */
  color: #fff;
  border: none;
  padding: 10px 15px;
  cursor: pointer;
  transition-duration: 0.4s;
  border-radius: 5px;
}

/* 결제하기 버튼 호버 효과 */
.payment-button:hover {
  background-color: ##CCCC99;
}
    
</style>



<article class="art1" style="width: 60%;"> 

<div class="container1">
  <h1 class="text-center my-4">결제 페이지</h1>
	<br><br><br>
	<h2  class="payment" >결제창</h2>
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
            <br><br>
       <div class="form-group">
  		<label for="prinum">주민등록번호:</label>
  		<div class="input-group">
	    <input type="text" name="prinum1" maxlength="6" style="width: 140px;">&nbsp; <a>- </a> &nbsp;&nbsp;<input type="text" name="prinum2" maxlength="1" style="width:20px">
	    <span style="font-size: 1.4em;">●●●●●●</span>
	  </div>
	</div>
          <div class="form-group">
            <label for="cardNumber">카드 번호:</label>
            <input type="text" class="form-control" name="cardNumber" id="cardNumber">
          </div>
          <div class="form-group">
            <label for="date">유효 기간:</label>
            <input type="date" class="form-control" name="datee" id="date">
          </div>
          <div class="form-group">
            <label for="cvc">CVC:</label>
            <input type="text" class="form-control" name="cvc" id="cvc">
         <div class="form-group">
  		<label for="paymentAmount">결제금액:</label>
  		<input type="text" class="form-control" name="paymentAmount" id="paymentAmount" value="${param.price}" readonly>
		</div>
          <button type="submit" class="payment-button btn-block">결제 하기</button>
        </form>
      </div>
    </div>
  </div>
</div>
<article class="art2" style="width: 20%;">
</article>

<%-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">--%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js" defer></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" defer></script>
<link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">
<jsp:include page="/views/common/footer.jsp" />
<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/sidebars.js"></script>