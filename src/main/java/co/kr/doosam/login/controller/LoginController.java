package co.kr.doosam.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import co.kr.doosam.member.service.MemberMapper;


@Controller
@SessionAttributes("inputId")
public class LoginController {
	
	//private Logger log = LoggerFactory.getLogger(this.getClass());
	@Autowired
	MemberMapper memberMapper;

	
	@RequestMapping(value="/", method={RequestMethod.GET,RequestMethod.POST})
	public String loginView(){
		
		
		return "login";
	}
	
	@RequestMapping(value="/loginChk", method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public int loginChk(Model model, HttpServletRequest request, HttpSession session){
		String id = request.getParameter("inputId");
		String pw = request.getParameter("inputPassword");
		int returnPage;
		
		int invalCnt = memberMapper.invalChk(id);
		String companyCode = "";
		//로그인 실패 횟수 7회 체크
		if(invalCnt < 7){
			int user = memberMapper.findById(id,pw);
			if(user == 1 ){
				//로그인 성공
				//로그인 성공시 페일 횟수 0
				session.setAttribute("userId", id);
				session.setAttribute("companyCode", companyCode);
				returnPage=1;
				//로그인 히스토리update
				memberMapper.loginHistoryUpdate(id);
				
			}else{
				//로그인 실패
				//페일횟수 7이상일때 잠금
				memberMapper.invalUpdate(id);
				returnPage=2;
			}
		}else{
			returnPage=3;
		}
		return returnPage;
	}
	
	//특수문자 제거 
	public static String StringReplace(String str){     
		
	      String match = "[^\uAC00-\uD7A3xfe0-9a-zA-Z\\s]";
	      str =str.replaceAll(match, " ");
	      System.out.println(str);
	      System.out.println(str);
	      System.out.println(str);
	      return str;
	   }

}
