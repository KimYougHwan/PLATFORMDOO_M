package co.kr.doosam.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.kr.doosam.board.service.BoardMapper;
import co.kr.doosam.board.vo.HmcBoard;


@Controller
public class NoticeListController {
	@Autowired
	BoardMapper bm;
	
	@RequestMapping(value="/board/noticeList", method={RequestMethod.GET,RequestMethod.POST})
	public String noticeList(Model model, HttpServletRequest request){
		return "board/noticeList";
	}
	
	@RequestMapping(value="/board/noticeListListController", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<HmcBoard> noticeListListController(Model model, HttpServletRequest request){
		//Q&A 게시판 리스트
		String userId = "test";
		String boardType = "notice";
		int listCnt = 10;		//한화면에 출력될 리스트 갯수
		String pNum = request.getParameter("pageNum");	//현재 페이지 번호


		int bgn = Integer.parseInt(pNum)*listCnt;
		List<HmcBoard> boardList = bm.boardList(userId,boardType,bgn,listCnt); 
		
		
		return boardList;
	}
}
