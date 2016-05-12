package co.kr.doosam.board.service;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.boot.mybatis.autoconfigure.Mapper;

import co.kr.doosam.board.vo.HmcBoard;

@Mapper
public interface BoardMapper{
	//board 조회
	@Select(  "	SELECT OID, "
			+ "        TITLE, "
			+ "        COMM, "
			+ "        CREATE_USER AS CREATEUSER, "
			+ "        DATE_FORMAT(CREATE_DATE,'%Y-%m-%d') AS CREATEDATE "
			+ "   FROM HMC_BOARD "
			+ "  WHERE USER_ID = #{userId} "
			+ "    AND BOARD_TYPE = #{boardType}"
			+ "  ORDER BY CREATEDATE, OID desc"
			+ "  LIMIT #{bgn}, #{listCnt}")
	List<HmcBoard> boardList(@Param("userId") String userId, @Param("boardType") String boardType, @Param("bgn") int bgn, @Param("listCnt") int listCnt);
	
	
	//board 삭제
	@Delete("	DELETE"
			+ "   FROM HMC_BOARD"
			+ "  WHERE OID IN ( ${delOid} )")
	void qAndAboardDelete(@Param("delOid") String delOid);
	
	//board 상세보기
	@Select(  "	SELECT OID, "
			+ "        TITLE, "
			+ "        COMM, "
			+ "        CREATE_USER AS CREATEUSER, "
			+ "        DATE_FORMAT(CREATE_DATE,'%Y-%m-%d') AS CREATEDATE "
			+ "   FROM HMC_BOARD "
			+ "  WHERE  OID = #{oid} ")
	public HmcBoard qAndAboardSelectDetail(@Param("oid") String oid);
	//board update
	@Update(  "	UPDATE HMC_BOARD"
			+ "    SET TITLE = #{hmcBoard.title}"
			+ "         COMM = #{hmcBoard.comm}"
			+ "  WHERE  OID = #{hmcBoard.oid} ")
	public void qAndAboardUpdate(@Param("hmcBoard") HmcBoard hmcBoard);
	
	//총 게시글 수
	@Select("	SELECT COUNT(*) "
			+ "	  FROM HMC_BOARD"
			+ "	 WHERE CREATE_USER = #{createId}"
			+ "    AND BOARD_TYPE = #{boardType}")
	public int totalCnt(@Param("createId") String createId, @Param("boardType") String boardType);

	@Insert("	INSERT "
			+ "	  INTO HMC_BOARD (BOARD_TYPE,"
			+ "                   TITLE,"
			+ "                   COMM,"
			+ "                   USER_ID,"
			+ "                   CREATE_USER) "
			//+ "                   CREATE_DATE
			+ "	           VALUES(#{hmcBoard.boardType},"
			+ "                   #{hmcBoard.title}, "
			+ "                   #{hmcBoard.comm},"
			+ "                   #{hmcBoard.userId},"
			+ "                   #{hmcBoard.createUser})")
			//+ "                   DATE_FORMAT(NOW(),'%Y-%m-%d')) 
	public void writeBoard(@Param("hmcBoard") HmcBoard hmcBoard);
	
}