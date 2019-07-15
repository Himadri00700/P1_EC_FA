package com.ecomm.test;

import static org.junit.Assert.assertTrue;

import java.util.List;

import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.ecomm.dao.SupplierDAO;
import com.ecomm.model.Supplier;

public class SupplierDAOTest {

	static SupplierDAO supplierDAO;
	
	@BeforeClass
	public static void executeFirst() {
		AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext();
		context.scan("com.ecomm");
		context.refresh();
		
		supplierDAO=(SupplierDAO)context.getBean("supplierDAO");
	}
	
	@Ignore
	@Test
	public void addSupplierTest() {
		Supplier supplier=new Supplier();
		supplier.setSupplierName("Sudipta Das");
		supplier.setSupplierAddr("Sonarpur, Kolkata-700150");
		
		assertTrue("Problem Occured during Adding: ", supplierDAO.addSupplier(supplier));
	}
	
	@Ignore
	@Test
	public void updateSupplierTest() {
		Supplier supplier=supplierDAO.getSupplier(34);
		supplier.setSupplierName("Amit Sarkar");
		supplier.setSupplierAddr("Barhampore, Murshidabad");
		
		assertTrue("Problem Occured while Updating: ", supplierDAO.updateSupplier(supplier));
	}
	
	@Ignore
	@Test
	public void deleteSupplierTest() {
		Supplier supplier=supplierDAO.getSupplier(35);
		
		assertTrue("Problem Occured while Deleting: ", supplierDAO.deleteSupplier(supplier));
	}
	
	@Ignore
	@Test
	public void listSupplierTest() {
		List<Supplier> supplierList=supplierDAO.listSuppliers();
		
		assertTrue("Problem Occured while retriving the List: ", supplierList.size()>0);
		
		for(Supplier supplier: supplierList) {
			System.out.print(supplier.getSupplierId()+". ");
			System.out.print(supplier.getSupplierName()+" from ");
			System.out.println(supplier.getSupplierAddr()+".");
		}
	}
}