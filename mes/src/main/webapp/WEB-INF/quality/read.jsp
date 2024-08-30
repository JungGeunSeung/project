<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div>품질검사 ID : ${ dto.ins_id }</div>
    <div>제품 ID : ${ dto.production_id }</div>
    <div>계획 ID : ${ dto.planid }</div>
    <div>검사날짜 : ${ dto.ins_date }</div>
    <div>검사결과 : ${ dto.result }</div>
    <div>불량개수 : ${ dto.defect_count }</div>
    <div>불량유형 : ${ dto.defect_cause }</div>
    <div>결과 ID : ${ dto.resultID }</div>
    <div>실적 ID : ${ dto.taskid }</div>

	 <c:url var="modify" value="/quality/modify">
        <c:param name="ins_id" value="${ dto.ins_id }" />
        <c:param name="production_id" value="${ dto.production_id }" />
        <c:param name="planid" value="${ dto.planid }" />
        <c:param name="ins_date" value="${ dto.ins_date }" />
        <c:param name="result" value="${ dto.result }" />
        <c:param name="defect_count" value="${ dto.defect_count }" />
        <c:param name="defect_causet" value="${ dto.defect_cause }" />
        <c:param name="resultID" value="${ dto.resultID }" />
        <c:param name="taskid" value="${ dto.taskid }" />
    </c:url>
    <a href="${modify}" name="modify">수정하기</a>
	<input type="submit" value="삭제"><br>
	<input type="submit" value="목록으로 돌아가기"> 
	<jsp:include page="modify.jsp"></jsp:include>
	

<%--  <%@ include file="header.jsp" %> --%>
</body>
</html>