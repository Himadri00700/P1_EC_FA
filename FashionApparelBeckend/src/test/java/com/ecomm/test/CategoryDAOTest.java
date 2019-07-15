package com.ecomm.test;

import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.ecomm.dao.CategoryDAO;
import com.ecomm.model.Category;

public class CategoryDAOTest {
	
static CategoryDAO categoryDAO;
	
	@BeforeClass
	public static void executeFirst() {
		AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext();
		context.scan("com.ecomm");
		context.refresh();
		
		categoryDAO=(CategoryDAO)context.getBean("categoryDAO");
	}
	
	@Ignore
	@Test
	public void addCategoryTest() {
		Category category=new Category();
		category.setCategoryName("Women's");
		category.setCategoryDesc("All Clothing, Footware, Accessories for Men");
		
		assertTrue("Problem Occured during Adding:", categoryDAO.addCategory(category));
	}
	
	@Ignore
	@Test
	public void listCategoryTest() {
		List<Category> categoryList=categoryDAO.listCategories();
		
		assertTrue("Problem Occured while retriving the List:", categoryList.size()>0);
		
		for(Category category: categoryList) {
			System.out.print(category.getCategoryId()+"  ::  ");
			System.out.print(category.getCategoryName()+"  ::  ");
			System.out.println(category.getCategoryDesc()+"  ::  ");
		}
	}
	
	@Ignore
	@Test
	public void updateCategoryTest() {
		Category category=categoryDAO.getCategory(1);
		category.setCategoryDesc("All Clothing, Footware, Accessories for Women");
		category.setCategoryName("Women's");
		
		assertTrue("Problem Occured while update:", categoryDAO.updateCategory(category));
	}
	
	@Ignore
	@Test
	public void deleteCategoryTest() {
		Category category=categoryDAO.getCategory(3);
		
		assertTrue("Problem Occured while deleting:", categoryDAO.deleteCategory(category));
	}
}
