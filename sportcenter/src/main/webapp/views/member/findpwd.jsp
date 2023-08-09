<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>

	section #findpwd-container {
		text-align:center;
	}
	
	section #findpwd-container input {
		margin:3px ;
	}
	
	section #findpwd-container table {
		margin:0 auto;
	}
	
	section #findpwd-container table th {
		padding:0 10px; 
		text-align:right;
	}
	
	section #findpwd-container table td {
		padding:0 10px; 
		text-align:left;
	}
	#findpwd {
		border-color: white;
		background-color: white;
		box-shadow: none;
		border:none;
	}
	#btn1 {
		border-color: white;
		background-color: white;
		box-shadow: none;
		border:none;
	}
	td {
 	 padding-bottom: 15px;
 	 padding-left: 10px;
	}
</style>
<body>
<jsp:include page="/views/common/header.jsp" />


<script>
	function findIDbtn(){
		document.fm.action="'${ path }/member/findpwd'";
		document.fm.method="post";
	}
</script>


<h4 align="center">비밀번호 찾기</h4> <br>
	<div id="findpwd-container" align="center">
		<form name="pwdfindscreen" method = "POST" >
			<table>
		    <tr>
		      <td>아이디 : </td> 
		      <td><input type="text" name="id" id="id" required></td>
		    </tr>
		    <tr>
		      <td>번 &nbsp; 호 : </td>
		      <td><input type="tel" name="phone" id="phone"></td>
		    </tr>
		    <tr> 
		      <td colspan="2" align="center"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;
		      <%-- 
		      <a href="#" onClick="alert('비밀번호 찾기 성공!!')">
					<button id="btn1" type="findpwd" onclick="location.href='/sportcenter/views/introduce/intro_hello.jsp'"><span>비밀번호 찾기</span></button> --%> 
		        <button type="submit" id="findpwd" onclick="'${ path }/member/findpwd'"><span>비밀번호 찾기</span></button>  |
		      
		        <input id="btn1" type="button"  value="취소" onClick="history.back()">
		      </td>
		    </tr>
		</table>
		</form>
	</div>



	<%-- 
	<h4>비밀번호 찾기</h4>
	<div style="text-align: center;">
	<form name=fm>
		<table>
		    <tr>
		      <td>아이디 : </td>
		      <td><input type="text" name="name" required></td>
		    </tr>
		    <tr>
		      <td>번호 : </td>
		      <td><input type="tel" name="phone" required></td>
		    </tr>
		    <tr>
		      <td colspan="2">
		        <button type="submit" id="findpwd-btn" onclick="findpwd-btn()">비밀번호 찾기</button>
		        <input type="button" name="cancle" value="취소" onClick="history.back()">
		      </td>
		    </tr>
		</table>
		</form>
	</div>
	
	
	--%>

</body>
</html>