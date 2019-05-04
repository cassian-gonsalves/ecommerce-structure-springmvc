package com.neu.cassian.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.neu.cassian.pojo.Customer;
import com.neu.cassian.pojo.Product;

public class CustomerValidator  implements Validator{
	private Pattern pattern;
	 private Matcher matcher;

	 public boolean supports(Class aClass)
	    {
	        return aClass.equals(Customer.class);
	    }
	 
	 @Override
		public void validate(Object obj, Errors errors)
		{
		 Customer customer = (Customer) obj;
			
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName", "error.invalid.firstName", "First Name is Required.");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "middleName", "error.invalid.middleName", "Middle Name is Required.");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName", "error.invalid.lastName", "Last Name is Required.");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address.addressLine1", "error.invalid.address.addressLine1", "Address Line1 is  Required.");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address.addressLine2", "error.invalid.address.addressLine2", "Address Line2 is  Required.");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address.city", "error.invalid.address.city", "City is Required.");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address.state", "error.invalid.address.state", "State is Required.");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address.country", "error.invalid.address.country", "Country is  Required.");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address.zipCode", "error.invalid.address.zipCode", "Zip Code is  Required.");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "phoneNumber", "error.invalid.phoneNumber", "Phone Number is  Required.");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "userName", "error.invalid.userName", "Username is  Required.");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "error.invalid.password", "Password is  Required.");
		    
		}


}
