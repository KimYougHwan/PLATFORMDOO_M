package co.kr.doosam.cart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SelectDetailCartController {
	
	@RequestMapping(value = "/cart/selectDetailCart")
	public String selectDetailCart(){
		//CartList 관리
		return "cart/selectDetailCart";
	}
	
}
