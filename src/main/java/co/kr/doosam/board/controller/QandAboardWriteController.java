package co.kr.doosam.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import co.kr.doosam.board.service.BoardMapper;
import co.kr.doosam.board.vo.HmcBoard;



@Controller
public class QandAboardWriteController {

	@Autowired
	private BoardMapper bm;
	@RequestMapping(value = "/board/qAndAboardWrite")
	public String qAndAboardWrite(HmcBoard board){
		
		return "board/qAndAboardWrite";
	}
	@RequestMapping(value = "/board/qAndAboardWriteAction")
	public String qAndAboardWriteAction(HmcBoard hmcBoard){
		//Q&A 게시판 글쓰기
		String userId = "test";
	
		hmcBoard.setCreateUser(userId);
		hmcBoard.setUserId(userId);
		bm.writeBoard(hmcBoard);
		
		return "redirect:/board/qAndAboardList.do";
	}
	
}
