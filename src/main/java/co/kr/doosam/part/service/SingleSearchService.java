package co.kr.doosam.part.service;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.boot.mybatis.autoconfigure.Mapper;

import co.kr.doosam.part.vo.PartSearchVo;

@Mapper
public interface SingleSearchService {
	
	@Select(" SELECT a.oid, a.brand_code as brandCode, a.parts_number as partsNumber, a.parts_name_ko as partsNameKo"
			+ ", a.parts_name_en as partsNameEn, b.price FROM HMC_PARTS_MASTER a"
			+ ", HMC_PARTS_PRICE b where a.brand_code = #{brandCode} and a.parts_number = #{partsNumber} and a.parts_number = b.parts_number ")
	public List<PartSearchVo> findSingleSearch(PartSearchVo partSearchVo);
}
