<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />

<style>
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

</style>
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
							<input type="text" class="input" name="address" id="address" value="${ loginMember.address1 }">
						</td> 	
	            </tr>
	        </table>
	        
	        <br><br>
	        
	        <button type="button">비밀번호변경</button>
	        <input type="submit" value="정보수정">
	        <input type="button" id="btnDelete" value="탈퇴">
	 	</form>
 	</div>
</section>
<script>
	$(document).ready(() => {
		$('#btnDelete').on('click', () => {
			if (confirm('정말로 탈퇴하시겠습니까?')) {
				location.replace('${ path }/member/delete');
			}
		});
	});
</script>
<jsp:include page="/views/common/footer.jsp" /> 