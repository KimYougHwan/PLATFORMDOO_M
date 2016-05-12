package co.kr.doosam.cart.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.doosam.cart.vo.HmcCart;

@Controller
public class ManagerCartListController {
	
	@RequestMapping(value = "/cart/managerCartList")
	public String qAndAboardList(Model model){
		//CartList 관리
		return "cart/managerCartList";
	}
}
