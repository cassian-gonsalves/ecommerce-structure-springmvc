<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
	<body>
        <div class="fr" >
        <b>Welcome ${sessionScope.userAccount.person.firstName} </b>
        	<a href="orderHistory.htm"><button type="button" class="btn btn-info">Order History</button></a> 
    		<a href="viewCart.htm"><button type="button" class="btn btn-info">View Cart</button></a> 
    		<a href="logOut.htm" target="_top"><button type="button" class="btn btn-danger">Logout</button></a> 
		</div>
    </body>
</html>