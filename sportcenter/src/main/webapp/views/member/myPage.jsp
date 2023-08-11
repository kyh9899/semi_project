<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />

  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>회원 정보 수정</title>

  <!-- Bootstrap CSS 및 JS 의존성 -->
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  
  <style>
	@media (min-width: 1200px) {
        .container, .container-lg, .container-md, .container-sm, .container-xl {
          max-width: 100%;
        }
      }  
  
    section #view-container {
        text-align:center;
    }

    section #view-container input {
        margin-left: 15px;
    }

    section #view-container table {
        margin:0 auto;
        border-collapse: collapse;
    }

    section #view-container table th {
        text-align: center;
        padding: 20px 0 15px 20px;
        border-bottom: 1px solid #ccc;
        border-top: 1px solid #ccc;
        background-color: gray;
        width: 200px;
    }

    section #view-container table td {
        text-align:left;
        padding: 20px 0 15px 20px;
        border-bottom: 1px solid #ccc;
        border-top: 1px solid #ccc;
        width: 500px;
    }

    h2 {
        margin-bottom: 50px;
    }

    .input {
        border: none;
        font-size: 1.2em;
    }
	.col-md-3 {
	    -ms-flex: 0 0 25%;
	    flex: 0 0 25%;
	    max-width: 0%;
	}
  </style>
  
<article class="art1" style="width: 60%;"> 
<div>
	<section id="content">
	    <h2 align="center">회원 정보 수정</h2>
	    <div id="view-container">
	        <form id="memberFrm" action="${ path }/member/update" method="POST">
	            <table>
	                <div>
	                    <tr>
	                        <th>아이디</th>
	                        <td>
	                            <input type="text" name="userId" class="input" id="newId" value="${ loginMember.id }" readonly required >
	                        </td>
	                    </tr>
	                </div>
	                <tr>
	                    <th>이름</th>
	                    <td>
	                        <input type="text" name="userName" class="input" id="userName" value="${ loginMember.name }" required>
	                    </td>
	                </tr>
	                <tr>
	                    <th>전화번호</th>
	                    <td>
	                        <input type="tel" class="input" placeholder="(-없이)01012345678" value="${ loginMember.phone }" name="phone" id="phone" maxlength="11">
	                    </td>
	                </tr>
	                <tr>
	                    <th>이메일</th>
	                    <td>
	                        <input type="email" class="input" placeholder="abc@abc.com" value="${ loginMember.email }" name="email" id="email">
	                    </td>
	                </tr>
	                <tr>
	                    <th>주소</th>
	                        <td>
	                            <input type="text" class="input" name="address1" id="address" value="${ loginMember.address1 }" size="50">
	                            <input type="text" class="input" name="address2" id="address" value="${ loginMember.address2 }">
	                        </td>
	                </tr>
	                <tr>
	                	<th>회원가입일</th>
	                	<td>
	                		<input type="text" class="input" name="joinDate" id="joinDate" value="${ loginMember.joinDate }" readonly required>
	                	</td>
	                </tr>
	            </table>
	
	            <br><br>
	
	            <button type="button" data-toggle="modal" data-target="#passwordModal">비밀번호 변경</button>
	            <input type="submit" value="정보 수정">
	            <input type="button" id="btnDelete" value="탈퇴">
	        </form>
	    </div>
	</section>
	
	<!-- 비밀번호 변경 모달 -->
	<div class="modal fade" id="passwordModal" tabindex="-1" role="dialog" aria-labelledby="passwordModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="passwordModalLabel">비밀번호 변경</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <form id="passwordChangeForm" action="${ path }/password/change" method="POST">
	          <div class="form-group">
	            <label for="currentPassword">현재 비밀번호</label>
	            <input type="password" class="form-control" id="currentPassword" name="userPwd" required>
	          </div>
	          <div class="form-group">
	            <label for="newPassword">새 비밀번호</label>
	            <input type="password" class="form-control" id="newPassword" name="newPassword" placeholder="문자, 숫자, 특수문자(~!@#$%^&*)의 조합 10 ~ 16자리"  oninput="checkPassword()" required>
	            <p style="margin:0" id="passwordRequirements">암호를 입력하세요.</p>
	          </div>
	          <div class="form-group">
	            <label for="confirmPassword">비밀번호 확인</label>
	            <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" oninput="checkPassword()" required>
	            <span id="passwordMatch" style="color:red;"></span>
	          </div>
	        </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" id="cancelButton" data-dismiss="modal">취소</button>
	        <button type="button" class="btn btn-primary" id="submitPasswordChange">변경</button>
	      </div>
	    </div>
	  </div>
	</div>
</div>

<script>
   // 회원 탈퇴
    $(document).ready(() => {
        $('#btnDelete').on('click', () => {
            if (confirm('정말로 탈퇴하시겠습니까?')) {
                location.replace('${ path }/member/delete');
            }
        });
        
    // 비밀번호 변경    
        $('#submitPasswordChange').on('click', () => {
            let newPassword = $('#newPassword').val();
            let confirmPassword = $('#confirmPassword').val();
            
            if (newPassword !== confirmPassword) {
                alert('비밀번호가 일치하지 않습니다. 다시 입력해주세요.');
            } else {
                $('#passwordChangeForm').submit();
            }
        });
    });
   
   // 비밀번호 확인
    function checkPassword() {
	    var password = document.getElementById("newPassword").value;
	    var passwordCheck = document.getElementById("confirmPassword").value;
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
   
   // 취소 버튼
    $('#cancelButton').click(function() {
        $('#passwordModal').find('input').val('');
    });
</script>

<article class="art2" style="width: 20%;">
</article>

<link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">

<jsp:include page="/views/common/footer.jsp" />
<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/sidebars.js"></script>