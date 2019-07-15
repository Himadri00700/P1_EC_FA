package com.ecomm.test;

import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.ecomm.dao.ProductDAO;
import com.ecomm.model.Product;

public class ProductDAOTest {

static ProductDAO productDAO;
	
	@BeforeClass
	public static void executeFirst() {
		AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext();
		context.scan("com.ecomm");
		context.refresh();
		
		productDAO=(ProductDAO)context.getBean("productDAO");
	}
	
	@Ignore
	@Test
	public void addProductTest() {
		Product product=new Product();
		product.setProductName("Redmi5");
		product.setProductDesc("Black Redmi5 Mobile");
		product.setPrice(9999);
		product.setStock(1000);
		product.setCategoryId(2);
		product.setSupplierId(5);
		
		assertTrue("Problem Occured during adding: ", productDAO.addProduct(product));
	}
	
	@Ignore
	@Test
	public void updateProductTest() {
		Product product=productDAO.getProduct(1);
			product.setProductName("Redmi5");
			product.setProductDesc("Black Redmi5 Mobile");
			product.setPrice(9999);
			product.setStock(1000);
			product.setCategoryId(2);
			product.setSupplierId(5);
		
		assertTrue("Problem Occured while updating: ", productDAO.updateProduct(product));
	}
	
	@Ignore
	@Test
	public void deleteProductTest() {
		Product product=productDAO.getProduct(1);
		
		assertTrue("Problem Occured while deleting: ", productDAO.deleteProduct(product));
	}
	
	@Ignore
	@Test
	public void listProductTest() {
		List<Product> productList=productDAO.listProducts();
		
		assertTrue("Problem Occured while Retriving the List: ", productList.size()>0);
		
		for(Product product: productList) {
			System.out.print(product.getProductId()+". ");
			System.out.print(product.getProductName()+" ");
			System.out.print("("+product.getProductDesc()+") ");
			System.out.print("of Price Rs."+product.getPrice()+" ");
			System.out.println("(In stock: "+product.getStock()+").");
		}
	}
		
//	@Ignore
//	@Test
//	public void listProductsCategoryWiseTest(int catId) {
//		List<Product> productListCatWise=productDAO.listProductsCategoryWise(catId);
//		
//		assertTrue("Problem Occured while Retriving the List: ", productListCatWise.size()>0);
//		
//		for(Product product: productListCatWise) {
//			System.out.print(product.getCategoryId()+". ");
//			System.out.print(product.getProductName()+" ");
//			System.out.print("("+product.getProductDesc()+") ");
//			System.out.print("of Price Rs."+product.getPrice()+" ");
//			System.out.println("(In stock: "+product.getStock()+").");
//		}
//	}
}
