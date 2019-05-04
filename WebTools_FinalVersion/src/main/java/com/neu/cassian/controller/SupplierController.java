package com.neu.cassian.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.neu.cassian.dao.ProductDao;
import com.neu.cassian.dao.UserAccountDao;
import com.neu.cassian.pojo.Admin;
import com.neu.cassian.pojo.Customer;
import com.neu.cassian.pojo.Product;
import com.neu.cassian.pojo.Supplier;
import com.neu.cassian.pojo.UserAccount;
import com.neu.cassian.validator.ProductValidator;

@Controller
public class SupplierController {
	@Autowired
	@Qualifier("productDao")
	ProductDao productDao;
	
	@Autowired
	ServletContext servletcontext;

	@Autowired
	@Qualifier("productValidator")
	ProductValidator productValidator;
	

	
	@InitBinder
	private void initBinder(WebDataBinder binder)
	{
		binder.setValidator(productValidator);
	}
	

	@RequestMapping(method = RequestMethod.GET,value="/contents_Supplier.htm")
	public String getContentsSupplier(){
		return "contents";
	}
	
	
	@RequestMapping(method = RequestMethod.GET,value="/sideBar_Supplier.htm")
	public String getSideBarSupplier(){
		return "sideBar_Supplier";
	}
	
	@RequestMapping(method = RequestMethod.POST,value="/productEdited.htm")
	public String productEdited(HttpServletRequest request){
		try 
		{

			int productId= Integer.parseInt(request.getParameter("productId"));
			int avaialability = Integer.parseInt(request.getParameter("availability")); 
		    float price = Float.parseFloat(request.getParameter("price"));
		    String description = request.getParameter("description");
	        String productName= productDao.editProduct(productId,avaialability,price,description);
			request.setAttribute("productName", productName);
			
		} 
		catch (Exception e)
		{
			System.out.println(e.getMessage());
		}
		
		return "supplierSuccess";
	}
	
	
	
	@RequestMapping(method = RequestMethod.GET,value="/menuBar_Supplier.htm")
	public String getMenuBarAdmin(HttpServletRequest request){
		HttpSession session = request.getSession();
		UserAccount userAccount =(UserAccount)session.getAttribute("userAccount");
		Supplier supplier = (Supplier) userAccount.getPerson();
		String supplierName = supplier.getSupplierName();
		request.setAttribute("supplierName",supplierName);
		return "menuBar_Supplier";
	}
	
	
	@RequestMapping(method = RequestMethod.GET,value="/addProduct.htm")
	public String getAddProductPage(@ModelAttribute("product")Product product, BindingResult result,HttpServletRequest request){
		HttpSession session = request.getSession();
		 UserAccount ua = (UserAccount)session.getAttribute("userAccount");
		 if(ua==null)
		 {
			 return "login";
		 }
		 else
		 {
			List<String> prod_category=new ArrayList();
			prod_category.add("Laptop");
			prod_category.add("Ram");
			prod_category.add("Portable Hard-Disk");
			prod_category.add("Usb Stick");
			session.setAttribute("prod_category", prod_category);
			 return "addProduct";
		 }
		 
	}
	
	@RequestMapping(method = RequestMethod.GET,value="/deleteProduct.htm")
	public String getDeleteProductPage(HttpServletRequest request){
		try 
		{
			HttpSession session = request.getSession();
			 UserAccount ua = (UserAccount)session.getAttribute("userAccount");
			 if(ua==null)
			 {
				 return "login";
			 }
			 else
			 {
			Supplier supplier = (Supplier) ua.getPerson();
			
			List<Product> productList = productDao.getProductList(supplier);
			
			request.setAttribute("productList", productList);
			return "deleteProduct";
			 }
		} 
		catch (Exception e)
		{
			System.out.println(e.getMessage());
		}
		
		return null;
	}

	@RequestMapping(method = RequestMethod.POST,value="/addProduct.htm")
	public String getProductAddedPage(@ModelAttribute("product")Product product, BindingResult result,HttpServletRequest request,HttpServletResponse response){
			try 
			{
				System.out.println(product.getProd_category());
				productValidator.validate(product, result);
				if(result.hasErrors())
				{
					return "addProduct";
				}		
				final String filePath = servletcontext.getRealPath("/");
				String photoName = product.getPhoto().getOriginalFilename();
				String[] split = photoName.split("\\.");
				try 
				{
					Timestamp tstmp = new Timestamp(System.currentTimeMillis());
					String phname = split[0] + tstmp.getTime();
					product.getPhoto().transferTo(new File(servletcontext.getRealPath("/resources/images"),phname+"."+split[split.length-1]));
					product.setPhotoName("/cassian/resources/images/"+ phname+"."+split[split.length-1]);
				} 
				catch (Exception e) 
				{
					return "You failed to upload " + e.getMessage();
				}
				HttpSession session = request.getSession();
				UserAccount userAccount =(UserAccount)session.getAttribute("userAccount");
				Supplier supplier = (Supplier) userAccount.getPerson();
				
				productDao.addProduct(product,supplier);
				request.setAttribute("task", "productAdded");
				request.setAttribute("productName", product.getProductName());	
				
			} 
			catch (Exception e)
			{
				System.out.println(e.getMessage());
			}
			
			return "supplierSuccess";
		}
	
	
	
	@RequestMapping(method = RequestMethod.POST,value="/deleteProduct.htm")
	public String deleteProduct(HttpServletRequest request){
		try 
		{
			int productId = Integer.parseInt(request.getParameter("product"));
	        productDao.deleteProduct(productId);
	        request.setAttribute("task", "productDeleted");
			//request.setAttribute("productName", productName);
			
		} 
		catch (Exception e)
		{
			System.out.println(e.getMessage());
		}
		
		return "supplierSuccess";
	}
	
	
	@RequestMapping(method = RequestMethod.GET,value="/editProduct.htm")
	public String getEditProductPage(HttpServletRequest request){
		try 
		{
			HttpSession session = request.getSession();
			UserAccount userAccount =(UserAccount)session.getAttribute("userAccount");
			Supplier supplier = (Supplier) userAccount.getPerson();
			
			List<Product> productList = productDao.getProductList(supplier);
			
			request.setAttribute("productList", productList);
			
		} 
		catch (Exception e)
		{
			System.out.println(e.getMessage());
		}
		
		return "editProductForm";
	}
	
	
	
	@RequestMapping(method = RequestMethod.POST,value="/editProduct.htm")
	public String productEditPage(HttpServletRequest request){
		try 
		{
			int productId = Integer.parseInt(request.getParameter("productId"));
	        Product product = productDao.getProductById(productId);
			request.setAttribute("product", product);
			
		} 
		catch (Exception e)
		{
			System.out.println(e.getMessage());
		}
		
		return "editProduct";
	}
	

	
}
