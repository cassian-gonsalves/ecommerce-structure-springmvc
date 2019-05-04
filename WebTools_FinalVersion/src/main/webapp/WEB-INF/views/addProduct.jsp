<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<title>Add Your Product</title>
<script>
	function validation()
			{
			 var price = document.getElementById("price").value;
             var availability=document.getElementById("availability").value;
			 var numberExp = /^[0-9]+$/;
             var priceExp = /^[0-9.]+$/;  
                if(!(availability.match(numberExp)))
                {
                    alert('Availability can only be digits.');
                    return false;
                }    
                 if(!(price.match(priceExp)))
                 {
                     alert('Enter valid price');
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
 <h4>Adding Product</h4>
 <form:form action="addProduct.htm" commandName="product" method="post" enctype="multipart/form-data" onSubmit="return validation()">
	
	
<div class="form-group">	
  Product Name : 
  <form:input id="productName" path="productName" size="20" class="form-control" /> <font color="red"><form:errors path="productName"/></font>
  </div>
  
  
  <div class="form-group">
  Availability : 
  <form:input id="availability" path="availability" size="20" class="form-control" /> <font color="red"><form:errors path="availability"/></font>
  </div>
  
  
  
  <div class="form-group">
  Price : 
  <form:input id="price" path="price" size="20" class="form-control" /> <font color="red"><form:errors path="price"/></font>
  </div>
  
  
  
  <div class="form-group">
  Category :
<form:select id="prod_category" path = "prod_category" class="form-control">
                     <form:option value = "NONE" label = "Select"/>
                     <form:options items = "${prod_category}" />
                  </form:select>  
                  </div>
                  
  
  <div class="form-group">
  Description : 
  <form:textarea id="description" path="description" size="20" class="form-control"/> <font color="red"><form:errors path="description"/></font>
  </div>
  
  
  <div class="form-group">
  Photo:
  <form:input id="photo" path="photo" name="photo" type="file" class="form-control" /><font color="red"><form:errors path="photo"/></font>
  </div>

  <input type="submit" value="Add Product" target="contents"/>

 </form:form>
 
</div>
</div>
</div>
 
</body>
</html>