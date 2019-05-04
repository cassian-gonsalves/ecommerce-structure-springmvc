<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
.fr{float:right;}
.marginleft{margin-left: 20%;}
.formleft{margin-left: 0px;}
</style>
</head>

<body>
<div class="fr">
<c:choose>
    <c:when test="${!empty sessionScope.userAccount}">
         <jsp:include page="menu2.jsp"/>
     </c:when>
     <c:otherwise>
         <jsp:include page="menu1.jsp"/>
     </c:otherwise>
  </c:choose>
</div>


<form action="search.htm" action="get" >
<div class="marginleft">
<select id="key" name="key" required>
<option value="" selected disabled hidden>Choose here</option>
  <option value="Laptop">Laptop</option>
  <option value="Ram">Ram</option>
  <option value="Portable Hard-Disk">Portable Hard-Disk</option>
  <option value="Usb Stick">Usb Stick</option>
</select>

	 <input type="submit" value="Search"/>
	 </div>
 </form>

</body>
</html>