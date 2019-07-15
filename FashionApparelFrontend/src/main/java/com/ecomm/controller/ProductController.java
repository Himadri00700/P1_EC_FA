package com.ecomm.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ecomm.dao.CategoryDAO;
import com.ecomm.dao.ProductDAO;
import com.ecomm.dao.SupplierDAO;
import com.ecomm.model.Category;
import com.ecomm.model.Product;
import com.ecomm.model.Supplier;

@Controller
public class ProductController {
	
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	SupplierDAO supplierDAO;
	
	@RequestMapping(value="/product")
	public String showProductPage(Model m) {
		Product product=new Product();
		m.addAttribute(product);
		
		List<Product> productList=productDAO.listProducts();
		m.addAttribute("productList", productList);
		
		List<Category> listCategory=categoryDAO.listCategories();
		m.addAttribute("categoryList", this.categoryDetailGeneration(listCategory));
		
		List<Supplier> listSupplier=supplierDAO.listSuppliers();
		m.addAttribute("supplierList", this.supplierDetailGeneration(listSupplier));
		
		return "Product";
	}
	
	@RequestMapping(value="/categoryWise/{categoryId}")
	public String categoryWiseProductDisplay(@PathVariable("categoryId")int categoryId, Model m) {
		
		List<Product> productList=productDAO.listProductsCategoryWise(categoryId);
		m.addAttribute("productList", productList);
		
		return "ProductDisplay";
	}
	
	@RequestMapping(value="/insertProduct", method=RequestMethod.POST)
	public String insertProduct(@ModelAttribute("product")Product product, @RequestParam("pimage")MultipartFile prodImage, BindingResult result, Model m) {
		
		productDAO.addProduct(product);
		 
		Product product1=new Product();
		m.addAttribute(product1);
		
		List<Product> productList=productDAO.listProducts();
		m.addAttribute("productList", productList);
		
		//Adding the Image
		String path="F:\\NIIT_Projects\\Proj_1_E-Commerce_FashionApparel\\FashionApparelFrontend\\src\\main\\webapp\\resources\\images\\";
		path=path+String.valueOf(product.getProductId())+".jpg";
		File imageFile=new File(path);
		
		if(!prodImage.isEmpty()) {
			
			try {
				byte buffer[]=prodImage.getBytes();
				FileOutputStream fos=new FileOutputStream(imageFile);
				BufferedOutputStream bos=new BufferedOutputStream(fos);
				bos.write(buffer);
				bos.close();
			}
			catch(Exception e) {
				System.out.println("Error Occured: "+e);
			}
		}
		else {
			System.out.println("File is Empty! ");
		}
		//Complete the Image adding process
		
		List<Category> listCategory=categoryDAO.listCategories();
		m.addAttribute("categoryList", this.categoryDetailGeneration(listCategory));
		
		List<Supplier> listSupplier=supplierDAO.listSuppliers();
		m.addAttribute("supplierList", this.supplierDetailGeneration(listSupplier));
		
		return "Product";
	}
	
	@RequestMapping(value="/deleteProduct/{productId}")
	public String deletProduct(@PathVariable(value="productId")int productId, Model m) {
		
		Product tempProduct=productDAO.getProduct(productId);
		productDAO.deleteProduct(tempProduct);
		
		Product product1=new Product();
		m.addAttribute(product1);
		
		List<Product> productList=productDAO.listProducts();
		m.addAttribute("productList", productList);
		
		List<Category> listCategory=categoryDAO.listCategories();
		m.addAttribute("categoryList", this.categoryDetailGeneration(listCategory));
		
		List<Supplier> listSupplier=supplierDAO.listSuppliers();
		m.addAttribute("supplierList", this.supplierDetailGeneration(listSupplier));
		
		return "Product";
	}
	
	@RequestMapping(value="/productDisplay")
	public String showProducts(Model m) {
		
		List<Product> productList=productDAO.listProducts();
		m.addAttribute("productList", productList);
		
		return "ProductDisplay";
	}
	
