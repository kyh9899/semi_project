<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>
<jsp:include page="/views/common/header.jsp" />    
<!DOCTYPE html>
<html>
<head>
<style>
    body, html {
        height: 100%;
        margin: 0;
    }
    .content-wrap {
        min-height: 100%;
        position: relative;
    }
    #footer {
        position: absolute;
        bottom: 0;
        width: 100%;
    }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="content-wrap">
        <h2>신청완료 상세 페이지</h2>
        <img src="${ path }/resources/images/swimcation.png">
        
        
        
    </div>
    <jsp:include page="/views/common/footer.jsp" />
</body>
</html>
