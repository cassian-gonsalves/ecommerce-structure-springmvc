<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<title>View Cart</title>
<jsp:include page="menuBar_Customer.jsp"/>
<style>
.mainbody {
    margin: 25px;
    background-color: wheat;
}
</style>
</head>
<body class="mainbody">
<c:choose>
  <c:when test="${sessionScope.myCart.size()>0}">
  	<form action="checkOut.htm" method="POST">
		 Items Currently in Your Cart:
		 <hr/>
		 <c:forEach var="product" items="${sessionScope.myCart}">
		 Product Name:<c:out value="${product.productName}"></c:out><br/>
		 Product Price:<c:out value="${product.price}"></c:out><br/>
		 Quantity: <c:out value="${product.availability}"></c:out><br/>
		 <br/>
		 <a href="remove.htm?productId=${product.productId}&price=${product.price}&quantity=${product.availability}">[Remove from Cart]</a>
		 <br/><br/>
		 </c:forEach>
		 <hr/>
		  Total Price: $${sessionScope.totalAmount}
		<br/>
		<input type="submit" value="Check Out">
		</form>
  </c:when>
  <c:otherwise>
  <h4>Empty Cart.</h4>	
  </c:otherwise>
</c:choose>


</body>
</html>