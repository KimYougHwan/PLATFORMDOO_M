package co.kr.doosam.order.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import co.kr.doosam.order.service.detailList2Mapper;
import co.kr.doosam.order.vo.detailList2Vo;

@Controller
public class detailList2Controller {
	
	@Resource
	private detailList2Mapper detaillist2mapper;
	
	@RequestMapping(value = "/order/detailOrderList2", method={RequestMethod.GET,RequestMethod.POST})
	public String detailOrderList(Model model, String[] args, @RequestParam("ppage") String pagea, @RequestParam("ppagesum") String pagesum, @RequestParam("pchkdate") String listDate, @RequestParam("partnum") String partnum){
		
		System.out.println("pagea  = "+pagea);
		System.out.println("pagesum  = "+pagesum);
		System.out.println("listDate  = "+listDate);
		System.out.println("partnum  = "+partnum);
		
		List<detailList2Vo> detailList2 = null;
		
		detailList2=detaillist2mapper.findBypartsNumber(partnum);
		System.out.println("size = "+detailList2.size());
		for(int i=0; i<detailList2.size(); i++){
			
			System.out.println("getCartnumber = "+detailList2.get(i).getCartnumber());
			System.out.println("getPartsnumber = "+detailList2.get(i).getPartsnumber());
			System.out.println("getPartsnameko = "+detailList2.get(i).getPartsnameko());
			System.out.println("getBrandcode = "+detailList2.get(i).getBrandcode());
			System.out.println("getOrdercnt = "+detailList2.get(i).getOrdercnt());
			System.out.println("getUnitoid = "+detailList2.get(i).getUnitoid());
			System.out.println("getAvgpay = "+detailList2.get(i).getAvgpay());
			System.out.println("getOrdersum = "+detailList2.get(i).getOrdersum());
			System.out.println("getProvideqty = "+detailList2.get(i).getProvideqty());
			System.out.println("getProvidesum = "+detailList2.get(i).getProvidesum());
			System.out.println("getModelcode = "+detailList2.get(i).getModelcode());
			System.out.println("getItemcode = "+detailList2.get(i).getItemcode());
			System.out.println("getBulk = "+detailList2.get(i).getBulk());
			System.out.println("getWeight = "+detailList2.get(i).getWeight());
			
		}
		model.addAttribute("detailList2", detailList2);
		model.addAttribute("page", pagea);
		model.addAttribute("pagesum", pagesum);
		model.addAttribute("chkdate", listDate);
		model.addAttribute("partnum", partnum);
		
		return "order/detailOrderList2";
	}
	
}
