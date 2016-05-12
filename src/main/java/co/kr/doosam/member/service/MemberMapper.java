package co.kr.doosam.member.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.boot.mybatis.autoconfigure.Mapper;

import co.kr.doosam.member.vo.Member;

@Mapper
public interface MemberMapper {

	@Select(" SELECT user_Id,user_Name	FROM HMC_MEMBER")
	List<Member> findAll();
	
	@Select("   SELECT INVAL_CNT AS INVALCNT"
			+ "   FROM HMC_MEMBER "
			+ "  WHERE USER_ID = #{userId}")
	int invalChk(@Param("userId") String userId);
	
	@Select("   SELECT COUNT(*) AS CNT"
			+ "   FROM HMC_MEMBER "
			+ "  WHERE USER_ID = #{userId}"
			+ "    AND USER_PW = #{userPw}")
	int findById(@Param("userId") String userId, @Param("userPw") String userPw);

	
	@Update("   UPDATE HMC_MEMBER"
			+ "    SET LOGIN_DATE = NOW(),"
			+ "        INVAL_CNT = 0"
			+ "  WHERE USER_ID = #{userId}")
	void loginHistoryUpdate(String userId);
	
	@Update("   UPDATE HMC_MEMBER"
			+ "    SET INVAL_CNT = INVAL_CNT + 1"
			+ "  WHERE USER_ID = #{userId}")
	void invalUpdate(String userId);
	
}
