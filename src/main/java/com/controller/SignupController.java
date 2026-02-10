package com.controller;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.entity.SignUp;
import com.service.SignupService;

@Controller
public class SignupController {

	@Autowired
	private SignupService signupService;

	@RequestMapping("/")
	public String getIndexPage() {
		return "signup";
	}

	@GetMapping("/login")
	public String getLoginPage() {
		return "login";
	}

	@RequestMapping("/save-user")
	public String getSignupPage(@ModelAttribute SignUp signup, Model model) {

		boolean saved = this.signupService.saveDetails(signup);
		if (!saved) {
			model.addAttribute("msg", "Email already exists ! please use another email");
			return "signup";
		}

		model.addAttribute("success", "Registration successfully");
		return "login";
	}

	@PostMapping("/loginsuccess")
	public String loginUser(@RequestParam String gmail,
			@RequestParam String password,
			HttpSession session,
			Model model) {

		if (gmail.equals("admin12@gmail.com") && password.equals("1234")) {
			session.setAttribute("loggedUser", "AMDIN");
			return "adminDashboard";
		}

		SignUp s = signupService.getSingleDetails(gmail, password);

		if (s != null) {
			// store customer details in session
			session.setAttribute("loggedUser", s);
			session.setAttribute("user_id", s.getId());
			session.setAttribute("user_name", s.getUsername());
			return "dashboard"; // success page
		}

		else {
			model.addAttribute("msg", "Invalid Gmail or Password");
			return "login"; // back to login.jsp
		}
	}

	@GetMapping("/profile")
	public String userProfile(HttpSession session, Model model) {

		SignUp user = (SignUp) session.getAttribute("loggedUser");

		if (user == null) {
			return "redirect:/login";
		}

		model.addAttribute("user", user);
		return "profile"; // profile.jsp
	}

}
