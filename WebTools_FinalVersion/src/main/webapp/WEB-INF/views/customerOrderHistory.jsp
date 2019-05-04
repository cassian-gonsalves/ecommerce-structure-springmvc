<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<title>Order History</title>
<jsp:include page="menuBar_Customer.jsp"/>
<style>
.mainbody {
    margin: 25px;
    background-color: wheat;
}
</style>
</head>
<body class="mainbody">
<div style="margin-left: 10%;margin-top: :30%">
	<c:choose>
    	<c:when test="${requestScope.orderList.size()>0}">
    	 	<table border="1">
    	 	<tr>
    	 	<th>Order Number</th>
    	 	<th>Status</th>
    	 	<th></th>
    	 	</tr>
    	 	<c:forEach var="order" items="${requestScope.orderList}"> 
    	 		<tr>
    	 		<td> ${order.orderId}</td>
    	 		<td> ${order.status} </td>
    	 		<td>
    	 		<c:if test="${order.status.equals('Open')}">
    	 		<a href="cancelOrder.htm?orderId=${order.orderId}">Cancel out</a>
    	 		</c:if>
    	 		</td>
    	 		</tr>
    	 	</c:forEach>	
    	 	</table>
    	</c:when>
    	<c:otherwise>
    		No older orders.
    	</c:otherwise>
    </c:choose>
    </div>
</body>
</html>