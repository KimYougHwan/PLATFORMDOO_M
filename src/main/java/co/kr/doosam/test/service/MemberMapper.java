package co.kr.doosam.test.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.springframework.boot.mybatis.autoconfigure.Mapper;

import co.kr.doosam.test.vo.Member;

@Mapper
public interface MemberMapper {

	@Select(" SELECT user_Id,user_Name	FROM HMC_MEMBER")
	List<Member> findAll();
	
	@Select("SELECT user_Id,user_Name FROM HMC_MEMBER WHERE USER_ID = #{userId}")
	List<Member> findById(String id);
			
}
