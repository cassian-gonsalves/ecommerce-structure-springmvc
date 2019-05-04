package com.neu.cassian.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.neu.cassian.dao.CustomerDao;
import com.neu.cassian.dao.OrderDao;
import com.neu.cassian.dao.ProductDao;
import com.neu.cassian.dao.SupplierDao;
import com.neu.cassian.pojo.Admin;
import com.neu.cassian.pojo.Customer;
import com.neu.cassian.pojo.Order;
import com.neu.cassian.pojo.Product;
import com.neu.cassian.pojo.Supplier;
import com.neu.cassian.pojo.UserAccount;

@Controller
public class CustomerController {
	
	@Autowired
	@Qualifier("orderDao")
	OrderDao orderDao ;
	
	@Autowired
	@Qualifier("customerDao")
	CustomerDao customerDao;
	
	@Autowired
	@Qualifier("productDao")
	ProductDao productDao;


	@RequestMapping(method = RequestMethod.GET,value="/search.htm")
	public String getSearchPage(HttpServletRequest request,HttpServletResponse response){
			try 
			{
				
				String searchKey = request.getParameter("key");
				System.out.print(searchKey);
				int pageNumber = 1;
				
				String productListSize="";
				
				List<Product> productList = productDao.getProducts(searchKey);
				int size=productList.size();
				if(size>(1*2))
				{
					productListSize = "more";
				}
				else
				{
					productListSize = "notMore";
				}
				
				List<Product> productListToBeSent = new ArrayList<Product>();
				
				int startpage=(pageNumber-1)*2+1;
				int endpage=(pageNumber*2);
				for( int i=startpage;i<=endpage;i++)
				{
					if(i<=productList.size())
					{
						productListToBeSent.add(productList.get(i-1));
					}
				}
				request.setAttribute("searchKey",searchKey);
				request.setAttribute("productListSize", productListSize);
				request.setAttribute("pageNumber",1);
				request.setAttribute("productList", productListToBeSent);
				
			} 
			catch (Exception e)
			{
				System.out.println(e.getMessage());
			}
				
			return "searchedProducts";
		}
	
	@RequestMapping(method = RequestMethod.GET,value="/product.htm")
	public String getviewProductPage(HttpServletRequest request,HttpServletResponse response){
			try 
			{
				int productId = Integer.parseInt(request.getParameter("productId"));
				Product product = productDao.getProductById(productId);
				request.setAttribute("product", product);
				Supplier supplier=  product.getSupplier();
				request.setAttribute("supplier", supplier);
			} 
			catch (Exception e)
			{
				System.out.println(e.getMessage());
			}
				
			return "viewProduct";
		}
	
	@RequestMapping(method = RequestMethod.GET,value="/addToCart.htm")
	public String onAddToCartError(HttpServletRequest request){
		 try 
		 {
			 HttpSession session = request.getSession();
			 UserAccount ua = (UserAccount)session.getAttribute("userAccount");
		 
			 }
		     catch (Exception e) 
				 {
		  	   System.out.println(e.getMessage());
				 }
				 
				 return "login";
	 }
	
	@RequestMapping(method = RequestMethod.GET,value="/nextPage.htm")
	public String getNextPage(HttpServletRequest request,HttpServletResponse response){
			try 
			{
				String searchKey = request.getParameter("key");
				
				int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
				
				String productListSize="";
				
				List<Product> productList = productDao.getProducts(searchKey);
				int size=productList.size();
				if(size>(pageNumber*2))
				{
					productListSize = "more";
				}
				else
				{
					productListSize = "notMore";
				}
				List<Product> productListToBeSent = new ArrayList<Product>();
				
				int startpage=(pageNumber-1)*2+1;
				int endpage=(pageNumber*2);
				
				for( int i=startpage;i<=endpage;i++)
				{
					if(i<=productList.size())
					{
						productListToBeSent.add(productList.get(i-1));
					}
				}
				request.setAttribute("searchKey",searchKey);
				request.setAttribute("productListSize", productListSize);
				request.setAttribute("pageNumber",pageNumber);
				request.setAttribute("productList", productListToBeSent);	
			} 
			catch (Exception e)
			{
				System.out.println(e.getMessage());
			}
				
			return "searchedProducts";
		}
	
