package com.ecomm.dao;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ecomm.model.UserDetail;

@Repository("userDAO")
@Transactional
public class UserDAOImpl implements UserDAO {
	
	@Autowired
	SessionFactory sessionFactory;
	
	public boolean registerUser(UserDetail user) {
		try {
			sessionFactory.getCurrentSession().save(user);
			return true;
		}
		catch(Exception e) {
			System.out.println("Exception: "+e);
			return false;
		}	
	}

	public boolean updateUserDetail(UserDetail user) {
		try {
			sessionFactory.getCurrentSession().update(user);
			return true;
		}
		catch(Exception e) {
			System.out.println("Exception: "+e);
			return false;
		}
	}

	public UserDetail getUser(String username) {
		Session session=sessionFactory.openSession();
		UserDetail user=session.get(UserDetail.class, username);
		session.close();
		return user;
	}
}
