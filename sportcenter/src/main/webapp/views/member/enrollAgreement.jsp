<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');

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

ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

div.container {
  font-family: 'Noto Sans KR', sans-serif;
  margin: auto;
}

.container .logo {
  text-align: center;
  margin-bottom: 10px;
}

.container .contents {
  padding: 50px;
}

#form__wrap {
  margin: 0 auto;
  width: 460px;
  font-size: 14px;
}

#form__wrap .terms__check__all {
  display: flex;
  margin-bottom: 35px;
}

#form__wrap .terms__check__all label {
  margin-left: 3px;
  text-decoration: underline;
}

.contents label {
  font-weight: 700;
}

label.required::after {
  margin-left: 4px;
  font-size: 13px;
  font-weight: 400;
  line-height: 24px;
  color: #0086ff;
  content: "(필수)";
}

.terms__list .terms__content {
  height: 88px;
  overflow: auto;
  margin-top: 8px;
  padding: 12px;
  border: 1px solid #dadada;
  background: #fff;
  font-size: 12px;
}

.next-button {
  width: 300px;
  height: 40px;
  display: block;
  margin: 0 auto;
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

.next-button:disabled {
  opacity: 0.2;
  cursor: not-allowed;
}

@media (max-width: 768px) {
  .wrap {
    min-width: 280px;
    padding: 20px;
  }

  #form__wrap {
    max-width: 460px;
    width: auto;
  }
</style>

<jsp:include page="/views/common/header.jsp" />

<div class="container">
      <div class="logo">
        <h1>회원가입</h1>
 	<br><br>
 	<p id="root"><strong>01약관동의 ➝</strong> 02본인인증 ➝ 03정보입력 ➝ 04가입완료</p>
 	<br><br>
      </div>
      <div class="contents">
        <form action="/" method="POST" id="form__wrap">
          <ul class="terms__list">
            <li class="terms__box">
              <div class="input__check">
                <input type="checkbox" name="agreement" id="termsOfService" value="termsOfService" required />
                <label for="termsOfService" class="required">이용약관 동의</label>
              </div>
              <div class="terms__content">
                대충 이용약관에 동의하냐는 내용
              </div>
              <br><br>
            </li>
            <li class="terms__box">
              <div class="input__check">
                <input type="checkbox" name="agreement" id="privacyPolicy" value="privacyPolicy" required />
                <label for="privacyPolicy" class="required">개인정보 수집 및 이용 동의</label>
              </div>
              <div class="terms__content">
                대충 개인정보 수집에 동의하냐는 내용
              </div>
            </li>
            <br><br>	
            <li>
            <div class="terms__check__all">
            <input type="checkbox" name="checkAll" id="checkAll" />
            <label for="checkAll">이용약관, 개인정보 수집 및 이용에<br>모두 동의합니다.</label>
          	</div>
          </li>
          </ul>
          <button type="submit" class="next-button" onclick="location.href='enrollCertification.jsp'">확인</button>
        </form>
      </div>
    </div>

<jsp:include page="/views/common/footer.jsp" /> 

<script>
  'use strict';

  const form = document.querySelector('#form__wrap');
  const checkAll = document.querySelector('.terms__check__all input');
  const checkBoxes = document.querySelectorAll('.input__check input');
  const submitButton = document.querySelector('button');

  form.addEventListener('submit', (e) => e.preventDefault()); // 버튼 클릭 시 폼 제출 방지

  checkBoxes.forEach((item) => item.addEventListener('change', toggleCheckbox));
  checkAll.addEventListener('change', toggleCheckAll);

  function toggleCheckbox() {
    const areAllChecked = [...checkBoxes].every((item) => item.checked);
    checkAll.checked = areAllChecked;
    toggleSubmitButton();
  }

  function toggleCheckAll() {
    const { checked } = checkAll;
    checkBoxes.forEach((item) => {
      item.checked = checked;
    });
    toggleSubmitButton();
  }

  function toggleSubmitButton() {
    const allChecked = [...checkBoxes].every((item) => item.checked);
    submitButton.disabled = !allChecked;
  }
</script>