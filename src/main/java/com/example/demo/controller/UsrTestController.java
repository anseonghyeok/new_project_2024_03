package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrTestController {

	
	@RequestMapping("/usr/test/login")
	public String showtest(HttpServletRequest req) {

		return "/usr/test/login";
	}
	
	@RequestMapping("/usr/test/login2")
	public String showtest2(HttpServletRequest req) {

		return "/usr/test/login2";
	}

	@RequestMapping("/usr/test/join")
	public String showtest3(HttpServletRequest req) {

		return "/usr/test/join";
	}
	
	@RequestMapping("/usr/test/findid")
	public String showtest4(HttpServletRequest req) {

		return "/usr/test/findid";
	}
	
	@RequestMapping("/usr/test/findpw")
	public String showtest5(HttpServletRequest req) {

		return "/usr/test/findpw";
	}
	
}