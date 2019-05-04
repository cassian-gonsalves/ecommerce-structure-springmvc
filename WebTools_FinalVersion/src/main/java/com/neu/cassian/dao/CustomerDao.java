package com.neu.cassian.dao;

import java.util.ArrayList;

import org.hibernate.HibernateException;
import org.hibernate.Query;

import com.neu.cassian.pojo.Address;
import com.neu.cassian.pojo.Admin;
import com.neu.cassian.pojo.Customer;
import com.neu.cassian.pojo.Order;
import com.neu.cassian.pojo.OrderItem;
import com.neu.cassian.pojo.Product;
import com.neu.cassian.pojo.UserAccount;

public class CustomerDao extends Dao{
		
		
		
		public void addOrder(Customer customer,ArrayList<Product> myCart) throws Exception{
		try
		{
			txnBegin();
			Order o = new Order();
			for(Product p:myCart)
			{
				OrderItem oi =new OrderItem();
				oi.setProduct(p);
				oi.setQuantity(p.getAvailability());
				
				oi.setOrder(o);
				o.getOrderItemList().add(oi);
			}
			o.setStatus("Open");
			Query q = getSession().createQuery("from Admin");
			Admin admin = (Admin)q.uniqueResult();
			o.setAdmin(admin);
			o.setCustomer(customer);
			customer.getOrderList().add(o);
			admin.getOrderList().add(o);
			getSession().saveOrUpdate(admin);
			getSession().saveOrUpdate(customer);
			txnCommit();	
		}
		catch (HibernateException e) 
		{
			txnRollback();
			throw new Exception("Could not save Customer " + e.getMessage());
		}
		finally
		{
			sessionClose();
		}
	}
		
		
		public void addCustomer(Customer customer) throws Exception
		{
			try
			{
				txnBegin();
				
				Customer c = new Customer();
				Address a = new Address();
				UserAccount ua = new UserAccount();
				
				c.setMiddleName(customer.getMiddleName());
				c.setLastName(customer.getLastName());
				c.setAge(customer.getAge());
				c.setPhoneNumber(customer.getPhoneNumber());
				c.setFirstName(customer.getFirstName());
				c.setGender(customer.getGender());
				
				a.setZipCode(customer.getAddress().getZipCode());
				a.setCity(customer.getAddress().getCity());
				a.setState(customer.getAddress().getState());
				a.setAddressLine1(customer.getAddress().getAddressLine1());
				a.setAddressLine2(customer.getAddress().getAddressLine2());
				a.setCountry(customer.getAddress().getCountry());
					
				
				c.setAddress(a);
				
				ua.setPassword(customer.getPassword());
				ua.setUserName(customer.getUserName());
				ua.setRole("customer");
				ua.setPerson(customer);
				
		        getSession().save(customer);
		        getSession().save(ua);
		        
		        txnCommit();
	        }
		
			catch (HibernateException e) 
			{
				throw new Exception("Could not save Customer " + e.getMessage());
			}
		
			finally
			{
				sessionClose();
			}
		}
		
		

}
