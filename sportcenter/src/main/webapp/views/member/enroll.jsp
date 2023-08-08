<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<style type="text/css">

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
	 
      div.container{
      font-family: 'Noto Sans KR', sans-serif;
    }
 
      div.insert{
    }
 
    div.create{
    width: 800px;
    text-align: center;
    padding: 30px;
    border-bottom: 1px solid black;
    margin: auto;
    }
 
    table{
    height: 300px;
    width: 900px;
    border-top: 3px solid black;
    margin-right: auto;
    margin-left: auto;
    }
 
    td{
    border-bottom: 1px dotted black;
    }
 
    caption{
    text-align: left;
    }
 
    .col1 {
    background-color: #e8e8e8;
    padding: 10px;
    text-align: right;
    font-weight: bold;
    font-size: 0.8em;
    border: 0;
    margin: 0;
    margin-bottom: 5px;
    }
 
    .col2 {
    text-align: left;
    padding: 5px;
    border: 0;
    margin: 0;
    }
 
    .but1 {
    height: 28px;
    width: 80px;
    color: white;
    background-color: black;
    border-color: black;
    font-size : 15px;
    }
 
    .but2 {
    height: 28px;
    width: 120px;
    color: white;
    background-color: black;
    border-color: black;
    font-size : 13px;
    }
 
    .but3 {
    height: 35px;
    width: 150px;
    background-color: white;
    border: 2px solid black;
    }
 
    .but4{
    height: 35px;
    width: 150px;
    background-color: white;
    border: 2px solid black;
    }
    
    .but1:hover {
    background-color: #b9b9b9;
    color: black;
    border: 2px solid black;
    }
 
    .but2:hover {
    background-color: #b9b9b9;
    color: black;
    border: 2px solid black;
    }
 
    .but3:hover {
    background-color: black;
    color: white;
    border: 2px solid black;
    }
 
    .but4:hover {
    background-color: black;
    color: white;
    border: 2px solid black;
    }
    
    p{
    font-size: 0.7em;
    }
    
    a{
    font-size: 2em;
    }
 
    .g{
    font-size: 0.7em;
    }
 
    .c{
    font-size: 0.7em;
    }
 
    .a{
    font-size: 0.7em;
    }
    
    .num{
    color: red;
    }
 
  </style>

