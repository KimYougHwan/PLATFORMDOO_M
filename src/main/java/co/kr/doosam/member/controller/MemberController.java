package co.kr.doosam.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

import co.kr.doosam.member.service.MemberMapper;
import co.kr.doosam.member.vo.Member;


@RestController
public class MemberController {

	private Logger log = LoggerFactory.getLogger(this.getClass());
	@Autowired
	MemberMapper memberMapper;
	
	@RequestMapping(value="/test1", method={RequestMethod.GET,RequestMethod.POST})
	public List<Member> members() {
		log.debug("");
		return memberMapper.findAll();
	}
/*
	@RequestMapping(value="/member/{id}" , method={RequestMethod.GET,RequestMethod.POST})
	public List<Member> member(@PathVariable("id") String id) {
		log.debug("#####################");
		log.debug("{}",id);
		log.debug("#####################");
		
		return memberMapper.findById(id);
	}
*/
}
