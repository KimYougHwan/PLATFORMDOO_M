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
public class QandAboardListController {
	@Autowired
	BoardMapper bm;
	
	@RequestMapping(value="/board/qAndAboardList", method={RequestMethod.GET,RequestMethod.POST})
	public String qAndAboardList(Model model, HttpServletRequest request){

		return "board/qAndAboardList";
	}
	
	@RequestMapping(value="/board/qAndAboardListController", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public List<HmcBoard> qAndAboardListController(Model model, HttpServletRequest request){
		//Q&A 게시판 리스트
		String userId = "test";
		String boardType = "qna";
		int listCnt = 10;		//한화면에 출력될 리스트 갯수
		String pNum = request.getParameter("pageNum");	//현재 페이지 번호


		int bgn = Integer.parseInt(pNum)*listCnt;
		List<HmcBoard> boardList = bm.boardList(userId,boardType,bgn,listCnt); 
		
		return boardList;
	}
	
	@RequestMapping(value = "/board/qAndAboardDelete")
	public String qAndAboardDelete(HttpServletRequest request){
		
		String[] oid = request.getParameterValues("oid");
		String delOid ="";

		//Mapper 에서 where in 조건절에 넣기 위해 쿼리 String 변환 함
		for(int i = 0; i < oid.length; i++){
			delOid += ""+oid[i];
			if(i < oid.length-1){
				delOid += ",";
			}
		}
		bm.qAndAboardDelete(delOid);		
		return "board/qAndAboardList.do";
	}
}
