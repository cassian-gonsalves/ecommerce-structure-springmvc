package com.neu.cassian.dao;

import java.util.logging.Level;
import java.util.logging.Logger;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;


public class Dao {
	
private static final Logger log = Logger.getAnonymousLogger();
    
	private static final ThreadLocal sessionThread = new ThreadLocal();
    private static final SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();

    protected Dao() {
    }

    public static Session getSession()
    {
        Session session = (Session) Dao.sessionThread.get();
        
        if (session == null)
        {
            session = sessionFactory.openSession();
            Dao.sessionThread.set(session);
        }
        return session;
    }

    protected void txnBegin()
    {
        getSession().beginTransaction();
    }

    protected void txnCommit() 
    {
        getSession().getTransaction().commit();
    }

    protected void txnRollback() {
        try 
        {
            getSession().getTransaction().rollback();
        } 
        catch (HibernateException e) 
        {
            log.log(Level.WARNING, "Cannot rollback", e);
        }
        try 
        {
            getSession().close();
        } 
        catch (HibernateException e) 
        {
            log.log(Level.WARNING, "Cannot close", e);
        }
        Dao.sessionThread.set(null);
    }

    public static void sessionClose() 
    {
        getSession().close();
        Dao.sessionThread.set(null);
    }

}