	@RequestMapping(method = RequestMethod.GET,value="/previousPage.htm")
	public String getPreviousPage(HttpServletRequest request,HttpServletResponse response){
			try 
			{
				String searchKey = request.getParameter("key");
				
				int pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
				
				String productListSize="";
				
				List<Product> productList = productDao.getProducts(searchKey);
				int size=productList.size();
				if(size>(pageNumber*2))
				{
					productListSize = "more";
				}
				else
				{
					productListSize = "notMore";
				}
				
				List<Product> productListToBeSent = new ArrayList<Product>();
				
				int startpage=(pageNumber-1)*2+1;
				int endpage=(pageNumber*2);
				for( int i=startpage;i<=endpage;i++)
				{
					if(i<=productList.size())
					{
						productListToBeSent.add(productList.get(i-1));
					}
				}
				
				
				request.setAttribute("searchKey",searchKey);
				
				request.setAttribute("productListSize", productListSize);
				
				request.setAttribute("pageNumber",pageNumber);
			
				request.setAttribute("productList", productListToBeSent);
				
			} 
			catch (Exception e)
			{
				System.out.println(e.getMessage());
			}
				
			return "searchedProducts";
		}
	 
	
	@RequestMapping(method = RequestMethod.POST,value="/addToCart.htm")
	public String getViewCart(HttpServletRequest request,HttpServletResponse response){
			try 
			{
				   HttpSession session=request.getSession();
	               ArrayList<Product> myCart;
	               if(session.getAttribute("myCart")==null)
	               {
	                   myCart = new ArrayList<Product>();
	               }
	               else
	               {
	                   myCart=(ArrayList<Product>)session.getAttribute("myCart");
	               }
	               
	               int Quantity = Integer.parseInt(request.getParameter("quantity"));
	               int productId = Integer.parseInt(request.getParameter("productId"));
	               float price = Float.parseFloat(request.getParameter("price"));
	               int supplierId = Integer.parseInt(request.getParameter("supplierId"));
	               
	               List<Product> productList = productDao.getProductList();
	               
	               Product product= productDao.getProductById(productId);
	               
	               Supplier supplier = product.getSupplier();
	         
	               Product existingProduct = null;
	               if(myCart.size()>0)
	               {
		               for(Product p:myCart)
		               {
		            	   if(p.getProductId()==productId)
		            	   {
		            		   existingProduct=p;
		            	   }
		               }
	               }
	               if(existingProduct!=null)
	               {
	            	   int oldQuantity=existingProduct.getAvailability();
	            	   int newQuntity = oldQuantity+Quantity;
	            	   existingProduct.setAvailability(newQuntity);
	               }
	               else
	               {
	            	   product.setAvailability(Quantity);
	                   myCart.add(product); 
	               }
	         
	               System.out.println("Cart :" + myCart.size());
	                    float totalAmount = 0;
	                    for (Product p : myCart)
	                    {
	                        totalAmount = totalAmount + (p.getAvailability()*p.getPrice());
	                    }
	               
	               session.setAttribute("myCart", myCart);
	               session.setAttribute("totalAmount", totalAmount);
	               
	               
			}
				catch (Exception e)
				{
					System.out.println(e.getMessage());
				}
					
				return "viewCart";
			}

	@RequestMapping(method = RequestMethod.GET,value="/viewCart.htm")
	public String gethome(HttpServletRequest request){
		return "viewCart";
	}


	 @RequestMapping(method = RequestMethod.GET,value="/remove.htm")
		public String removeProduct(HttpServletRequest request,HttpServletResponse response){
				try 
				{
					   HttpSession session=request.getSession();
		               ArrayList<Product> myCart=(ArrayList<Product>)session.getAttribute("myCart");
		               float totalAmount=(Float)session.getAttribute("totalAmount");

		               int quantity = Integer.parseInt(request.getParameter("quantity"));
		               int productId = Integer.parseInt(request.getParameter("productId"));
		               float price = Float.parseFloat(request.getParameter("price"));
		               
		               Product existingProduct = null;
		               for(Product p:myCart)
		               {
		            	   if(p.getProductId()==productId)
		            	   {
		            		   existingProduct=p;
		            	   }
		               }
		               
		               myCart.remove(existingProduct);
		               totalAmount = totalAmount-(quantity * price);
		               
		               session.setAttribute("myCart", myCart);
		               session.setAttribute("totalAmount", totalAmount);
		               System.out.println("Cart new Size:" + myCart.size());
		               
				}
					catch (Exception e)
					{
						System.out.println(e.getMessage());
					}
						
					return "viewCart";
				}
	 
