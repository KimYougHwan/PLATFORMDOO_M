package co.kr.doosam.order.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import co.kr.doosam.order.service.detailList2Mapper;
import co.kr.doosam.order.vo.detailListVo;

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
		
		List<detailListVo> detailList2 = null;
		
		detailList2=detaillist2mapper.findBypartsNumber(partnum);
		
		model.addAttribute("detailList2", detailList2);
		model.addAttribute("page", pagea);
		model.addAttribute("pagesum", pagesum);
		model.addAttribute("chkdate", listDate);
		model.addAttribute("partnum", partnum);
		
		return "order/detailOrderList2";
	}
	
}
