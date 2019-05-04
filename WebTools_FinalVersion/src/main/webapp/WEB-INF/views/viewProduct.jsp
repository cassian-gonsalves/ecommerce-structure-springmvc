<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Product</title>
<jsp:include page="menuBar_Customer.jsp"/>

 <script language="JavaScript" type="text/javascript">
   function validation()
   {
     var quantity = document.getElementById("quantity").value;
     var quantExp = /^[0-9]+$/;
     if(!(quantity.match(quantExp)))
     {
         alert('Quantity can only be digits.');
         return false;
     }
    return true;  
   }
 </script>
 
 <style>
.mainbody {
    margin: 25px;
    background-color: wheat;
}
</style>
 

</head>
<body class="mainbody">
<h4>Product details are as below:</h4>
<form action="addToCart.htm?productId=${requestScope.product.productId}&supplierId=${requestScope.supplier.personId}&price=${requestScope.product.price}" method="post" onSubmit="return validation()">

<h4>Product Name: ${requestScope.product.productName}</h4>
<img src="${product.photoName}"  width="100" height="100" /><br/><br/>

Price:  ${requestScope.product.price}
<br/>
Product Description: ${requestScope.product.description}
<br/>
Supplier: ${requestScope.supplier.supplierName}
<br/>
Category: ${requestScope.product.prod_category}
<br/>

<div>
Quantity Required:
<input type="text" name="quantity" id="quantity" required>
<br/><br/>
<input type="submit" value="Add to Cart" style="margin-left: 60px;">
</div>
</form>
</body>
</html>