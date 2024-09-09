<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="/mes/CSS/button.css">
<link rel="stylesheet" href="/mes/CSS/calender.css">
<link rel="stylesheet" href="/mes/CSS/common.css">
<link rel="stylesheet" href="/mes/CSS/display.css">
<link rel="stylesheet" href="/mes/CSS/table.css">
<link rel="stylesheet" href="/mes/CSS/게시판.css">
<title>설비관리 > 비가동이력 > 이력 추가</title>
</head>
<body>
	<div class="tableID">
		<form method="post" action="addnonoperhistory">
            <!-- 비가동 이력 추가를 위한 입력 필드 -->
            <!-- resultID는 자동 생성되므로 입력 받지 않음 -->
            
            <label for="equiID">설비번호:</label> 
			<input type="text" id="equiID"	name="equiID"><br> 
            
            <label for="equiName">설비명:</label> 
            <input type="text" id="equiName" name="equiName" required><br>

            <label for="downReason">비가동 사유:</label>
            <input type="text" id="downReason" name="downReason" required><br>

            <label for="downtimeHistory">비가동 이력:</label>
            <input type="text" id="downtimeHistory" name="downtimeHistory" required><br>

            <button type="submit">추가</button>
		</form>
	</div>
</body>

<script>
    // 알림 메시지 처리
    <c:if test="${not empty errorMessage}">
        alert("${errorMessage}");
    </c:if>
    
    function validateForm() {
        var equiID = document.getElementById("equiID").value;
        var equiName = document.getElementById("equiName").value;
        var downReason = document.getElementById("downReason").value;
        var downtimeHistory = document.getElementById("downtimeHistory").value;

        if (!equiID || !equiName || !downReason || !downtimeHistory) {
            alert("모든 필드를 입력해주세요.");
            return false;
        }
        return true;
    }
</script>
</html>
