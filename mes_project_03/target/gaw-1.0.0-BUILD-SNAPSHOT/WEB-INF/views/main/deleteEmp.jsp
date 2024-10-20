<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/CSS/btn.css">
<link rel="icon" sizes="32x32" href="resources/img/favicon3.png" type="image/png">
<title>Insert title here</title>
<style>
	.container {
		background-color: #ddd;
		border: 1px solid gray;
	}
	
	.content {
		text-align: center;
		margin-top: 20px;
	}
	
	.contentBtn {
		margin: 10px;
	}
	
</style>
</head>
<body>
	<div class="container">
		<div>
			<span>회원탈퇴</span>
		</div>
		<div class="content">
			<span>회사명 : </span>
			<span>Grand All Win</span><br>
			<span>탈퇴하시겠습니까?</span><br>
			<span>탈퇴시 작성된 데이터는 자동으로 삭제 되지 않습니다.</span><br>
			<div class="contentBtn">
				<button class="btn" onclick="window.close();"><span>닫기</span></button>
				<button class="btn" onclick="deleteEmp();"><span>탈퇴하기</span></button>
			</div>
		</div>
	</div>
	<script>
		function deleteEmp() {
	        if (confirm("정말 회원정보를 삭제 하시겠습니까?")) {
	            // 부모 창이 있는지 확인 후 부모 창 이동
	            if (window.opener) {
	                window.opener.location.href = "/gaw/deleteEmp.do";
	            } else {
	                // 부모 창이 없을 경우 현재 창에서 이동
	                window.location.href = "/gaw/deleteEmp.do";
	            }
	            window.close(); // 팝업창 닫기
	        }
	    }
	</script>
</body>
</html>