<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/CSS/category.css">
    <link rel="stylesheet" href="resources/CSS/header.css"> 
    <link rel="stylesheet" href="resources/CSS/footer.css">
    <link rel="stylesheet" href="resources/CSS/btn.css">
    <link rel="stylesheet" href="resources/CSS/table.css">
    <link rel="stylesheet" href="resources/CSS/loading.css">
    <link rel="icon" sizes="32x32" href="resources/img/favicon3.png" type="image/png">
<title>품질 기준</title>
</head>
<body>

<header>
    <jsp:include page="/WEB-INF/views/main/tiles/header.jsp" />
</header>
<nav>
	<jsp:include page="/WEB-INF/views/main/tiles/category.jsp" />
</nav>

<table border="1">
        <caption>픔질기준 목록</caption>
        
        <thead>
            <tr>
                <th>선택</th>
                <th>기준 ID</th>
                <th>검사 기준</th>
                <th>목표값</th>
                <th>허용오차</th>
                <th>기준 단위</th>
                <th>적용 날짜</th>
                <th>만료 날짜</th>
                <th>설명</th>
                <th>제품 ID</th>
                <th>삭제</th>
            </tr>
        </thead>
        <tbody id="list"></tbody>
    </table>
    
	<div id="pagination"></div>

<script>
//데이터 베이스 연결함 데이터 베이스는 gpt로 막 만듬 다시 만들어야 함
</script>


<footer>
    <jsp:include page="/WEB-INF/views/main/tiles/footer.jsp" />
</footer>
</body>
</html>