package com.neu.cassian.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Controller;

import com.neu.cassian.pojo.Admin;
import com.neu.cassian.pojo.Customer;
import com.neu.cassian.pojo.Order;
import com.neu.cassian.pojo.Supplier;
import com.neu.cassian.pojo.UserAccount;

@Controller
public class OrderDao extends Dao{

	public List<Order> getAdminOrderList(Admin admin) throws Exception
	{
		try
		{
			Query q = getSession().createQuery("from Order where admin=:admin");
			q.setParameter("admin", admin);
			List<Order> list = q.list();
			return list;
		}
		catch (HibernateException e) 
		{
			throw new Exception("Could not fetch Orders List. " + e.getMessage());
		}
	
		finally
		{
			sessionClose();
		}
	}
	
	public List<Order> getCustomerOrderList(Customer customer) throws Exception
	{
		try
		{
			Query q = getSession().createQuery("from Order where customer=:customer");
			q.setParameter("customer", customer);
			List<Order> list = q.list();
			return list;
		}
		catch (HibernateException e) 
		{
			throw new Exception("Could not fetch Orders List. " + e.getMessage());
		}
	
		finally
		{
			sessionClose();
		}
	}
	
	public void updateOrder(Order o) throws Exception {
		try 
		{
			txnBegin();
			
			Order updatedOrder = o;
			Admin admin = o.getAdmin();
			Customer customer = o.getCustomer();
			
			updatedOrder.setStatus("Shipped");
			
			admin.getOrderList().remove(o);
			admin.getOrderList().add(updatedOrder);
			
			customer.getOrderList().remove(o);
			customer.getOrderList().add(updatedOrder);
			
			getSession().saveOrUpdate(admin);
			getSession().saveOrUpdate(customer);
			
			txnCommit();
			
		} 
		
		catch (HibernateException e) 
		{
			txnRollback();
			throw new Exception("Invalid Credentials " + e.getMessage());
		}
		
		finally
		{
			sessionClose();
		}
	}
	
	public void cancelOrder(Order o) throws Exception {
		try 
		{
			txnBegin();
			
			Admin admin = o.getAdmin();
			Customer customer = o.getCustomer();	

			Query q=getSession().createQuery("delete from OrderItem where order=:order");
			q.setParameter("order", o);
		    q.executeUpdate();
			
			Query q1=getSession().createQuery("delete from Order where orderId=:orderId");
			q1.setInteger("orderId", o.getOrderId());
		    q1.executeUpdate();
			
			admin.getOrderList().remove(o);
			
			customer.getOrderList().remove(o);
			
			getSession().saveOrUpdate(admin);
			getSession().saveOrUpdate(customer);
			
			txnCommit();
			
		} 
		
		catch (HibernateException e) 
		{
			txnRollback();
			throw new Exception("Invalid Credentials " + e.getMessage());
		}
		
		finally
		{
			sessionClose();
		}
	}
	
	
	

}
