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
  background-color: #CCCC99;
}

.payment-amount {
  font-weight: bold; /* 글자 두께를 두꺼운 (bold)로 설정 */
  color: #000; /* 글자 색상을 진한 검정색으로 설정 */
}

.form-label {
  font-weight: bold; /* 글자 두께를 두꺼운 (bold)로 설정 */
  font-size: 17px; /* 글자 크기를 18픽셀로 설정 */
}
 .payment{
 font-weight: bold;
 font-size: 22px;
 }  
    
</style>



<article class="art1" style="width: 60%;"> 

<div class="container1">
  <h2 class="text-center my-4">결제 페이지</h2>
	<br> 
  <div class="col-md-6 mx-auto">
  
    <div class="card">
      <div class="card-header">
      	<h3 class="title" align="center">${ param.kind }</h3>
        <h4 class="card-title m-0">카드 정보 입력</h4>
      </div>
      <div class="card-body">
        <form action="${path}/paymentservlet" method="GET">
          <div class="form-group">
            <label for="cardName" class="form-label">결제자 이름</label>
            <input type="text" class="form-control" name="cardName" id="cardName" value="${ loginMember.name }">
            <br>
       <div class="form-group">
  		<label for="prinum" class="form-label">주민등록번호</label>
  		<div class="input-group">
  		<input type="text" name="prinum1" style="width: 140px;" value="${loginMember.SSN1 != null ? loginMember.SSN1.substring(0, 6) : ''}">&nbsp; <a>-</a> &nbsp;&nbsp;<input type="text" name="prinum2" maxlength="1" style="width:20px">
		<span style="font-size: 1.4em;">●●●●●●</span>
	  </div>
	</div>
          <div class="form-group">
            <label for="cardNumber" class="form-label" >카드 번호</label>
            <input type="text" class="form-control" name="cardNumber" id="cardNumber">
          </div>
          <div class="form-group">
            <label for="date" class="form-label">유효 기간</label>
            <input type="date" class="form-control" name="datee" id="date">
          </div>
          <div class="form-group">
            <label for="cvc" class="form-label">CVC</label>
            <input type="text" class="form-control" name="cvc" id="cvc" maxlength="3" pattern="[0-9]{3}" title="세 자리 숫자를 입력하세요">
            </div>
            <br>
       <div class="form-group">
	  <label for="paymentAmount" class="form-label">결제금액</label>
	  <input type="text" class="form-control payment-amount" name="paymentAmount" id="paymentAmount" readonly>
	</div>
	<br>
	<div className={styles.form_agreement_box}>
        	<div className={styles.form_agreement_all}>
        		<input type="checkbox" id="all-check" onChange={allBtnEvent}/>
        		<label for="all-check">전체동의</label>
        		<br><br>
         <%--  <button type="submit" class="payment-button btn-block">결제 하기</button>--%>
          <button type="button" class="payment-button btn-block" onclick="submitPaymentForm()">결제 하기</button>
          
        </form>
      </div>
    </div>
  </div>
</div>
<article class="art2" style="width: 20%;">
</article>

<script>
switch(`${param.kind}`){
case "수영":
	$('#paymentAmount').val("100000");
	break;
case "요가":
	$('#paymentAmount').val("120000");
	break;
case "필라테스":
	$('#paymentAmount').val("170000");
	break;	
case "헬스":
	$('#paymentAmount').val("150000");
	break;	
case "베드민턴":
	$('#paymentAmount').val("140000");
	break;	
case "필라테스":
	$('#paymentAmount').val("130000");
	break;	
}

function submitPaymentForm() {
  const allCheck = document.getElementById('all-check');
  
  if (!allCheck.checked) {
    alert('동의 버튼을 체크해 주세요.');
    return;
  }
  
  if (confirm('정말로 결제하시겠습니까?')) {
    document.querySelector('form').submit();
  }
}

</script>


<%-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">--%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js" defer></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" defer></script>
<link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">
<jsp:include page="/views/common/footer.jsp" />
<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/sidebars.js"></script>