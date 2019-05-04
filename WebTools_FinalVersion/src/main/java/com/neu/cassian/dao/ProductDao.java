package com.neu.cassian.dao;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Transaction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import com.neu.cassian.pojo.Address;
import com.neu.cassian.pojo.Customer;
import com.neu.cassian.pojo.Product;
import com.neu.cassian.pojo.Supplier;
import com.neu.cassian.pojo.UserAccount;

public class ProductDao extends Dao {
	
	public void deleteProduct(int productId)throws Exception {
		try 
		{
			
			txnBegin();
			Criteria c = getSession().createCriteria(Product.class);
			c.add(Restrictions.eq("productId",productId));
			Product p = (Product)c.uniqueResult();
			Supplier s = p.getSupplier();
		    
			Query q = getSession().createQuery("delete from Product where productId = :productId");
			q.setInteger("productId",productId);
		    int  rowsAffected = q.executeUpdate();
			s.getProductList().remove(p); //Removing product in Supplier's ProductList
	        getSession().saveOrUpdate(s);
	        txnCommit();
			
		} 
		catch (HibernateException e) 
		{
			txnRollback();
			throw new Exception("Could not edit " + e.getMessage());
		}
		finally
		{
			sessionClose();
		}
		
	}
	
	public String editProduct(int productId,int avaialability,float price,String description)throws Exception {
		try 
		{
			
			Product p = getProductById(productId);
			Supplier s = p.getSupplier();
			Product newProduct = p;
			txnBegin();
			s.getProductList().remove(p); //Removing product in Supplier's ProductList
			newProduct.setAvailability(avaialability);
			newProduct.setDescription(description);
			newProduct.setPrice(price);
			s.getProductList().add(newProduct); //Adding product in Supplier's ProductList		
	        getSession().saveOrUpdate(s);
			
	        return newProduct.getProductName();
		} 
		catch (HibernateException e) 
		{
			throw new Exception("Could not edit " + e.getMessage());
		}
		finally
		{
			sessionClose();
		}
	}


	public List getProductList() throws Exception {
		try 
		{
			Criteria c = getSession().createCriteria(Product.class);
			List results = c.list();
			return results;
		} 
		catch (HibernateException e) 
		{
			throw new Exception("Could not list the products " + e.getMessage());
		}
		finally
		{
			sessionClose();
		}
	}
	
	
	public List getProducts(String key) throws Exception {
		try 
		{
			Criteria c = getSession().createCriteria(Product.class);
			c.add(Restrictions.like("prod_category", key ,MatchMode.ANYWHERE));
			List allResults = c.list();
			return allResults;
		} 
		catch (HibernateException e) 
		{
			throw new Exception("Could not list the products " + e.getMessage());
		}
		finally
		{
			sessionClose();
		}
	}
	
	public List getProducts(String key,int pageNumber) throws Exception {
		try 
		{
			Criteria c = getSession().createCriteria(Product.class);
			c.add(Restrictions.like("productName", key ,MatchMode.START));
			c.setFirstResult((pageNumber*2)+1);
			c.setMaxResults(2);
			List allResults = c.list();
			return allResults;
		} 
		catch (HibernateException e) 
		{
			throw new Exception("Could not list the products " + e.getMessage());
		}
		finally
		{
			sessionClose();
		}
	}
	
	public Product getProductById(int productId)throws Exception {
		try 
		{
			
			Query q = getSession().createQuery("from Product where productId = :productId");
			q.setInteger("productId",productId);
			Product result = (Product)q.uniqueResult();
			return result;
		} 
		catch (HibernateException e) 
		{
			throw new Exception("Could not fetch product " + e.getMessage());
		}
		finally
		{
			sessionClose();
		}
	}
	
	

	
	public List getProductList(Supplier s) throws Exception {
		try 
		{
			Criteria c = getSession().createCriteria(Product.class);
			c.add(Restrictions.eq("supplier",s));
			List results = c.list();
			return results;
		} 
		catch (HibernateException e) 
		{
			throw new Exception("Could not list the products " + e.getMessage());
		}
		finally
		{
			sessionClose();
		}
	}
	

	
	public void addProduct(Product product,Supplier supplier) throws Exception
	{
		try
		{
			txnBegin();
			
			Product p = new Product();
			
			p.setProductName(product.getProductName());
			p.setAvailability(product.getAvailability());
			p.setPrice(product.getPrice());
			p.setDescription(product.getDescription());
			p.setPhotoName(product.getPhotoName());
			p.setProd_category(product.getProd_category());
			p.setSupplier(supplier); //adding supplier in product
			supplier.getProductList().add(p); //Adding product in Supplier's ProductList
			
	        getSession().saveOrUpdate(supplier);
	        
	        txnCommit();
        }
	
		catch (HibernateException e) 
		{
			txnRollback();
			throw new Exception("Could not save Product " + e.getMessage());
		}
	
		finally
		{
			sessionClose();
		}
	}
}
