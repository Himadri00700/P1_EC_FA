package com.ecomm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {
	
	@RequestMapping("/login")
	public String showLoginPage() {
		return "Login";
	}
	
	@RequestMapping("/register")
	public String showRegisterPage() {
		return "Register";
	}
	
	@RequestMapping("/contactUs")
	public String showContactUsPage() {
		return "ContactUs";
	}
	
	@RequestMapping("/aboutUs")
	public String showAboutUsPage() {
		return "AboutUs";
	}
	
	@RequestMapping("/userHome")
	public String showUserHome() {
		return "UserHome";
	}
	
	@RequestMapping("/adminHome")
	public String showAdminHome() {
		return "AdminHome";
	}
}
