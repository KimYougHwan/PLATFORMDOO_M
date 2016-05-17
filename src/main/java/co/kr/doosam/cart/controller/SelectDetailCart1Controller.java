package co.kr.doosam.cart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.doosam.cart.service.CartMapper;
import co.kr.doosam.cart.vo.HmcCart;

@Controller
public class SelectDetailCart1Controller {
	@Autowired
	CartMapper cm; 
	
	@RequestMapping(value = "/cart/selectDetailCart")
	public String selectDetailCart(Model model, HttpServletRequest request){
		//CartList 관리
		String cartNumber = request.getParameter("chkBox");
		String status= request.getParameter("status");
		HmcCart cart = new HmcCart();
		//검색조건에 session 추가 필요..
		List<HmcCart> list = cm.detailCartList(cartNumber, status);
		cart = cm.detailCartTopList(cartNumber, status);
		
		System.out.println(cart.getCartNumber());
		System.out.println(cart.getdDay());
		
		model.addAttribute("cart", cart);
		model.addAttribute("list", list);
		return "cart/selectDetailCart";
	}
}
