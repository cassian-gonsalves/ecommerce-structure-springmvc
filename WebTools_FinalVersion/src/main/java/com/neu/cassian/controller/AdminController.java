package com.neu.cassian.controller;

import java.io.PrintWriter;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.neu.cassian.dao.CustomerDao;
import com.neu.cassian.dao.OrderDao;
import com.neu.cassian.dao.SupplierDao;
import com.neu.cassian.dao.UserAccountDao;
import com.neu.cassian.pojo.Admin;
import com.neu.cassian.pojo.Order;
import com.neu.cassian.pojo.Supplier;
import com.neu.cassian.pojo.UserAccount;
import com.neu.cassian.validator.ProductValidator;



@Controller
public class AdminController {
	@Autowired
	@Qualifier("orderDao")
	OrderDao orderDao ;
	
	@Autowired
	@Qualifier("userAccountDao")
	UserAccountDao userAccountDao;
	
	@Autowired
	@Qualifier("supplierDao")
	SupplierDao supplierDao;

	@RequestMapping(method = RequestMethod.GET,value="/contents_Admin.htm")
	public String getContentsAdmin(){
		return "contents";
	}
	
	@RequestMapping(method = RequestMethod.GET,value="/menuBar_Admin.htm")
	public String getMenuBarAdmin(){
		return "menuBar_Admin";
	}
	
	@RequestMapping(method = RequestMethod.GET,value="/sideBar_Admin.htm")
	public String getSideBarAdmin(){
		return "sideBar_Admin";
	}
	
	@RequestMapping(method = RequestMethod.POST,value="/addSupplier.htm")
	public String getAddedSupplierPage(HttpServletRequest request) throws Exception{	
		try
		{
			
	
			String supplierName = request.getParameter("supplierName");
			String addressLine1 = request.getParameter("addressLine1");
			String addressLine2 = request.getParameter("addressLine2");
			String city = request.getParameter("city");
			String state = request.getParameter("state");
			String country = request.getParameter("country");
			String zipCode = request.getParameter("zipCode");
			String phoneNumber = request.getParameter("phoneNumber");
			String emailAddress = request.getParameter("emailAddress");
			String userName = request.getParameter("userName");
			String password = request.getParameter("password");
			
			HttpSession session = request.getSession();
			UserAccount userAccount =(UserAccount)session.getAttribute("userAccount");
			Admin admin = (Admin) userAccount.getPerson();
		
			supplierDao.addSupplier(supplierName,addressLine1,addressLine2,city,state,country,zipCode,phoneNumber,emailAddress,userName,password,admin);
			request.setAttribute("task", "addedSupplier");
			request.setAttribute("supplierName", supplierName);
			
	 }
    catch (Exception e)
    {
        System.out.println(e.getMessage());
    }
		
		return "adminSuccess";
	}
	
	@RequestMapping(method = RequestMethod.POST,value="/updateOrder.htm")
	public String updateOrder(HttpServletRequest request,HttpServletResponse response){
		try 
		{
			HttpSession session = request.getSession();
			UserAccount ua = (UserAccount)session.getAttribute("userAccount");
			Admin admin = (Admin) ua.getPerson();
			List<Order> orderList= orderDao.getAdminOrderList(admin);
			int orderId=Integer.parseInt(request.getParameter("orderId"));
			
			for(Order o:orderList)
			{
				if(o.getOrderId()==orderId)
				{
					orderDao.updateOrder(o);
				}
			}
			
			Set<Order> openOrderList = new HashSet<Order>();
			for(Order o:orderList)
			{
				if(o.getStatus().equalsIgnoreCase("Open"))
				{
					openOrderList.add(o);
				}
			}
			
			request.setAttribute("openOrderList", openOrderList);
			
		}
		catch (Exception e)
		{
			System.out.println(e.getMessage());
		}
		return "adminOpenOrders";
	}
	
	@RequestMapping(method = RequestMethod.GET,value="/addSupplier.htm")
	public String getAddedSupplierPageOnGet(HttpServletRequest request) throws Exception{	
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
				 return "addSupplier";
			 }
		}
		     catch (Exception e) 
				 {
		  	   System.out.println(e.getMessage());
				 }
				 
				 return null;
	}
	
	@RequestMapping(method = RequestMethod.POST,value="/ajaxSupplier.htm")
	public String getAjaxChecked(HttpServletRequest request,HttpServletResponse response){
			try 
			{
			  PrintWriter out = response.getWriter();
			  String userName = request.getParameter("userName");
	          if(userAccountDao.userNameExists(userName))
	          {
	              
	               JSONObject obj = new JSONObject();
	               obj.put("message","Username already exists");
	               out.println(obj.get("message"));      
	           }
			}
	        catch (Exception e)
			  {
					System.out.println(e.getMessage());
			  }
	        return null;
		}
	



	@RequestMapping(method = RequestMethod.GET,value="/deleteSupplier.htm")
	public String getDeleteSupplierPage(HttpServletRequest request) throws Exception{
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
					Admin admin = (Admin) ua.getPerson();
					List<Supplier> supplierList = supplierDao.getSupplierList(admin);
					request.setAttribute("supplierList", supplierList);
				 return "deleteSupplier";
			 }
		}
		 catch (Exception e)
		    {
		        System.out.println(e.getMessage());
		    }
				
		return null;
	}
	
	@RequestMapping(method = RequestMethod.POST,value="/deleteSupplier.htm")
	public String supplierDeletedPage(HttpServletRequest request) throws Exception{
		try
		{
			String name= request.getParameter("supplier");
			Supplier supplier = supplierDao.getSupplierByName(name);
			HttpSession session = request.getSession();
			UserAccount userAccount =(UserAccount)session.getAttribute("userAccount");
			Admin admin = (Admin) userAccount.getPerson();
			supplierDao.deleteSupplier(admin, supplier);
			request.setAttribute("task", "deletedSupplier");
			request.setAttribute("supplierName", supplier.getSupplierName());
		}
		catch (Exception e)
	    {
	        System.out.println(e.getMessage());
	    }
			
		return "adminSuccess";
		
	}
	

	
	@RequestMapping(method = RequestMethod.GET,value="/viewOpenOrders.htm")
	public String viewOpenOrders(HttpServletRequest request,HttpServletResponse response){
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
				 Admin admin = (Admin) ua.getPerson();
				List<Order> orderList= orderDao.getAdminOrderList(admin);
				Set<Order> openOrderList = new HashSet<Order>();
				for(Order o:orderList)
				{
					if(o.getStatus().equalsIgnoreCase("open"))
					{
						openOrderList.add(o);
					}
				}
					request.setAttribute("openOrderList", openOrderList);
					return "adminOpenOrders";
			}	
		}
		catch (Exception e)
		{
			System.out.println(e.getMessage());
		}
		return null;
	}
				
	
}
