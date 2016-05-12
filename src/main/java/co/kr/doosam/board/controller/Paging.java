package co.kr.doosam.board.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.kr.doosam.board.service.BoardMapper;


@Controller
public class Paging {
	@Autowired
	BoardMapper bm;
	ArrayList<String> pageTest;
	
	
	@RequestMapping(value="/board/qAndAboardListPaging", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public ArrayList<String> qAndAboardListPaging(Model model,  HttpServletRequest request){
		
		String boardType = request.getParameter("boardType");
		String pNum = request.getParameter("pNum");
		int listCnt = 10;		//한화면에 출력될 리스트 갯수
		int pageCnt = 10;	//한화면에 출력될 페이지 수
		String userId="test";
		//String boardType = "qna";
		int TotalCnt = bm.totalCnt(userId,boardType);	//총 게시글 수
		int totalPageCnt = TotalCnt/listCnt;  //총페이지수 
		
		
		if(pNum==null){
			pNum = "1";
		}
		
		int currentPage = Integer.parseInt(pNum);
		pageTest = new ArrayList<String>();
		
		int i = 0;
		if(TotalCnt > currentPage+pageCnt){
			//총페이지가 현재 페이지부터 출력 페이지 숫자 만큼 보다 클경우
			if(currentPage + pageCnt <= totalPageCnt){
				//현재 보여줄 페이지 까지 
				for(int k = currentPage; k < currentPage+pageCnt +1; k++){
					pageTest.add(i,Integer.toString(k));
					i++;
				}
			}else{
				for(int k = currentPage; k <= totalPageCnt + 1; k++){
					pageTest.add(i,Integer.toString(k));
					i++;
				}
			}
		}
		

		return pageTest;
	}
}
