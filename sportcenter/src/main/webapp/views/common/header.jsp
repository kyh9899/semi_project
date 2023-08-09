<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${ path }/resources/css/style.css">
<script src="${ path }/resources/js/jquery-3.7.0.js"></script>

<!-- bootstrap css -->
<link rel="stylesheet" href="${ path }/resources/css/bootstrap.min.css">

<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');

@media (min-width: 1200px) {
  .container, .container-lg, .container-md, .container-sm, .container-xl {
    max-width: 100%;
  }
}
		div.container {
		  font-family: 'Noto Sans KR', sans-serif;
		  margin-right : 0;
		  margin-left : 0;
		   width: 100%;
		}
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
    </style>
</head>
<body>
	<div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center py-3 mb-4 border-bottom">
      <a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
        <svg class="bi me-2" width="20" height="32" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
      </a>
      
      
      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0" style="font-size:25px; text-align : center;">
        <li class="home"><a href="${ path }/views/introduce/intro.jsp" class="nav-link px-2 link-secondary">센터소개</a></li>
        <li><a href="${ path }/views/program/list.jsp" class="nav-link px-2 link-dark">프로그램안내</a></li>
        <li><a href="${ path }/views/application/enrollment.jsp" class="nav-link px-2 link-dark">수강신청</a></li>
        <li><a href="${ path }/board/notice" class="nav-link px-2 link-dark">고객센터</a></li>
        <li><a href="${ path }/views/member/myPage.jsp" class="nav-link px-2 link-dark">마이페이지</a></li>
      </ul>

      <div class="col-md-3 text-end">
        <button type="button" class="btn btn-outline-primary me-2" onclick="location.href='${ path }/login'">로그인</button>
        <button type="button" class="btn btn-primary" onclick="location.href='${ path }/member/enrollAgreement'">회원가입</button>

      </div>
    </header>
  </div>