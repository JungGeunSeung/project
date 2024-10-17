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
<form action="bominsert/insert" method="post">
    <div>
        <label for="bom_id">BOM ID:</label>
        <input type="text" id="bom_id" name="bom_id" />
    </div>
    <div>
        <label for="product_id">Product ID:</label>
        <input type="text" id="product_id" name="product_id" />
    </div>
    <div>
        <label for="material_id">Material ID:</label>
        <span>${bomDTO.material_id}</span>
        <input type="text" id="material_id" name="material_id" />
    </div>
    <div>
        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" name="quantity" />
    </div>
    <div>
        <label for="version">Version:</label>
        <input type="text" id="version" name="version" />
    </div>
    <div>
        <label for="create_at">Created At:</label>
        <input type="date" id="create_at" name="create_at" />
    </div>
    <div>
        <input type="submit" value="추가" />
    </div>
    
</form>

	<br>
</body>
</html>
