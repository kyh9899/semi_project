<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />

<article class="art1" style="width: 60%;"> 
<style>
	h4 { padding-top: 70px;  padding-bottom: 10px;}
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
		margin-top: 30px;
		padding-left: 30px;
		background-color:transparent;
		margin-left: 70px;
	}
	#findpwd:hover { text-decoration: underline; }
	#btn1 {
		border-color: white;
		background-color: white;
		box-shadow: none;
		border:none;
		background-color:transparent;
		margin-left: -10px;
	}
	#btn1:hover { text-decoration: underline; }
	td {
	 	 padding-bottom: 55px;
	 	 padding-left: 10px;
	}
	#space1 { letter-spacing:19px; }
	#space2 { letter-spacing:10px; margin-left: 25px; }
</style>




<script>
	function findIDbtn(){
		document.fm.action="'${ path }/member/findpwd'";
		document.fm.method="post";
	}
</script>


<h4 align="center">비밀번호 찾기</h4> <br>
	<div id="findpwd-container" align="center" >
		<form name="pwdfindscreen" method = "POST" >
			<table>
		    <tr>
		      <td><span id="space1">아이디</span> : </td> 
		      <td id="inid"><input type="text" name="id" id="id" required></td>
		    </tr>
		    <tr>
		      <td><span id="space2">전화번호</span> : </td>
		      <td><input type="tel" name="phone" id="phone"></td>
		    </tr>
		    <tr> 
		      <td colspan="2" align="center"> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp;
		      
		        <button type="submit" id="findpwd" onclick="'${ path }/member/findpwd'"><span>비밀번호 찾기</span></button>     |
		      
		        <input id="btn1" type="button"  value="취소" onclick="location.href='${ path }/login'">
		      </td>
		    </tr>
		</table>
		</form>
	</div>
<article class="art2" style="width: 20%;">
</article>



<link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">
<jsp:include page="/views/common/footer.jsp" />
<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/sidebars.js"></script>
