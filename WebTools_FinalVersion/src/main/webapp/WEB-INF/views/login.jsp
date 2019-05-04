<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
   <title>Login Page</title>
   <style>
   @import url(https://fonts.googleapis.com/css?family=Raleway:300,400,600);


body{
    margin: 0;
    font-size: .9rem;
    font-weight: 400;
    line-height: 1.6;
    color: #212529;
    text-align: left;
    background: linear-gradient(#648880, #293f50);
}

.navbar-laravel
{
    box-shadow: 0 2px 4px rgba(0,0,0,.04);
}

.navbar-brand , .nav-link, .my-form, .login-form
{
    font-family: Raleway, sans-serif;
}

.my-form
{
    padding-top: 1.5rem;
    padding-bottom: 1.5rem;
}

.my-form .row
{
    margin-left: 0;
    margin-right: 0;
}

.login-form
{
    padding-top: 1.5rem;
    padding-bottom: 1.5rem;
}

.login-form .row
{
    margin-left: 0;
    margin-right: 0;
}
   </style>
    </head>
    <body>
    
    	<main class="login-form">
    <div class="cotainer">
        <div class="row justify-content-center">
        
            <div class="col-md-6">
            <h1>Login Page</h1>
                <div class="card">
                    <div class="card-header">Login/Register</div>
                    <div class="card-body">
                        <form action="home.htm" method="post">
    	<c:choose>
    	<c:when test="${requestScope.isCheckingOut.equals('true')}">
    	 	<input type="hidden" name="isCheckingOut" value="true" />
    	</c:when>
    	<c:otherwise>
    		<input type="hidden" name="isCheckingOut" value="false" />
    	</c:otherwise>
    	</c:choose>
    	
    	
    	<c:if test="${requestScope.error.equals('true')}">
    	<div>
    		<font color="red">
    			Your credentials incorrect.Please check and try again.
    	 	</font>
    	</div> 	
    	</c:if>
                            <div class="form-group row">
                                <label for="email_address" class="col-md-4 col-form-label text-md-right">User Name</label>
                                <div class="col-md-6">
                                    <input type="text" id="userName" name="userName" class="form-control" required autofocus>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="password" class="col-md-4 col-form-label text-md-right">Password</label>
                                <div class="col-md-6">
                                    <input type="password" id="password" name="password" class="form-control" required>
                                </div>
                            </div>


                            <div class="col-md-6 offset-md-4">
                                
                                    <input type="submit" value="Login" >
                                
                                <a href="register.htm?isCheckingOut=${requestScope.isCheckingOut}" style="margin-left: 30px;" >Register to shop</a>
                            </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</main>
    	
    	

        </form>
   </div>
</html>