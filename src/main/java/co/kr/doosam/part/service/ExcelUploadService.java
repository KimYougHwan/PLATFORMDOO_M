package co.kr.doosam.part.service;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.boot.mybatis.autoconfigure.Mapper;

import co.kr.doosam.part.vo.PartSearchVo;

@Mapper
public interface ExcelUploadService {
	
	//public List<PartSearchVo> selectExcelUploadSearch(PartSearchVo partSearchVo);
	
	@Select(" SELECT c.oid, a.brand_code as brandCode, a.parts_number as partsNumber, a.parts_name_ko as partsNameKo"
			+ ", a.parts_name_en as partsNameEn, b.price FROM HMC_PARTS_MASTER a"
			+ ", HMC_PARTS_PRICE b where a.parts_number = b.parts_number LIMIT 20")
	public List<PartSearchVo> findByPartNumberAndPage(String partNumber,int page);
	
	@Select(" SELECT c.oid, a.brand_code as brandCode, a.parts_number as partsNumber, a.parts_name_ko as partsNameKo"
			+ ", a.parts_name_en as partsNameEn, b.price FROM HMC_PARTS_MASTER a"
			+ ", HMC_PARTS_PRICE b where a.parts_number = b.parts_number LIMIT #{page}, 20")
	public List<PartSearchVo> findByUserNameAndPage(int page);
	
	@Select(" SELECT c.oid, a.brand_code as brandCode, a.parts_number as partsNumber, a.parts_name_ko as partsNameKo"
			+ ", a.parts_name_en as partsNameEn, b.price FROM HMC_PARTS_MASTER a"
			+ ", HMC_PARTS_PRICE b, HMC_EXCEL_UPLOAD c where c.user_id = #{userId} and a.parts_number = c.parts_number and a.parts_number = b.parts_number LIMIT #{page}, 20")
	public List<PartSearchVo> findByUserIdAndPage(PartSearchVo partSearchVo);
	
	@Insert("INSERT INTO hmc_excel_upload (parts_number,user_id,quantity,create_date) VALUES (#{partsNumber}, #{userId}, #{quantity}, now() )")
	public void insertExcel(PartSearchVo partSearchVo);
	
	@Delete("DELETE FROM hmc_excel_upload where user_id = #{userId} ")
	public void deleteExcel(String userId);
	
	@Select("UPDATE HMC_EXCEL_UPLOAD SET checkbox = 'Y' where user_id = #{userId} and oid = #{oid}")
	public void updateByOidAndUserId(PartSearchVo partSearchVo);
	
	@Select(" SELECT c.oid, a.brand_code as brandCode, a.parts_number as partsNumber, a.parts_name_ko as partsNameKo"
			+ ", a.parts_name_en as partsNameEn, b.price FROM HMC_PARTS_MASTER a"
			+ ", HMC_PARTS_PRICE b, HMC_EXCEL_UPLOAD c where c.user_id = #{userId} and checkbox = 'Y' and c.parts_number = a.parts_number and a.parts_number = b.parts_number")
	public List<PartSearchVo> findByUserIdAndCheck(String userId);
	
	@Update("UPDATE HMC_EXCEL_UPLOAD SET checkbox = '' WHERE user_id = #{userId} ")
	public void updateByUserId(String userId);	
	
}
