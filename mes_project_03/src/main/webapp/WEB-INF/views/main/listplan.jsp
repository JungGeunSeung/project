<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/CSS/category.css">
    <link rel="stylesheet" href="resources/CSS/header.css">
    <link rel="stylesheet" href="resources/CSS/footer.css">
<title>생산계획</title>
</head>

<body>

	<header>
	<!---------------- 헤더 ----------------->
	<jsp:include page="/WEB-INF/views/main/tiles/header.jsp" /> 
	</header>
	<!----------------- 메뉴바 ----------------->
	<nav>
	<jsp:include page="/WEB-INF/views/main/tiles/category.jsp" />
	</nav>
	<!-----------------  풋터 ----------------->
s	<footer>
	<jsp:include page="/WEB-INF/views/main/tiles/footer.jsp" />
	</footer>

	<main>

		<a href="#">계획추가</a>

		<!-- <section>
                <article>
                    <form id="for" method="get">

                    </form>

                </article>

            </section> -->


		<table border="1">
			<caption>생산계획목록</caption>
			<thead>
				<tr>
					<th>선택</th>
					<th>계획 ID</th>
					<th>제품 ID</th>
					<th>생산 시작일</th>
					<th>생산 종료일</th>
					<th>작성자</th>
					<th>생산 상태</th>
				</tr>
			</thead>
			<tbody id="list"></tbody>
		</table>
	</main>
	
	<script>
	function ajax(url, cb, method){
		if(mehtod) method='get';
		
		const xhr = new XMLHttpRequest();
		xhr.open(method, url);
		xhr.send();
		
		if(typeof cd == "function"){
			xhr.onload=cd(xhr.responsText);
		}
		
	}
	
	function getList(){
		ajax("selectPlan", function(){/**/}, "get")
	}
	function drawList(text){
	}
	
	window.addEventListener("load",function(){
		let url = "selectPlan";

		const xhr = new XMLHttpRequest();
		xhr.open("get", url);
		xhr.send();
		xhr.onload=function(){
			console.log(xhr.responseText);

			try{
				const planList = JSON.parse(xhr.responseText);
				let html="";
				for(let i=0; i<planList.length;i++){
					html +=`
					<tr>
						<tb><input type="checkbox" name"check" value="\${planList[i].plan_id}"
						<tb>\${planList[i].plan_id}</tb>
					</tr>`;
				}
				document.querySelector("#list").innerHTML = html;
				
			}
			
		}
	})


	
	
	
	
	</script>

</body>

</html>