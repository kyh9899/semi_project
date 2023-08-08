<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>+
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ path }/resources/css/style.css">
<script src="${ path }/resources/js/jquery-3.7.0.js"></script>
<style type="text/css">
header {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    background-color: #ffffff;
    z-index: 999;
    height: 100px;
    overflow: hidden; /* 콘텐츠가 헤더 영역을 넘어가면 잘리게 됨 */
}
</style>

<!-- bootstrap css -->
<link rel="stylesheet" href="${ path }/resources/css/bootstrap.min.css">


</head>
<body>
	<div class="container">
<header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
        <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
        <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
      </a>
      
      
      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
        <li class="home"><a href="${ path }/views/introduce/intro.jsp" class="nav-link px-2 link-secondary">센터소개</a></li>
        <li><a href="${ path }/views/program/list.jsp" class="nav-link px-2 link-dark">프로그램안내</a></li>
        <li><a href="${ path }/views/application/list.jsp" class="nav-link px-2 link-dark">수강신청</a></li>
        <li><a href="${ path }/views/board/notice.jsp" class="nav-link px-2 link-dark">고객센터</a></li>
        <li><a href="${ path }/views/member/myPage.jsp" class="nav-link px-2 link-dark">마이페이지</a></li>
      </ul>

      <div class="col-md-3 text-end">
        <button type="button" class="btn btn-outline-primary me-2 btn-sm" onclick="location.href='${ path }/member/signin'">로그인</button>
      	<button type="button" class="btn btn-primary btn-sm" onclick="location.href='${ path }/member/enroll'">회원가입</button>
      </div>
    </header>
  </div>