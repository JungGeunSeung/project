<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<br>
<form action="bomupdate/update" method="post">
    
    <div>
        <label for="product_id">Product ID:</label>
        <span>${bomDTO.product_id}</span>
        <input type="hidden" id="product_id" name="product_id" value="${bomDTO.product_id}" />
    </div>
    <div>
        <label for="name">Name:</label>
        <input type="text" id=name name="name" value="${bomDTO.name}" />
    </div>
    <div>
        <label for="standard">Standard:</label>
        <input type="text" id="standard" name="standard" value="${bomDTO.standard}" />
    </div>
    <div>
        <label for="color">Color:</label>
        <input type="text" id="color" name="color" value="${bomDTO.color}" />
    </div>
    <div>
        <input type="submit" value="수정" />
       
    </div>
</form>

	<br>
</body>
</html>