package com.ecomm.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ecomm.model.Product;

@Repository("productDAO")
@Transactional
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	public boolean addProduct(Product product) {
		try {
			sessionFactory.getCurrentSession().save(product);
			return true;
		}
		catch(Exception e) {
			System.out.println("Exception: "+e);
			return false;
		}
	}

	public boolean updateProduct(Product product) {
		try {
			sessionFactory.getCurrentSession().update(product);
			return true;
		}
		catch(Exception e) {
			System.out.println("Exception: "+e);
			return false;
		}
	}

	public boolean deleteProduct(Product product) {
		try {
			sessionFactory.getCurrentSession().delete(product);
			return true;
		}
		catch(Exception e) {
			System.out.println("Exception: "+e);
			return false;
		}
	}

	public List<Product> listProducts() {
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Product");
		List<Product> productList=query.getResultList();
		session.close();
		return productList;
	}

	public List<Product> listProductsCategoryWise(int categoryId) {
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Product where categoryId=:catid");
		query.setParameter("catid", categoryId);
		List<Product> productList=query.getResultList();
		session.close();
		return productList;
	}

	public Product getProduct(int productId) {
		Session session=sessionFactory.openSession();
		Product product=session.get(Product.class, productId);
		session.close();
		return product;
	}
}
