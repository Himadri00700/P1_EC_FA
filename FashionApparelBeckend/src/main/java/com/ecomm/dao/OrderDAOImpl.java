package com.ecomm.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.ecomm.model.OrderDetail;

@Repository("orderDAO")
@Transactional
public class OrderDAOImpl implements OrderDAO {
	
	@Autowired
	SessionFactory sessionFactory;
	
	public boolean payment(OrderDetail orderDetail) {
		try {
			sessionFactory.getCurrentSession().save(orderDetail);
			return true;
		}
		catch(Exception e) {
			System.out.println("Exception: "+e);
			return false;
		}
	}

	public boolean updateCartItemStatus(String username, int orderId) {

		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("update Cart set status='P', orderId=:ordId where username=:uname");
		query.setParameter("ordId", orderId);
		query.setParameter("uname", username);
		
		int row_eff=query.executeUpdate();
		
		if(row_eff>0)
			return true;
		else
			return false;
	}

}
