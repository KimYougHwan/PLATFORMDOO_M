package co.kr.doosam.part.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.kr.doosam.part.service.SingleSearchService;
import co.kr.doosam.part.vo.PartSearchVo;

@Controller
public class SingleSearchController {
	
	@Autowired
	private SingleSearchService singleSearchService;
	
	@RequestMapping(value="/part/singleSearch", method={RequestMethod.POST, RequestMethod.GET})
	public String singleSearch(Model model, PartSearchVo partSearchVo, HttpServletRequest req){
		
		return "part/singleSearch";
	}
	
	@RequestMapping(value="/part/findSingleSearch", method={RequestMethod.POST, RequestMethod.GET})
	public String findSingleSearch(Model model, PartSearchVo partSearchVo, HttpServletRequest req){
		
		List<PartSearchVo> selectPart;
		
		partSearchVo.setBrandCode("M003");
		
		selectPart = singleSearchService.findSingleSearch(partSearchVo);
		
		model.addAttribute("brandCode", partSearchVo.getBrandCode());
		model.addAttribute("quantity",partSearchVo.getQuantity());
		model.addAttribute("partsNumber",partSearchVo.getPartsNumber());
		model.addAttribute("selectPart",selectPart);
		
		return "part/singleSearch";
	}
	
	@RequestMapping(value="/part/searchLayer", method={RequestMethod.POST, RequestMethod.GET})
	public String openLayer(Model model, PartSearchVo partSearchVo, HttpServletRequest req){
		
		model.addAttribute("selectPart","");
		
		return "part/searchLayer";
	}
}
