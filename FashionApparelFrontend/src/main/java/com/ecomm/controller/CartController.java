package com.ecomm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ecomm.dao.CartDAO;
import com.ecomm.dao.ProductDAO;
import com.ecomm.model.Cart;
import com.ecomm.model.Product;

@Controller
public class CartController {
	
	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	CartDAO cartDAO;
	
	@RequestMapping("/cart")
	public String showCartPage(HttpSession session, Model m) {
		
		String username=(String)session.getAttribute("username");
		
		List<Cart> listCartItems=cartDAO.listCartItems(username);
		m.addAttribute("listCartItems", listCartItems);
		m.addAttribute("total_Amount", this.calculateTotalAmount(listCartItems));
		
		return "Cart";
	}
	
	@RequestMapping("/addToCart/{productId}")
	public String addCartItem(@PathVariable("productId")int productId, @RequestParam("quantity")int quantity, HttpSession session, Model m) {
		
		Product product=productDAO.getProduct(productId);
		
		String username=(String)session.getAttribute("username");
		
		Cart cartItem=new Cart();
		cartItem.setProductId(product.getProductId());
		cartItem.setProductName(product.getProductName());
		cartItem.setUsername(username);
		cartItem.setQuantity(quantity);
		cartItem.setStatus("NP");
		cartItem.setPrice(product.getPrice());
		
		cartDAO.addToCart(cartItem);
		
		List<Cart> listCartItems=cartDAO.listCartItems(username);
		m.addAttribute("listCartItems", listCartItems);
		m.addAttribute("total_Amount", this.calculateTotalAmount(listCartItems));
		
		return "Cart";
	}
	
	@RequestMapping("/updateCartItem/{cartItemId}")
	public String updateCartItem(@PathVariable("cartItemId")int cartItemId, @RequestParam("quantity")int quantity, HttpSession session, Model m) {
		
		Cart cartItem=cartDAO.getCartItem(cartItemId);
		cartItem.setQuantity(quantity);
		cartDAO.updateCartItem(cartItem);
		
		String username=(String)session.getAttribute("username");
		
		List<Cart> listCartItems=cartDAO.listCartItems(username);
		m.addAttribute("listCartItems", listCartItems);
		m.addAttribute("total_Amount", this.calculateTotalAmount(listCartItems));
		
		return "Cart";
	}
	
	@RequestMapping("/deleteCartItem/{cartItemId}")
	public String deleteCartItem(@PathVariable("cartItemId")int cartItemId, HttpSession session, Model m) {
		
		Cart cartItem=cartDAO.getCartItem(cartItemId);
		cartDAO.deleteCartItem(cartItem);
		
		String username=(String)session.getAttribute("username");
		
		List<Cart> listCartItems=cartDAO.listCartItems(username);
		m.addAttribute("listCartItems", listCartItems);
		m.addAttribute("total_Amount", this.calculateTotalAmount(listCartItems));
		
		return "Cart";
	}
	
	public int calculateTotalAmount(List<Cart> listCartItems) {
		
		int total_Amount=0;
		int count=0;
		
		while(count<listCartItems.size()) {
			Cart cartItem=listCartItems.get(count);
			total_Amount=total_Amount+(cartItem.getPrice()*cartItem.getQuantity());
			count++;
		}
		
		return total_Amount;
	}
}
