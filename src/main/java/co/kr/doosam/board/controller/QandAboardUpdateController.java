package co.kr.doosam.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.doosam.board.service.BoardMapper;
import co.kr.doosam.board.vo.HmcBoard;



@Controller
public class QandAboardUpdateController {
	
	@Autowired
	private BoardMapper bm;
	@RequestMapping(value = "/board/qAndAboardUpdate")
	public String qAndAboardUpdate(Model model, String oid){
		HmcBoard hmcBoard = new HmcBoard();
		//Q&A 수정
		hmcBoard = bm.qAndAboardSelectDetail(oid);
		model.addAttribute("hmcBoard",hmcBoard);
		return "board/qAndAboardUpdate";
	}
	
	@RequestMapping(value = "/board/qAndAboardUpdateAction")
	public String qAndAboardUpdateAction(HmcBoard hmcBoard){
		System.out.println("+++++++++++++++++++++++++++++++");

		bm.qAndAboardUpdate(hmcBoard);
		
		return "redirect:/board/qAndAboardList.do";
	}
}
