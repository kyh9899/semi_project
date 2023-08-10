<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<style>
  /* Added Google font */
  @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap');
   
   
  
  /* Updated styling */
  body, html {
      font-family: 'Nanum Gothic', arial, sans-serif;
      height: 100%;
      margin: 0;
     
  
  }
  
  main {
      width: 100%;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center; /* 추가: 수직축에서 가운데 정렬 */
  
  }
  
  
  h1 {
      font-size: 2.5em;
      margin-top: 1.5rem;
      margin-bottom: 2rem;
      color: #333333;
  }
  
  form {
      border: 2px solid #2A9D8F;
      border-radius: 5px;
      padding: 2rem 4rem;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  }
  
  .form-group {
      display: flex;
      flex-direction: column;
      margin-bottom: 1rem;
  }
  
  label {
      font-size: 1.1em;
      margin-bottom: 0.5rem;
  }
  
  input {
      font-size: 1em;
      padding: 0.5rem;
      border: 1px solid #ccc;
      border-radius: 5px;
      outline: none;
      transition: border-color 0.2s ease-in-out;
  }
  
  input:focus {
      border-color: #55CCA7;
  }
  
  button {
      font-size: 1.2em;
      font-weight: bold;
      padding: 0.5rem 2rem;
      border: none;
      border-radius: 5px;
      background-color: #2A9D8F;
      color: white;
      cursor: pointer;
      transition: background-color 0.3s ease-in-out;
  }
  
  button:hover {
      background-color: #55CCA7;
  }

   .course-information {
  font-size: 17px;
  line-height: 1.8;
  margin-bottom: 1rem;
  white-space: nowrap;
  position: absolute;
  top: 50%;
  right: 0px;
 /* transform: translateY(-50%);*/
}
      .form-container {
      display: flex;
      flex-direction: row;
      justify-content: space-evenly;
  } 
     
     
   #footer {
      position: absolute;
      bottom: 0;
      width: 100%;
      
    }
    #wrapper {
      min-height: 60%;
      position: relative;
    }
</style>
<div id="wrapper">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>결제 페이지</title>
</head>
<body>
  <main>
    <h1>결제 페이지</h1>
    <div class="form-container">
    <form id="payment-form">
      <div class="form-group">
        <label for="name">회원 아이디</label>
        <input type="text" id="name" required>
      </div>
      <div class="form-group">
        <label for="pay_date">결제 일자</label>
        <input type="text" id="pay_date" maxlength="19" required>
      </div>
      <div class="form-group">
        <label for="amount">결제 금액</label>
        <input type="number" id="amount" min="50000" step="10000" required>
      </div>
      <div class="form-group">
        <button type="submit">결제하기</button>
      </div>
	</form>

     <br><br>
   <%--  <div class="image-and-text">
        <img class="img" src="${ path }/resources/images/runsport.jpg"> --%>
        
<div class="course-information"> 
 	<strong>에어로빅 A</strong><br>   
	<strong style="color: #2A9D8F;">강습장소:</strong> 강의실1<span style="display:inline-block; width: 30px;"></span><br>
	<strong style="color: #2A9D8F;">강사명:</strong> 김강사<span style="display:inline-block; width: 172px;"></span><br>
	<strong style="color: #2A9D8F;">강습기간:</strong> (01개월)<span style="display:inline-block; width: 148px;"></span><br>
	<strong style="color: #2A9D8F;">강습시간:</strong> 18:00-19:00<span style="display:inline-block; width: 146px;"></span><br>
	<strong style="color: #2A9D8F;">수강요금:</strong> ₩100,000<span style="display:inline-block; width: 146px;"></span><br>
	<strong style="color: #2A9D8F;">정원   :</strong> 30명<span style="display:inline-block; width: 185px;"></span><br>
	<strong style="color: #2A9D8F;">접수기간:</strong> 접수 중<span style="display:inline-block; width: 151px;"></span> 
</div>
</div>
 </main>    
    <jsp:include page="/views/common/footer.jsp" />
</body>
</html>




