package com.neu.cassian.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;
import org.springframework.web.multipart.MultipartFile;

import com.neu.cassian.pojo.Product;
import com.neu.cassian.pojo.Supplier;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ProductValidator implements Validator{
	
	 private Pattern pattern;
	 private Matcher matcher;

	 public boolean supports(Class aClass)
	    {
	        return aClass.equals(Product.class);
	    }
 
		@Override
		public void validate(Object obj, Errors errors)
		{
			 Product product = (Product) obj;
		
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "productName", "error.invalid.productName", "Product Name is Required.");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "availability", "error.invalid.availability", "Availability is Required.");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "price", "error.invalid.price", "Price is Required.");
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "description", "error.invalid.description", "Description is Required.");
			

			String IMAGE_PATTERN = "([^\\s\\(.*?\\)]+(\\.(?i)(jpg|png|gif|bmp|JPG|PNG|GIF|BMP))$)";
			Pattern imagePattern = Pattern.compile(IMAGE_PATTERN);
	        Matcher patternMatcher;
	        MultipartFile photo;
	        
	        if(null!=product.getPhoto())
	        {
	        	photo=product.getPhoto();
	            patternMatcher = imagePattern.matcher(photo.getOriginalFilename());
	            
//	            if(0 == eventPhoto.getSize()) {
//	                errors.rejectValue("eventPhoto","Event_File_Empty");
//	            }
	            if(!patternMatcher.matches()) {
	                errors.rejectValue("photo","error.invalid.photo","Invalid_Format");
	            }

	            if(10485760 < photo.getSize()) {
	                errors.rejectValue("photo","error.invalid.photo", "Invalid_File_Size"); 
	            }
	        }
		     
		}
	

}
