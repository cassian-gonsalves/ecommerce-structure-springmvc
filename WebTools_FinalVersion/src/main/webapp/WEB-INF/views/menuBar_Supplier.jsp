<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.fr{float:right;}
</style>
</head>
<body    style="background-color: wheat;">
<div class="fr">
        
<b>Welcome ${requestScope.supplierName}</b>
 <a href="logOut.htm" target="_top"><button type="button" class="btn btn-danger">Logout</button></a>
</div>
</body>
</html>