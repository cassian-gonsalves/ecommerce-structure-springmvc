<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style>
.fr{float:right;}
</style>
</head>
<body    style="background-color: wheat;">
<div class="fr">

        <b>Welcome ${sessionScope.userAccount.person.firstName}</b>
        
        <a href="logOut.htm" target="_top"><button type="button" class="btn btn-danger">Logout</button></a> 




</div>

</body>



</html>