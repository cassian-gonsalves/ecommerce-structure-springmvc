package com.neu.cassian.dao;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.tool.schema.internal.HibernateSchemaManagementTool;

import com.neu.cassian.pojo.Address;
import com.neu.cassian.pojo.Admin;
import com.neu.cassian.pojo.Supplier;
import com.neu.cassian.pojo.UserAccount;

public class SupplierDao extends Dao{
	
	public Supplier getSupplierByName(String name) throws Exception
	{
		try
		{
			Query q = getSession().createQuery("from Supplier where supplierName = :name");
			q.setString("name",name);
			Supplier s = (Supplier)q.uniqueResult();
			return s;
		}
		catch (HibernateException e) 
		{
			txnRollback();
			throw new Exception("Could not fetch Supplier " + e.getMessage());
		}
	
		finally
		{
			sessionClose();
		}
	}
	
	public void addSupplier(String supplierName,String addressLine1,String addressLine2,String city,String state,String country,String zipCode,String phoneNumber,String emailAddress,String userName,String password,Admin admin) throws Exception
	{
		try
		{
			txnBegin();
			
			Supplier s = new Supplier();
			Address a = new Address();
			UserAccount ua = new UserAccount();
			
			s.setSupplierName(supplierName);
			s.setPhoneNumber(phoneNumber);
			
			a.setCity(city);
			a.setState(state);
			a.setAddressLine1(addressLine1);
			a.setAddressLine2(addressLine2);
			a.setCountry(country);
			a.setZipCode(zipCode);
			s.setAddress(a);
			s.setAdmin(admin); //Setting Admin in Supplier
			admin.getSupplierList().add(s); //Adding supplier to Admin's SupplierList

			ua.setPassword(password);
			ua.setUserName(userName);
			ua.setRole("supplier");//Creating entry for Supplier in UserAccount table
			ua.setPerson(s);
	        getSession().saveOrUpdate(admin);
	        getSession().save(ua);
	        txnCommit();
        }
	
		catch (HibernateException e) 
		{
			txnRollback();
			throw new Exception("Could not save Supplier " + e.getMessage());
		}
	
		finally
		{
			sessionClose();
		}

	}
	
	public List<Supplier> getSupplierList(Admin admin) throws Exception
	{
		try
		{
			Query q = getSession().createQuery("select supplierList from Admin" );
			List<Supplier> list = q.list();
			
			return list;
		}
		catch (HibernateException e) 
		{
			throw new Exception("Could not fetch Suppliers List. " + e.getMessage());
		}
	
		finally
		{
			sessionClose();
		}

		
	}
	

	
	public void deleteSupplier(Admin a,Supplier s) throws Exception
	{
		try
		{
			int rowsAffected=0;
			txnBegin();
			
			Query q1 = getSession().createQuery("delete from UserAccount where person = :person");
			q1.setParameter("person", s);
		    rowsAffected = q1.executeUpdate();
		    
			Query q = getSession().createQuery("delete from Supplier where personId = :supplierId");
			q.setInteger("supplierId", s.getPersonId());
		    rowsAffected = q.executeUpdate();
		    a.getSupplierList().remove(s);//Removing from Admin's Supplier List
			
			getSession().saveOrUpdate(a);
			txnCommit();
		}
		catch (HibernateException e) 
		{
			txnRollback();
			throw new Exception("Could not delete Supplier " + e.getMessage());
		}
	
		finally
		{
			sessionClose();
		}

	}
	

}
