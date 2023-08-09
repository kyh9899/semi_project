<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
	
	div.container{
      font-family: 'Noto Sans KR', sans-serif;
      align: center;
    }

	h1 {
	  text-align: center;
	  }
	  
	#root {
	  font-size:30px;
	  color: lightgray;
	  text-align: center;
	  }
	#root > strong{
		color : black;
	}
	
	h3{
	text-align: center;
	}
	
	.next-button {
  width: 300px;
  height: 40px;
  display: block;
  margin: 10 auto;
  outline: none;
  cursor: pointer;
  background-color: #242222;
  color: #ffffff;
  border: none;
  border-radius: 5px;
  transition-duration: 0.2s;
}

.next-button:hover:enabled {
  background-color: black;
  color : white;
}
</style>

<jsp:include page="/views/common/header.jsp" />
<div class="container">
<h1>회원가입</h1>
 	<br><br>
 	<p id="root">01약관동의 ➝ <strong>02본인인증 ➝</strong> 03정보입력 ➝ 04가입완료</p>
 	<br><br>
 	<h3>자주 사용하시는 인증 수단으로 본인인증을 진행해 주세요.</h3>
 	<div id="certification" style="text-align: center;">
		  <div>
		    <a href="#"><img src="${ path }/resources/images/cellphone.png"></a>
		    <a href="#"><img src="${ path }/resources/images/ip.png"></a>
		  </div>

  <br>

		  <ul style="list-style-type: none; padding: 0;">
		    <li>본인인증이 잘 되지 않으시면 본인인증기관 고객센터로 문의해주세요.</li>
		    <li>휴대폰 인증(한국모바일인증) 고객센터: 1644 – 1863</li>
		    <li>아이핀 인증(SCI평가정보) 고객센터: 1577-1006</li>
		  </ul>
	</div>

 	
 	
 	 <button type="submit" class="next-button" onclick="location.href='${ path }/member/enroll'">확인</button>


</div>



<jsp:include page="/views/common/footer.jsp" />