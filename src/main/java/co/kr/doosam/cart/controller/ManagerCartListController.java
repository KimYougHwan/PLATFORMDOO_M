package co.kr.doosam.cart.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.doosam.cart.service.CartMapper;
import co.kr.doosam.cart.vo.HmcCart;

@Controller
public class ManagerCartListController {
	@Autowired
	CartMapper cm; 
	
	@RequestMapping(value = "/cart/managerCartList")
	public String qAndAboardList(Model model){
		//CartList 관리
		String userId = "test";
		
		List<HmcCart> list = new ArrayList<HmcCart>();
		
		list = cm.cartList(userId);
		

		for(int i = 0; i < list.size(); i++){
			System.out.println(list.get(i).getCartNumber());
		}
		
		
		model.addAttribute("list", list);
		return "cart/managerCartList";
	}
}
