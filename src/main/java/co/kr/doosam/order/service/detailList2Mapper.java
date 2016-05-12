package co.kr.doosam.order.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.boot.mybatis.autoconfigure.Mapper;

import co.kr.doosam.order.vo.detailListVo;

@Mapper
public interface detailList2Mapper {
	
	@Select(" SELECT oid, parts_number as partsnumber, parts_name_ko as partsnameko FROM HMC_PARTS_MASTER WHERE parts_number = '${a}' ")
	List<detailListVo> findBypartsNumber(@Param("a") String layername);
	
}