<jsp:include page="/views/common/header.jsp" />

  <form name="memberEnrollFrm" action="${ path }/member/enroll" method="POST">
      <div class="container">
    <div class="insert">
    
    <table>
 	<h1>회원가입</h1>
 	<br><br>
 	<p id="root">01약관동의 ➝ 02본인인증 ➝ <strong>03정보입력 ➝</strong> 04가입완료</p>
 	<br><br>
    <tr>
        <td class="col1">이름</td>
        <td class="col2"><input type="text" name="name" maxlength="5"></td>
    </tr>
    <tr>
        <td class="col1">아이디</td>
        <td class="col2">
            <input type="text" name="id" id="newId" maxlength="10">
            <input class='but1' id="checkDuplicate" type="button" value="중복확인">
        </td>
    </tr>
    <tr>
            <td class="col1">비밀번호<br><br></td>
            <td class="col2">
                <input type="password" name="pwd" id="pwd" maxlength="16" onkeyup="checkPassword()">
                <p style="margin:0" id="passwordRequirements">※비밀번호는 <span class="num">문자, 숫자, 특수문자(~!@#$%^&*)의 조합 10 ~ 16자리</span>로 입력이 가능합니다.</p>
            </td>
        </tr>
        <tr>
            <td class="col1">비밀번호 확인</td>
            <td class="col2">
                <input type="password" name="pwdCheck" id="pwdCheck" maxlength="16" onkeyup="checkPassword()">
                <span id="passwordMatch" style="color:red;"></span>
            </td>
        </tr>
 	<tr>
		<td class="col1">주민등록번호</td>
 		<td class="col2">
			<input type="text" name="SSN1" maxlength="6"> <a>-</a> <input type="text" name="SSN2" maxlength="1" style="width:20px">******
   	 	</td>
    </tr>
    <tr>
    	<td class="col1">연락처</td>
    	<td class="col2">
    <input type="text" name="contactNumber">
                    </td>
                </tr>
                <tr>
                    <td class="col1">주소</td>
                    <td class="col2">
                       <input type="text"  id="zip_code" name="zip_code" onclick="openZipSearch();" readonly="readonly" placeholder="우편번호" style="width:250px;">
					   <input type="text"  id="addr" name="addr" onclick="openZipSearch();" readonly="readonly" placeholder="기본주소"  style="width:250px;">
					   
                    </td>
                </tr>
                
                <tr>
                <td class="col1"></td>
                	<td class="col2"><input type="text"  id="addr_dtl" name="addr_dtl" placeholder="상세주소"  style="width:250px;"></td>
                </tr>
    <tr>
	    <td class="col1">이메일</td>
	    <td class="col2">
	        <input type="text" name="mailid">
	        <span class="a">@</span>
	        <input type="text" name="email" id="emailInput">
	        <select name="mailslc" onchange="updateEmailDomain()">
	            <option value="self" selected>직접입력</option>
	            <option value="naver">naver.com</option>
	            <option value="gm">gmail.com</option>
	            <option value="da">daum.com</option>
	            <option value="yah">yahoo.com</option>
	        </select>
	        <input class='but2' type="button" value="이메일 중복확인" onclick="">
	    </td>
</tr>
    </table>
    
  </div>
 
  <div class="create">
    	<button class="but3" type="reset">가입취소</button>
    	<button class="but4" type="submit" onclick="formCheck(this.form)">회원가입</button>    
  </div>
  </div>
  </form>

<script>
	function checkPassword() {
	    var password = document.getElementById("pwd").value;
	    var passwordCheck = document.getElementById("pwdCheck").value;
	    var passwordMatchSpan = document.getElementById("passwordMatch");
	    var passwordRequirements = document.getElementById("passwordRequirements");
	    var regex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[~!@#$%^&*])[A-Za-z\d~!@#$%^&*]{10,16}$/;
	
	    if (password === "" && passwordCheck === "") {
	        passwordMatchSpan.innerHTML = "";
	    } else if (password === passwordCheck) {
	        passwordMatchSpan.innerHTML = "비밀번호 일치";
	        passwordMatchSpan.style.color = "green";
	    } else {
	        passwordMatchSpan.innerHTML = "비밀번호 불일치";
	        passwordMatchSpan.style.color = "red";
	    }
	
	    if (regex.test(password)) {
	        passwordRequirements.style.color = "green";
	    } else {
	        passwordRequirements.style.color = "red";
	    }
	}

    function formCheck(form) {
        //유효성 검사
        if(form.name.value == "") {
            alert('이름을 입력하세요.');
            form.name.focus() ;
            return ;
        }
        if(form.id.value == "") {
            alert('아이디를 입력하세요.');
            form.id.focus() ;
            return ;
        }
        if(form.pwd.value == "") {
            alert('비밀번호를 입력하세요.');
            form.pwd.focus() ;
            return ;
        }
        if(form.pwd.value.length < 10 || form.pwd.value.length > 16) {
            alert('비밀번호는 10 ~ 16자 사이로 입력하세요.');
            form.pwd.focus() ;
            return ;
        }
        if(form.pwdCheck.value == "") {
            alert('비밀번호 확인을 입력하세요.');
            form.pwdCheck.focus() ;
            return ;
        }
        if(form.mailid.value == "") {
            alert('e-mail을 입력하세요.');
            form.mailid.focus() ;
            return ;
        }
        if(form.email.value == "" && form.mailslc.selectedIndex == 0) {
            alert('e-mail을 입력하세요.');
            form.mailslc.focus() ;
            return ;
        }
        if (form.SSN1.value === "" || isNaN(form.SSN1.value) || form.SSN1.value.length !== 6 ||
       	    form.SSN2.value === "" || isNaN(form.SSN2.value) || form.SSN2.value.length !== 1) {
       	    alert('올바른 주민등록번호를 입력해주세요.');
       	    form.residentNum1.focus();
       	    return;
        	}
 

        }
    
    function openZipSearch() {
        new daum.Postcode({
        	oncomplete: function(data) {     
    		var addr = ''; 
    		if (data.userSelectedType === 'R') { 
    			addr = data.roadAddress;
    		} else {
    			addr = data.jibunAddress;
    		}

    		$("#zip_code").val(data.zonecode);
    		$("#addr").val(addr);
    		$("#addr_dtl").val("");
    		$("#addr_dtl").focus();
            }
        }).open();
        
        function updateEmailDomain() {
            var mailslc = document.getElementsByName("mailslc")[0];
            var emailInput = document.getElementById("emailInput");
            var selectedOption = mailslc.options[mailslc.selectedIndex].value;

            if (selectedOption !== "self") {
                emailInput.value = selectedOption;
            } else {
                emailInput.value = "";
            }
        }
    }
    
    $(document).ready(() => {
    	$('#checkDuplicate').on('click', () => {
    		let id = $('#newId').val().trim();
    		
    		if(id === '') {
    			alert('아이디를 입력해 주세요.');
    		} else {
    			$.ajax({
    				type: 'GET',
    				url: '${ path }/member/idCheck',
    				dataType: 'json',
    				data: {
    					id
    				},
    				success: (obj) => {
    					console.log(obj);
    					
    					if(obj.duplicate) {
    						alert('이미 사용중인 아이디 입니다.');
    					} else {
    						alert('사용 가능한 아이디 입니다.');
    					}
    				},
    				error: (error) => {
    					console.log(error);
    				}
    			});
    		}
    	});
    });
 
    
    
  </script>
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <jsp:include page="/views/common/footer.jsp" /> 