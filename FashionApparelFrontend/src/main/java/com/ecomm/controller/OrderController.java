package com.ecomm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ecomm.dao.CartDAO;
import com.ecomm.dao.OrderDAO;
import com.ecomm.dao.UserDAO;
import com.ecomm.model.Cart;
import com.ecomm.model.OrderDetail;
import com.ecomm.model.UserDetail;

@Controller
public class OrderController {
	
	@Autowired
	CartDAO cartDAO;
	
	@Autowired
	UserDAO userDAO;
	
	@Autowired
	OrderDAO orderDAO;
	
	@RequestMapping("/confirmOrder")
	public String showOrderConfirmPage(HttpSession session, Model m) {
		
		String username=(String)session.getAttribute("username");
		
		List<Cart> listCartItems=cartDAO.listCartItems(username);
		m.addAttribute("listCartItems", listCartItems);
		m.addAttribute("total_Amount", this.calculateTotalAmount(listCartItems));
		m.addAttribute("address", userDAO.getUser(username).getAddress());
		
		return "OrderConfirm";
	}
	
	@RequestMapping(value="/updateAddress", method=RequestMethod.POST)
	public String updateAddress(@RequestParam("addr")String address, HttpSession session, Model m) {
		
		String username=(String)session.getAttribute("username");
		UserDetail user=userDAO.getUser(username);
		user.setAddress(address);
		userDAO.updateUserDetail(user);
		
		List<Cart> listCartItems=cartDAO.listCartItems(username);
		m.addAttribute("listCartItems", listCartItems);
		m.addAttribute("total_Amount", this.calculateTotalAmount(listCartItems));
		m.addAttribute("address", userDAO.getUser(username).getAddress());
		
		return "OrderConfirm";
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
	
	@RequestMapping(value="/payment")
	public String showPaymentPage(HttpSession session, Model m) {
		
		String username=(String)session.getAttribute("username");
		List<Cart> listCartItems=cartDAO.listCartItems(username);
		m.addAttribute("total_Amount", this.calculateTotalAmount(listCartItems));
		m.addAttribute("address", userDAO.getUser(username).getAddress());
		
		return "Payment";
	}
	
	@RequestMapping(value="/receipt", method=RequestMethod.POST)
	public String showReceiptPage(@RequestParam("pmode")String pmode, HttpSession session, Model m) {
		
		String username=(String)session.getAttribute("username");
		int totalAmount;
		
		List<Cart> listCartItems=cartDAO.listCartItems(username);
		totalAmount=this.calculateTotalAmount(listCartItems);
		m.addAttribute("total_Amount", totalAmount);
		m.addAttribute("address", userDAO.getUser(username).getAddress());
		m.addAttribute("listCartItems", listCartItems);
		
		OrderDetail orderDetail=new OrderDetail();
		orderDetail.setTotalShoppingAmount(totalAmount);
		orderDetail.setPmode(pmode);
		orderDetail.setUsername(username);
		orderDetail.setOrderDate(new java.util.Date());
		
		orderDAO.payment(orderDetail);
		orderDAO.updateCartItemStatus(username, orderDetail.getOrderId());
		
		m.addAttribute("order", orderDetail);
		
		return "Receipt";
	}
}
