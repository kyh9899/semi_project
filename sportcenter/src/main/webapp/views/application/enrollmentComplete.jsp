<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="/views/common/header.jsp" />
  

<body>
<div>
<h1>결제 완료 페이지</h1>
<br><br><br>
</div>
<div>
<h2>강좌 신청 완료</h2>
</div>
<br><br><br><br>
<div>
<p>감사합니다. 결제 완료 및 선택하신 강좌 정상적으로<br>
	신청되었습니다. ^_^</p>
</div>
</body>
<link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">
<jsp:include page="/views/common/footer.jsp" />
<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/sidebars.js"></script>

