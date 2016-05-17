package co.kr.doosam.order.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
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
		String startday="";
		String endday="";
		if(listDate.equals("N")){
			SimpleDateFormat fm1 = new SimpleDateFormat("yyyy-MM-dd");
			endday = fm1.format(new Date());
			Calendar cal = Calendar.getInstance();
		    cal.setTime(new Date());
		    cal.add(Calendar.DATE, 1);
		    cal.add(Calendar.MONTH, -6);
		    System.out.println("cal = "+cal);
		    startday=fm1.format(cal.getTime());
		}else{
			System.out.println("listDate = "+listDate);
			String[] fba=listDate.split("-");
			String[] tba1=fba[0].split("/");
			String[] tba2=fba[1].split("/");
			startday=tba1[2].trim()+"-"+tba1[0].trim()+"-"+tba1[1].trim();
			endday=tba2[2].trim()+"-"+tba2[0].trim()+"-"+tba2[1].trim();
			System.out.println("startday = "+startday);
			System.out.println("endday = "+endday);
		}
		System.out.println("startday = "+startday);
		System.out.println("endday = "+endday);
		long maxcount = detaillistmapper.countBy(startday,endday);
		long pagecount = (long) Math.ceil(maxcount/10);
		System.out.println("maxcount = "+maxcount);
		List<detailListVo> detailList = null;
		
		detailList=detaillistmapper.findAll(startday, endday, total, 10);
		System.out.println("detailList = "+detailList.size());
		
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
		String startday="";
		String endday="";
		if(listDate.equals("N")){
			SimpleDateFormat fm1 = new SimpleDateFormat("yyyy-MM-dd");
			endday = fm1.format(new Date());
			Calendar cal = Calendar.getInstance();
		    cal.setTime(new Date());
		    cal.add(Calendar.DATE, 1);
		    cal.add(Calendar.MONTH, -6);
		    System.out.println("cal = "+cal);
		    startday=fm1.format(cal.getTime());
		}else{
			System.out.println("listDate = "+listDate);
			String[] fba=listDate.split("-");
			String[] tba1=fba[0].split("/");
			String[] tba2=fba[1].split("/");
			startday=tba1[2].trim()+"-"+tba1[0].trim()+"-"+tba1[1].trim();
			endday=tba2[2].trim()+"-"+tba2[0].trim()+"-"+tba2[1].trim();
			System.out.println("startday = "+startday);
			System.out.println("endday = "+endday);
		}
		List<detailListVo> detailList = null;
		
		detailList=detaillistmapper.findAll(startday, endday, total, 10);
		
		return detailList;
	}

}