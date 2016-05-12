package co.kr.doosam.cart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SelectDetailCart2Controller {

	@RequestMapping(value = "/cart/selectDetailCart2")
	public String selectDetailCart2(){
		//CartList 관리
		return "cart/selectDetailCart2";
	}

}
