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
        <label for="bom_id">BOM ID:</label>
        <span>${bomDTO.bom_id}</span>
        <input type="hidden" id="bom_id" name="bom_id" value="${bomDTO.bom_id}" />
    </div>
    <div>
        <label for="product_id">Product ID:</label>
        <span>${bomDTO.product_id}</span>
        <input type="hidden" id="product_id" name="product_id" value="${bomDTO.product_id}" />
    </div>
    <div>
        <label for="material_id">Material ID:</label>
         <span>${bomDTO.material_id}</span>
        <input type="hidden" id="material_id" name="material_id" value="${bomDTO.material_id}" />
    </div>
    <div>
        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" name="quantity" value="${bomDTO.quantity}" />
    </div>
    <div>
        <label for="version">Version:</label>
        <input type="text" id="version" name="version" value="${bomDTO.version}" />
    </div>
    <div>
        <label for="create_at">Created At:</label>
        <input type="date" id="create_at" name="create_at" value="${bomDTO.create_at}" />
    </div>
    <div>
        <input type="submit" value="수정" />
       
    </div>
</form>

	<br>
</body>
</html>