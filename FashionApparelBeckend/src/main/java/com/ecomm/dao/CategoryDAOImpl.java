package com.ecomm.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ecomm.model.Category;

@Repository("categoryDAO")
@Transactional
public class CategoryDAOImpl implements CategoryDAO {
	
	@Autowired
	SessionFactory sessionFactory;
	
	public boolean addCategory(Category category) {
		try {
			sessionFactory.getCurrentSession().save(category);
			return true;
		}
		catch(Exception e) {
			System.out.println("Exception: "+e);
			return false;
		}
	}

	public boolean deleteCategory(Category category) {
		try {
			sessionFactory.getCurrentSession().delete(category);
			return true;
		}
		catch(Exception e) {
			System.out.println("Exception: "+e);
			return false;
		}
	}

	public boolean updateCategory(Category category) {
		try {
			sessionFactory.getCurrentSession().update(category);
			return true;
		}
		catch(Exception e) {
			System.out.println("Exception: "+e);
			return false;
		}
	}
	
	public List<Category> listCategories() {
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Category");
		List<Category> categoryList=query.getResultList();
		session.close();
		return categoryList;
	}
	
	public Category getCategory(int categoryId) {
		Session session=sessionFactory.openSession();
		Category category=session.get(Category.class, categoryId);
		session.close();
		return category;
	}
}
