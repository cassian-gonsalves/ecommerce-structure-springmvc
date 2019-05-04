<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<title></title>
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
    <c:when test="${requestScope.task.equals('registered')}">
    	Registery success.
    </c:when>
    <c:when test="${requestScope.task.equals('checkedOut')}">
    	Order placed successfully.
    </c:when>
  </c:choose>

</body>
</html>