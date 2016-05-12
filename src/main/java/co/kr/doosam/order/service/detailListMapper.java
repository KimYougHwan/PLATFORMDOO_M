package co.kr.doosam.order.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.boot.mybatis.autoconfigure.Mapper;

import co.kr.doosam.order.vo.detailListVo;

@Mapper
public interface detailListMapper {
	
	@Select(" SELECT oid, parts_number as partsnumber, parts_name_ko as partsnameko FROM HMC_PARTS_MASTER LIMIT #{a},#{b} ")
	List<detailListVo> findAll(@Param("a") int firstnum, @Param("b") int pagenum);
	
	@Select(" SELECT COUNT(*) FROM HMC_PARTS_MASTER")
	long countBy();
	
	@Select(" SELECT oid, parts_number as partsnumber, parts_name_ko as partsnameko FROM HMC_PARTS_MASTER WHERE parts_number in (${a}) ")
	List<detailListVo> findBypartsNumberIn(@Param("a") String layername);
	
}
