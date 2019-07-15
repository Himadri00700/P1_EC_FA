package com.ecomm.test;

import static org.junit.Assert.assertTrue;

import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.ecomm.dao.UserDAO;
import com.ecomm.model.UserDetail;

public class UserDAOTest {

	static UserDAO userDAO;
	
	@BeforeClass
	public static void executeFirst() {
		AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext();
		context.scan("com.ecomm");
		context.refresh();
		
		userDAO=(UserDAO)context.getBean("userDAO");
	}
	
	@Ignore
	@Test
	public void registerUserTest() {
		UserDetail user=new UserDetail();
		user.setUsername("sudipta");
		user.setPassword("pass1234");
		user.setEmailId("sudipta@gmail.com");
		user.setCustomerName("Sudipta Das");
		user.setAddress("Sonarpur, Kolkata-700150");
		user.setEnabled(true);
		user.setRole("ROLE_USER");
		
		assertTrue("Problem Occured during Adding a User: ", userDAO.registerUser(user));
	}
	
	@Ignore
	@Test
	public void updateUserTeat() {
		UserDetail user=userDAO.getUser("sudipta");
		user.setEmailId("sudipta.das@gmail.com");
		
		assertTrue("Problem in Updating the UserDetail: ", userDAO.updateUserDetail(user));
	}
}
