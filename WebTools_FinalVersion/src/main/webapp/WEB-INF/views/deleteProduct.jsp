<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<title>Delete Product</title>
</head>
<body style ="    background-color: wheat;">
<form method="post" action="deleteProduct.htm">
	Select Product to be deleted:
	<br/>
     <c:forEach var="product" items="${requestScope.productList }">
     	 <input type="radio" style="margin-left: 10px;" id="product" name="product" value="${product.productId}" required> ${product.productName}
         <br/>
      </c:forEach>
     <input type="submit" value="Delete">
     </form>
</body>
</html>