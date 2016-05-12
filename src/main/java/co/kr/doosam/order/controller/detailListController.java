package co.kr.doosam.order.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.kr.doosam.order.service.detailListMapper;
import co.kr.doosam.order.vo.detailListVo;

@Controller
public class detailListController {
	
	@Resource
	private detailListMapper detaillistmapper;
	
	@RequestMapping(value = "/order/detailOrderList", method={RequestMethod.GET,RequestMethod.POST})
	public String detailOrderList(Model model, String[] args, @RequestParam("page") String pagea, @RequestParam("pagesum") String pagesum, @RequestParam("chkdate") String listDate){
		
		int pageb = (Integer.parseInt(pagea)-1)*10;
		int pagesub = Integer.parseInt(pagesum);
		int total=pageb+pagesub;
		System.out.println("page = "+pagea);
		System.out.println("pagesum = "+pagesum);
		System.out.println("listDate = "+listDate);
		System.out.println("total = "+total);
		long maxcount = detaillistmapper.countBy();
		long pagecount = (long) Math.ceil(maxcount/10);
		List<detailListVo> detailList = null;
		
		detailList=detaillistmapper.findAll(total, 10);
		
		model.addAttribute("detailList", detailList);
		model.addAttribute("pagea", pagea);
		model.addAttribute("pagecount", pagecount);
		model.addAttribute("nowpage", pagesum);
		
		return "order/detailOrderList";
	}
	
	@RequestMapping(value = "/order/detailListAjax",  method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<detailListVo> AjaxView(Model model, String[] args, @RequestParam("page") String pagea, @RequestParam("pagesum") String pagesum, @RequestParam("listDate") String listDate)  {
		int pageb = (Integer.parseInt(pagea)-1)*10;
		int pagesub = Integer.parseInt(pagesum);
		int total=pageb+pagesub;
		
		List<detailListVo> detailList = null;
		
		detailList =  detaillistmapper.findAll(total,10);
		
		return detailList;
	}

}