<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div>${ dto.ins_id }</div>
    <div>${ dto.production_id }</div>
    <div>${ dto.planid }</div>
    <div>${ dto.ins_date }</div>
    <div>${ dto.result }</div>
    <div>${ dto.defect_count }</div>
    <div>${ dto.defect_cause }</div>
    <div>${ dto.resultID }</div>
    <div>${ dto.taskid }</div>
<!--     <c:url var="list1" value="//list"> -->
<!--     </c:url> -->
<%--     <a href="${ list1 }">목록으로 돌아가기</a> --%>
<!--     <br> -->
<!--     <c:url var="modify" value="/todo/modify"> -->
<%--         <c:param name="tno" value="${ dto.tno }" /> --%>
<%--         <c:param name="title" value="${ dto.title }" /> --%>
<%--         <c:param name="dueDate" value="${ dto.dueDate }" /> --%>
<%--         <c:param name="finished" value="${ dto.finished }" /> --%>
<!--     </c:url> -->
<%--     <a href="${modify}" name="modify">수정하기</a> --%>

<!--     <form method="post" action="delete"> -->
<%--         <input type="hidden" name="tno" value="${dto.tno}"> --%>
<!--         <input type="submit" value="삭제"> -->
<!--     </form> -->
</body>
</html>