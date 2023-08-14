<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />

<article class="art1" style="width: 60%;"> 
<style>
	section #findid-container {
		text-align:center;
	}
	
	section #findid-container input {
		margin:10px ;
	}
	
	section #findid-container table {
		margin:0 auto;
	}
	
	section #findid-container table th {
		padding:0 10px; 
		text-align:right;
	}
	
	section #findid-container table td {
		padding:0 10px; 
		text-align:left;
	}
	#findid-container {
		margin-top: 50px;
	}
	#findid {
		margin-top: 10px;
		padding-left: 60px;
	}
	#findid {
		border-color: white;
		background-color: white;
		box-shadow: none;
		border:none;
		background-color:transparent;
		margin-left: 30px;
	}
	#btn1 {
		border-color: white;
		background-color: white;
		box-shadow: none;
		border:none;
		background-color:transparent;
	}
	td {
 		padding-bottom: 15px;
    	padding-left: 10px;
	}
	#space1 { letter-spacing:18px; }
	#space2 { letter-spacing: 0.5px; }
	
</style>



<script>
	function findIDbtn(){
		document.fm.action="'${ path }/member/findid'";
		document.fm.method="post";
	}
</script>


		<h4 align="center">아이디 찾기</h4> 
			<div id="findid-container"  align="center">
			<form name="idfindscreen" method = "POST"  >
				<table>
			    <tr>
			      <td><span id="space1">이름</span> : </td>
			      <td><input type="text" name="name" id="name" required ></td>
			    </tr> 
			    <tr>
			      <td><span id="space2">전화번호</span> : </td>
			      <td><input type="tel" name="phone" id="phone"  required></td>
			    </tr>
			    <tr id="ttr3"> 
			      <td colspan="2" align="center"> &nbsp; &nbsp; &nbsp; 
			      
			        <button  type="submit" id="findid" onclick="'${ path }/member/findid'"><span>아이디 찾기</span></button>  &nbsp;  |
			      
			        <input id="btn1" type="button"  value="취소" onclick="location.href='${ path }/login'">
			      </td>
			    </tr>
			</table>
			</form>
		</div>
<article class="art2" style="width: 20%;">
</article>		
	<%-- 
		<c:if test="${ empty loginMember }">
		<form name="idfindscreen" method = "POST">
		<section class = "form-search">
			<div class = "find-name">
				<label>성명 : </label> 
				<input type="text" name="member_name" class = "btn-name" id="userName" size="11" maxlength="11" placeholder = "이름">
			<br>
			</div>
			<div class = "find-phone">
				<label>번호 : </label>
				<input type="tel" onKeyup = "addHypen(this);" name="member_phone" id="phone" class = "btn-phone" size="12" maxlength="11" placeholder = "휴대폰번호 입력">
			</div>
			<br>
	</section>
	<div class ="btnSearch">
		<input type="button"  value="찾기"  onClick="">
		<input type="button"  value="취소" onClick="history.back()">
 	</div>
 </form>
		</c:if>
	--%>
	

<link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">
<jsp:include page="/views/common/footer.jsp" />
<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/sidebars.js"></script>	