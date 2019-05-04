<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<title>Customer Sign Up</title>
<style>
.mainbody {
    margin: 25px;
    background-color: wheat;
}
</style>
<script>

        var xmlHttp;
        xmlHttp = GetXmlHttpObject();
        function checkUser() 
        {
           if (xmlHttp == null)
            {
                alert("Your browser does not support AJAX!");
                return;
            }
            var userName = document.getElementById("userName").value;
            var query = "action=ajaxCheck&userName="+userName;

            xmlHttp.onreadystatechange = function stateChanged()
            {
                if (xmlHttp.readyState == 4)
                {
                    
                    document.getElementById("ajax").innerHTML = xmlHttp.responseText;
                }
            };
            xmlHttp.open("POST", "ajax.htm", true);
            xmlHttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xmlHttp.send(query);
           return false;
        }
        
         function GetXmlHttpObject()
        {
            var xmlHttp = null;
            try
            {
                
                xmlHttp = new XMLHttpRequest();
            } catch (e)
            {
                
                try
                {
                    xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
                } catch (e)
                {
                    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
            }
            return xmlHttp;
        } 
         
     	function validation()
		{
		
   		 var state = document.getElementById("state").value;
         var zipCode=document.getElementById("zipCode").value;
         var phoneNumber=document.getElementById("phoneNumber").value;
         var userName=document.getElementById("userName").value;
         var country=document.getElementById("country").value;
         var password=document.getElementById("password").value;
		 var firstName = document.getElementById("firstName").value;
		 var middleName = document.getElementById("middleName").value;
		 var lastName = document.getElementById("lastName").value;
		 var age = document.getElementById("age").value;
		 var addressLine1 = document.getElementById("addressLine1").value;
		 var addressLine2 = document.getElementById("addressLine2").value;
		 var city = document.getElementById("city").value;

         
	
			var numberExp = /^[0-9]+$/;
            var nameExp = /^[a-zA-Z ]+$/;
              
            if(!(firstName.match(nameExp)))
            {
                alert('Name Invalid');
                return false;
            } 
            
            if(!(middleName.match(nameExp)))
            {
                alert('Name Invalid');
                return false;
            } 
            
            if(!(lastName.match(nameExp)))
            {
                alert('Name Invalid');
                return false;
            } 
            
             if(!(age.match(numberExp)))
             {
                 alert('Numerical age only');
                 return false;
             }
             
             if(!(city.match(nameExp)))
             {
                 alert('Alphabets only.');
                 return false;
             }
             if(!(state.match(nameExp)))
             {
                 alert('Alphabets only.');
                 return false;
             }
             
             if(!(zipCode.match(numberExp)))
             {
                 alert('Digits only');
                 return false;
             }
             
             if(!(age.match(numberExp)))
             {
                 alert('Digits only');
                 return false;
             }
             
             var ageLength = age.value.length;
             if(ageLength > 5)
             {
                 alert('Age can be less than 100.');
                 return false;
             }
             
             
             if(!(phoneNumber.match(phoneNumber)))
             {
                 alert('Digits only');
                 return false;
             }
             
             var phoneLength = phoneNumber.value.length;
             if(phoneLength > 10)
			 {
                 alert('10 digits allowed');
                 return false;
             }
             
             if(phoneLength<10)
			 {
                 alert('10 digits allowed');
                 return false;
             }
             
             var usernameLength = userName.value.length;
             if(usernameLength<4)
			 {
                 alert('Minimum 4 characters');
                 return false;
             }
             
             var passwordLength = password.value.length;
             if(passwordLength < 4)
			 {
                 alert('Minimum 4 characters.');
                 return false;
             }
             
             
             return true;
		}
         
        </script>
</head>
<body class="mainbody">
<div class="container">
    <div class="row">
        <div class="col-md-6">
        
 <h4>Customer Sign Up</h4>
 
 <form:form action="register.htm" commandName="customer" method="post" onSubmit="return validation()">
	
	
<div class="form-group">
  First Name : 
  <form:input id="firstName" path="firstName" size="20" class="form-control"/> <font color="red"><form:errors path="firstName"/></font>
  </div>
  
  
  <div class="form-group">
  Middle Name : 
  <form:input id="middleName" path="middleName" size="20" class="form-control"/> <font color="red"><form:errors path="middleName"/></font>
  </div>
  
  
  <div class="form-group">
  Last Name : 
  <form:input id="lastName" path="lastName" size="20" class="form-control"/> <font color="red"><form:errors path="lastName"/></font>
  </div>
  
  
  <div class="form-group">
  Gender : 
 <form:radiobutton path="gender" value="Male" checked="true" />Male 
 <form:radiobutton path="gender" value="Female" />Female
 <form:errors path="gender" cssClass="error" />
   </div>
   
   <div class="form-group">
   Age: 
  <form:input id="age" path="age" size="20" class="form-control"/> <font color="red"><form:errors path="age"/></font>
  </div>
  
  
  <div class="form-group">
  Address Line1 :
  <form:input id="addressLine1"  path="address.addressLine1" size="20" class="form-control"/> <font color="red"><form:errors path="address.addressLine1"/></font>
   </div>
   
   <div class="form-group">
  Address Line2:
  <form:input id="addressLine2" path="address.addressLine2" size="20" class="form-control"/> <font color="red"><form:errors path="address.addressLine2"/></font>
   </div>
   
   <div class="form-group">
  City:
  <form:input id="city" path="address.city" size="20" class="form-control" /> <font color="red"><form:errors path="address.city"/></font>
   </div>
   
   <div class="form-group">
  State:
  <form:input id="state" path="address.state" size="20" class="form-control" /> <font color="red"><form:errors path="address.state"/></font>
   </div>
   
   <div class="form-group">
  Country:
  <form:input id="country" path="address.country" size="20" class="form-control" /> <font color="red"><form:errors path="address.country"/></font>
   </div>
   
   <div class="form-group">
  Zip Code:
  <form:input id="zipCode" path="address.zipCode" size="20" class="form-control" /> <font color="red"><form:errors path="address.zipCode"/></font>
   </div>
   
   <div class="form-group">
  Phone Number:
  <form:input id="phoneNumber" path="phoneNumber" size="20" class="form-control" /> <font color="red"><form:errors path="phoneNumber"/></font>
   </div>
   
   <div class="form-group">
   Username:
  <form:input path="userName" id ="userName" size="20" class="form-control" onblur="return checkUser()" /> <font color="red"><form:errors path="userName"/></font>
   <div id="ajax" style="color:red"></div>
   </div>
   
   <div class="form-group">
   Password:
  <form:input id="password" path="password" size="20" class="form-control" /> <font color="red"><form:errors path="password"/></font>
   </div>
   
   <c:if test="${requestScope.isCheckingOut.equals('true')}">
    	 	<input type="hidden" name="isCheckingOut" value="true" />
   </c:if>
 
  <input type="submit" value="Register"  />

 </form:form>
 
</body>
</html>