	 @RequestMapping(method = RequestMethod.GET,value="/checkOut.htm")
		public String onCheckOutError(HttpServletRequest request){
		 try 
		 {
			 HttpSession session = request.getSession();
			 UserAccount ua = (UserAccount)session.getAttribute("userAccount");
			 if(ua==null)
			 {
				 return "login";
			 }
			 }
		     catch (Exception e) 
				 {
		  	   System.out.println(e.getMessage());
				 }
				 
				 return null;
	 }
	 
	 
	 @RequestMapping(method = RequestMethod.POST,value="/checkOut.htm")
		public String onCheckOut(HttpServletRequest request){
		 try 
		 {
			 HttpSession session = request.getSession();
			 UserAccount ua = (UserAccount)session.getAttribute("userAccount");
			 
			 if(ua!=null)
			 {
				 Customer customer = (Customer) ua.getPerson();
				 
				 ArrayList<Product> myCart = (ArrayList<Product>)session.getAttribute("myCart");
					
				 customerDao.addOrder(customer,myCart);
				 
				 session.removeAttribute("myCart");
				 session.removeAttribute("totalAmount");
				 request.setAttribute("task", "checkedOut");
				 
				 return "customerSuccess";
			 }
			 else if(ua==null)
			 {
				 request.setAttribute("isCheckingOut", "true");
				 return "login";
			 }
	     }
       catch (Exception e) 
		 {
    	   System.out.println(e.getMessage());
		 }
		 
		 return null;
		
	 }
		
	 
	@RequestMapping(method = RequestMethod.POST,value="/ajaxProduct.htm")
	public String getAjaxChecked(HttpServletRequest request,HttpServletResponse response){
			try 
			{
			  PrintWriter out = response.getWriter();
			  String searchKey = request.getParameter("searchKey");
			  List<Product> productList = productDao.getProductList();
			  
			  JSONArray jsonArray = new JSONArray();
              for (int i=0; i < productList.size(); i++)
              {
                  JSONObject obj = new JSONObject();
                  obj.put("productName", productList.get(i).getProductName());
                  jsonArray.put(obj);
              }
      
              JSONObject Obj = new JSONObject();
              Obj.put("products", jsonArray);
              out.println(Obj);
			}
	        catch (Exception e)
			  {
					System.out.println(e.getMessage());
			  }
	        return null;
		}
	
	@RequestMapping(method = RequestMethod.GET,value="/orderHistory.htm")
		public String viewOrderHistory(HttpServletRequest request,HttpServletResponse response){
			try 
			{
				HttpSession session = request.getSession();
				UserAccount ua = (UserAccount)session.getAttribute("userAccount");
				Customer customer = (Customer) ua.getPerson();
				List<Order> orderList= orderDao.getCustomerOrderList(customer);
				request.setAttribute("orderList", orderList);
				
			}
			catch (Exception e)
			{
				System.out.println(e.getMessage());
			}
			return "customerOrderHistory";
		}
	
		@RequestMapping(method = RequestMethod.GET,value="/cancelOrder.htm")
		public String cancelOrder(HttpServletRequest request,HttpServletResponse response){
			try 
			{
				HttpSession session = request.getSession();
				UserAccount ua = (UserAccount)session.getAttribute("userAccount");
				Customer customer = (Customer) ua.getPerson();
				List<Order> orderList= orderDao.getCustomerOrderList(customer);
				
				int orderId= Integer.parseInt(request.getParameter("orderId"));
				
				for(Order o:orderList)
				{
					if(o.getOrderId()==orderId)
					{
						orderDao.cancelOrder(o);
					}
				}
				
				orderList =orderDao.getCustomerOrderList(customer);
				request.setAttribute("orderList", orderList);
				
			}
			catch (Exception e)
			{
				System.out.println(e.getMessage());
			}
			return "customerOrderHistory";
		}
}
