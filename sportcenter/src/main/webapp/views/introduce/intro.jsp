<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="/views/common/header.jsp" />


<section id="content" style="display: flex; align-items: center;">
    <ul style="display: flex; flex-direction: column;"></ul>
<link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">
</section>

<jsp:include page="/views/common/footer.jsp" />
<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/sidebars.js"></script>

