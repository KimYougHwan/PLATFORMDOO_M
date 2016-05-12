package co.kr.doosam.order.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.boot.mybatis.autoconfigure.Mapper;

import co.kr.doosam.order.vo.backOrderListVo;

@Mapper
public interface backOrderListMapper {
	
	@Select(" SELECT oid, parts_number as partsnumber, parts_name_ko as partsnameko FROM HMC_PARTS_MASTER LIMIT #{a},#{b} ")
	List<backOrderListVo> findAll(@Param("a") int firstnum, @Param("b") int pagenum);
	
}
