package co.kr.doosam.cart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SelectAdvancePaymentListController {
	
	@RequestMapping(value = "/cart/selectAdvancePaymentList")
	public String selectAdvancePaymentList(){
		//CartList 관리
		return "cart/selectAdvancePaymentList";
	}

}
