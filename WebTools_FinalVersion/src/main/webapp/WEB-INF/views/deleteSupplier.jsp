<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<title>Delete Supplier</title>
</head>
<body style ="    background-color: wheat;">
<h4>Delete Supplier</h4>
 <form action="deleteSupplier.htm" method="post">
	
  Supplier Name:<br/>
     <c:forEach var="supplier" items="${requestScope.supplierList}" >
  		 <input type="radio" style="margin-left: 10px;" id="supplier" name="supplier" value="${supplier.supplierName}" required>${supplier.supplierName} 
  		  <br/>
     </c:forEach>

  <input type="submit" value="Delete Supplier" target="contents"/>
  </form>
</body>
</html>