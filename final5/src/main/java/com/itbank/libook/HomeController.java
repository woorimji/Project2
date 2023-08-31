package com.itbank.libook;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping(value= {"/", "index.do"})
	public String home() {
		return "libookMain";
	}
	/*
	 * @RequestMapping(value="main.do") public String goMain() { return
	 * "libookMain"; }
	 */
	@RequestMapping(value="goCompany.do")
	public String goCompany() {
		return "showCompany";
	}
}
