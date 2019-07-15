package com.ecomm.test;

import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.ecomm.dao.CartDAO;
import com.ecomm.model.Cart;

public class CartDAOTest {
	static CartDAO cartDAO;
	
	@BeforeClass
	public static void executeFirst() {
		AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext();
		context.scan("com.ecomm");
		context.refresh();
		
		cartDAO=(CartDAO)context.getBean("cartDAO");
	}
	
	@Ignore
	@Test
	public void addCartItemTest() {
		Cart cartItem=new Cart();
		cartItem.setProductId(3);
		cartItem.setProductName("US Polo T-Shirt");
		cartItem.setPrice(1499);
		cartItem.setQuantity(5);
		cartItem.setStatus("NP");
		cartItem.setUsername("sudipta");
		
		assertTrue("Problem Occured during Adding CartItem to Cart: ", cartDAO.addToCart(cartItem));
	}
	
	@Ignore
	@Test
	public void deleteCartItemTest() {
		Cart cartItem=cartDAO.getCartItem(4);
		
		assertTrue("Problem Occured during Deleting CartItem from Cart: ", cartDAO.deleteCartItem(cartItem));
	}
	
	@Ignore
	@Test
	public void updateCartItemTest() {
		Cart cartItem=cartDAO.getCartItem(3);
//		cartItem.setProductId(5);
//		cartItem.setProductName("");
//		cartItem.setPrice(9999);
		cartItem.setQuantity(2);
//		cartItem.setStatus("");
//		cartItem.setUsername("");
		
		assertTrue("Problem Occured during Adding CartItem to Cart: ", cartDAO.updateCartItem(cartItem));
	}
	
	@Ignore
	@Test
	public void listCartItemsTest() {
		List<Cart> listCartItems=cartDAO.listCartItems("sudipta");
		
		assertTrue("Problem Occured while retriving the CartItems:", listCartItems.size()>0);
		
		for(Cart cartItem:listCartItems) {
			System.out.print(cartItem.getProductId()+" :: ");
			System.out.print(cartItem.getProductName()+" :: ");
			System.out.print(cartItem.getQuantity()+" :: ");
			System.out.println(cartItem.getUsername());	
		}
	}
}
