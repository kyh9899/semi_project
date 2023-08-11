<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <jsp:include page="/views/common/header.jsp" />

    <style>
    h2 {
        border: 1px solid green;
        width: 100%;
        text-align: center;
    }

    .circle-container {
        display: flex;
        justify-content: center;
        margin: 20px 0; /* 동그라미 컨테이너와의 간격 조절 */
    }

    .circle {
        width: 100px;
        height: 100px;
        border: 1px solid green;
        border-radius: 50%;
        margin: 10px; /* 각 동그라미 간의 간격 조절 */
    }

    .notice {
        width : 400px;
        height : 200px;
        border : 1px solid green;
        margin-bottom : 50px;
        float: left;
    }

    .recommend {
        width : 400px;
        height : 200px;
        border : 1px solid green;
        margin-bottom : 50px;
        
    }

    .left-column {
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        width: 20%;
        padding: 10px;
        float: right;
    }

    .left-column .rectangle {
        width: 100px;
        height: 50px;
        border: 1px solid green;
        margin: 10px 0;
        float: left;
    }
    
    .clear {
        clear: both; /* float 요소 영향 해제 */
    }
</style>



<article class="art1" style="width: 60%; margin: 10px auto;"> 
    <section id="content" style="height : 250px;">
        <h2> [ Sports Center 메인페이지 ] <br> 안녕하세요 Sports Center에 오신 것을 환영합니다.</h2>

        <div class="circle-container">
            <div class="circle"></div>
            <div class="circle"></div>
            <div class="circle"></div>
            <div class="circle"></div>
            <div class="circle"></div>
            <div class="circle"></div>
        </div>
    </section>

    <div class="notice"></div>
    
    
    <div class="left-column">
        <div class="rectangle"></div>
        <div class="rectangle"></div>
        <div class="rectangle"></div>
    </div>

    <div class="clear"></div>
    <div class="recommend"></div>
</article>

<article class="art2" style="width: 20%;">
    
</article>

<jsp:include page="/views/common/footer.jsp" />
<link href="${ pageContext.request.contextPath }/resources/css/sidebars.css" rel="stylesheet">
<script src="${ pageContext.request.contextPath }/resources/js/bootstrap.bundle.js"></script>
<script src="${ pageContext.request.contextPath }/resources/js/sidebars.js"></script>