	@RequestMapping(value="/productDetails/{productId}")
	public String showProductDetails(@PathVariable("productId")int productId, Model m) {
		
		Product product=productDAO.getProduct(productId);
		m.addAttribute("product", product);
		
		return "ProductDetails";
	}
	
	@RequestMapping(value="/editProduct/{productId}")
	public String editProduct(@PathVariable(value="productId")int productId, Model m) {
		
		Product tempProduct=productDAO.getProduct(productId);
		m.addAttribute(tempProduct);
		
		List<Category> listCategory=categoryDAO.listCategories();
		m.addAttribute("categoryList", this.categoryDetailGeneration(listCategory));
		
		List<Supplier> listSupplier=supplierDAO.listSuppliers();
		m.addAttribute("supplierList", this.supplierDetailGeneration(listSupplier));
		
		return "UpdateProduct";
	}
	
	@RequestMapping(value="/updateProduct", method=RequestMethod.POST)
	public String updateProduct(@RequestParam("productId")int productId, @RequestParam("productName")String productName, @RequestParam("productDesc")String productDesc, @RequestParam("price")int price, @RequestParam("stock")int stock, @RequestParam("categoryId")int categoryId, @RequestParam("supplierId")int supplierId, @RequestParam("pimage")MultipartFile pimage, Model m) {
		
		Product product=productDAO.getProduct(productId);
		product.setProductName(productName);
		product.setProductDesc(productDesc);
		product.setPrice(price);
		product.setStock(stock);
		product.setCategoryId(categoryId);
		product.setSupplierId(supplierId);
		product.setPimage(pimage);;
		
		String path="F:\\NIIT_Projects\\Proj_1_E-Commerce_FashionApparel\\FashionApparelFrontend\\src\\main\\webapp\\resources\\images\\";
		path=path+String.valueOf(product.getProductId())+".jpg";
		File imageFile=new File(path);
		
		if(!pimage.isEmpty()) {
			
			try {
				byte buffer[]=pimage.getBytes();
				FileOutputStream fos=new FileOutputStream(imageFile);
				BufferedOutputStream bos=new BufferedOutputStream(fos);
				bos.write(buffer);
				bos.close();
			}
			catch(Exception e) {
				System.out.println("Error Occured: "+e);
			}
		}
		else {
			System.out.println("File is Empty! ");
		}
		
		productDAO.updateProduct(product);
		
		List<Product> productList=productDAO.listProducts();
		m.addAttribute("productList", productList);
		
		List<Category> listCategory=categoryDAO.listCategories();
		m.addAttribute("categoryList", this.categoryDetailGeneration(listCategory));
		
		List<Supplier> listSupplier=supplierDAO.listSuppliers();
		m.addAttribute("supplierList", this.supplierDetailGeneration(listSupplier));
		
		return "UpdateProduct";
	}
	
	public LinkedHashMap<Integer, String> categoryDetailGeneration(List<Category> listCategories) {
		
		LinkedHashMap<Integer, String> categoryList=new LinkedHashMap<Integer, String>();
		int count=0;
		
		while(count<listCategories.size()) {
			
			Category category=listCategories.get(count);
			
			categoryList.put(category.getCategoryId(), category.getCategoryName());
			
			count++; 
		}
		
		return categoryList;
	}
	
	public LinkedHashMap<Integer, String> supplierDetailGeneration(List<Supplier> listSuppliers) {
		
		LinkedHashMap<Integer, String> supplierList=new LinkedHashMap<Integer, String>();
		int count=0;
		
		while(count<listSuppliers.size()) {
			
			Supplier supplier=listSuppliers.get(count);
			
			supplierList.put(supplier.getSupplierId(), supplier.getSupplierName());
			
			count++; 
		}
		
		return supplierList;
	}
}
