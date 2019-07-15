package com.ecomm.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ecomm.model.Cart;

@Repository("cartDAO")
@Transactional
public class CartDAOImpl implements CartDAO {
	
	@Autowired
	SessionFactory sessionFactory;
	
	public boolean addToCart(Cart cartItem) {
		try {
			sessionFactory.getCurrentSession().save(cartItem);
			return true;
		}
		catch(Exception e) {
			System.out.println("Exception: "+e);
			return false;
		}
	}

	public boolean deleteCartItem(Cart cartItem) {
		try {
			sessionFactory.getCurrentSession().delete(cartItem);
			return true;
		}
		catch(Exception e) {
			System.out.println("Exception: "+e);
			return false;
		}
	}

	public boolean updateCartItem(Cart cartItem) {
		try {
			sessionFactory.getCurrentSession().update(cartItem);
			return true;
		}
		catch(Exception e) {
			System.out.println("Exception: "+e);
			return false;
		}
	}

	public List<Cart> listCartItems(String username) {
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Cart where username=:uname and status='NP'");
		query.setParameter("uname", username);
		List<Cart> listCartItems=query.list();
		session.close();
		return listCartItems;
	}

	public Cart getCartItem(int cartItemId) {
		Session session=sessionFactory.openSession();
		Cart cartItem=session.get(Cart.class, cartItemId);
		session.close();
		return cartItem;
	}
}
