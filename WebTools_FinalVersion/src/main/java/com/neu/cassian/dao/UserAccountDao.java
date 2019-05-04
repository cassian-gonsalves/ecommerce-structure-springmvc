package com.neu.cassian.dao;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.neu.cassian.pojo.Product;
import com.neu.cassian.pojo.UserAccount;


public class UserAccountDao extends Dao{

	  public boolean userNameExists(String userName) throws Exception{
	        try 
	        {
	        	Query q=getSession().createQuery("from UserAccount where userName= :un");
	            q.setString("un",userName);
	            List list =  q.list();
				
	            if(list.size()>0)
	            {
	            	return true;
	            } 
	        } 
	        catch (HibernateException e) 
			{
				throw new Exception("Error while fetching Username " + e.getMessage());
			}
			finally
			{
				sessionClose();
			}
	       return false; 
	    }
	   
	public UserAccount getUserAccount(String userName, String password) throws Exception {
		UserAccount  userAccount = null;
		try 
		{
            txnBegin();
            Query q=getSession().createQuery("from UserAccount where userName= :un and password = :pw");
            q.setString("un",userName);
            q.setString("pw",password);
           
            userAccount = (UserAccount) q.uniqueResult();
			txnCommit();
			return userAccount;	
		} 
		catch (HibernateException e) 
		{
			throw new Exception("Invalid Credentials " + e.getMessage());
		}
		
		finally
		{
			sessionClose();
		}
	}
}
