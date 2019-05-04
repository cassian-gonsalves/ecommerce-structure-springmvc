<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<title>Add Supplier</title>
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
            xmlHttp.open("POST", "ajaxSupplier.htm", true);
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
				
				
	             var country=document.getElementById("country").value;
				 var zipCode=document.getElementById("zipCode").value;
	             var phoneNumber =document.getElementById("phoneNumber").value;
	             var userName=document.getElementById("userName").value;
	             var emailAddress=document.getElementById("emailAddress").value;
	             var password=document.getElementById("password").value;
			 var supplierName = document.getElementById("supplierName").value;
             var addressLine1=document.getElementById("addressLine1").value;
			 var addressLine2=document.getElementById("addressLine2").value;
             var city =document.getElementById("city").value;
             var state=document.getElementById("state").value;

                var nameNumberExp= /^[0-9#a-zA-Z ]+$/;
				var numberExp = /^[0-9]+$/;
                var nameExp = /^[a-zA-Z ]+$/;
				var phoneExp = /^[0-9 ]+$/;
                  
                 if(!(supplierName.match(nameExp)))
                 {
                     alert('Only Characters allowed in name');
                     return false;
                 }
					if(!(addressLine1.match(nameNumberExp)))
                 {
                     alert('Only Alphanumeric characters');
                     return false;
                 }
					if(!(addressLine2.match(nameNumberExp)))
                 {
                     alert('Only Alphanumeric characters');
                     return false;
                 }
					if(!(city.match(nameExp)))
                 {
                     alert('Characters only');
                     return false;
                 }
					if(!(state.match(nameExp)))
                 {
                     alert('Characters only');
                     return false;
                 }
					if(!(country.match(nameExp)))
                 {
                     alert('Characters only');
                     return false;
                 }
					if(!(zipCode.match(numberExp)))
                 {
                     alert('Characters only');
                     return false;
                 }
			
					if(!(phoneNumber.match(phoneExp)))
                 {
                     alert('Numericals only');
                     return false;
                 }
						
					return true;
		     
		}
         
        
        </script>

</head>
<body style ="background-color: wheat;">

<div class="container">
    <div class="row">
        <div class="col-md-6">
 <h4>Add Supplier</h4>
 <form action="addSupplier.htm" method="post" onSubmit="return validation()">
	
  <div class="form-group">
  Supplier Name : 
  <input id="supplierName" name="supplierName" size="20" class="form-control" required/> 
  </div>
  
  <div class="form-group">
  Address Line1 :
  <input id="addressLine1" name="addressLine1" size="20" class="form-control" required/> 
  </div>
  
  <div class="form-group">
  Address Line2:
  <input id="addressLine2" name="addressLine2" size="20" class="form-control" required/> 
  </div>
  
  <div class="form-group">
  City:
  <input id="city" name="city" size="20" class="form-control" required /> 
  </div>
  
  <div class="form-group">
  State:
  <input id="state" name="state" size="20" class="form-control" required /> 
  </div>
  
  <div class="form-group">
  Country:
  <input id="country" name="country" size="20" class="form-control" required />
  </div> 
  
  <div class="form-group">
  Zip Code:
  <input id="zipCode" name="zipCode" size="20" class="form-control" required/> 
  </div>
  
  <div class="form-group">
  Phone Number:
  <input id="phoneNumber" name="phoneNumber" size="20" class="form-control" required/> 
  </div>
   
   <div class="form-group">
   Username:
  <input id="userName" name="userName" size="20" class="form-control" onblur="return checkUser()" required/> 
   <div id="ajax" style="color:red"></div>
   </div>
  
  <div class="form-group"> 
   Password:
  <input id="password" name="password" size="20" class="form-control" required/> 
  </div>
 
 
  <input type="submit" value="Save Supplier" target="contents"/>

 </form>
 
 </div>
    </div>
</div>
 
</body>
</html>