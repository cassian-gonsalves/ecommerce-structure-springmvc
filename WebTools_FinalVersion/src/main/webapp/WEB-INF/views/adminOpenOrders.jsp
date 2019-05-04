<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>


<title>Open Orders</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</head>
<body style ="background-color: wheat;">
<form action="updateOrder.htm" method="post">
	<c:choose>
    	<c:when test="${requestScope.openOrderList.size()>0}">
    	 	<table border="2">
    	 	<tr>
    	 	<th></th>
    	 	<th>Order Number</th>
    	 	<th>Customer</th>
    	 	<th>Status</th>
    	 	</tr>
    	 	<c:forEach var="order" items="${requestScope.openOrderList}"> 
    	 		<tr>
    	 		<td><input type="radio" name="orderId" value="${order.orderId}" required></td>
    	 		<td> ${order.orderId}</td>
    	 		<td> ${order.customer.firstName}</td>
    	 		<td> ${order.status} </td>
    	 		</tr>
    	 	</c:forEach>	
    	 	</table>
		<input type="submit" value="Update Order" />
    	</c:when>
    	<c:otherwise>
    		No Orders Yet.
    	</c:otherwise>
    </c:choose>
   </form>
</body>
</html>