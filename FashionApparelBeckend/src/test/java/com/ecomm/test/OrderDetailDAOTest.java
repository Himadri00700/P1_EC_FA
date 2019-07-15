package com.ecomm.test;

import static org.junit.Assert.assertTrue;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.ecomm.dao.OrderDAO;
import com.ecomm.model.OrderDetail;

public class OrderDetailDAOTest {
	
	static OrderDAO orderDAO;
	
	@BeforeClass
	public static void executeFirst() {
		AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext();
		context.scan("com.ecomm");
		context.refresh();
		
		orderDAO=(OrderDAO)context.getBean("orderDAO");
	}
	
	@Test
	public void testPayment( ) {
		
		OrderDetail orderDetail=new OrderDetail();
		orderDetail.setTotalShoppingAmount(3297);
		orderDetail.setPmode("cc");
		orderDetail.setUsername("sudipta");
		orderDetail.setOrderDate(new java.util.Date());
		
		orderDAO.payment(orderDetail);
		
		assertTrue("Problem in Updating Cart: ", orderDAO.updateCartItemStatus("sudipta", orderDetail.getOrderId()));
	}

}
