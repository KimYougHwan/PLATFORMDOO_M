package co.kr.doosam.order.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.kr.doosam.order.service.backOrderListMapper;
import co.kr.doosam.order.vo.backOrderListVo;
import co.kr.doosam.order.vo.detailListVo;

@Controller
public class backOrderListController {
	
	@Resource
	private backOrderListMapper backorderlistmapper;
	
	@RequestMapping(value = "/order/backOrderList", method={RequestMethod.GET,RequestMethod.POST})
	public String backOrderList(Model model, String[] args, @RequestParam("backpage") String pagea, @RequestParam("backpagesum") String pagesum, @RequestParam("backchkdate") String chkdate){
		
		System.out.println("pagea = "+pagea);
		System.out.println("pagesum = "+pagesum);
		System.out.println("chkdate = "+chkdate);
		List<backOrderListVo> backorderlist = null;
		
		backorderlist=backorderlistmapper.findAll();
		
		model.addAttribute("backorderlist", backorderlist);
		model.addAttribute("page", pagea);
		model.addAttribute("pagesum", pagesum);
		model.addAttribute("chkdate", chkdate);
		
		return "order/backOrderList";
	}
	
	@RequestMapping(value = "/order/backOrderListAjax",  method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<backOrderListVo> AjaxView(Model model, String[] args, @RequestParam("listDate") String listDate)  {
		
		System.out.println("listDate = "+listDate);
		
		List<backOrderListVo> backorderlist = null;
		
		backorderlist=backorderlistmapper.findAll();
		
		return backorderlist;
	}
}
