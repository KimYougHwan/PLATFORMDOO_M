package co.kr.doosam.order.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.boot.mybatis.autoconfigure.Mapper;

import co.kr.doosam.order.vo.backOrderListVo;

@Mapper
public interface backOrderListMapper {
	
	@Select(" SELECT B.CART_NUMBER AS CARTNUMBER  "
			+" , B.PARTS_NUMBER AS PARTSNUMBER  "
			+" , A.PARTS_NAME_KO AS PARTNAMEKO  "
			+" , A.BRAND_CODE AS BRANDCODE  "
			+" , B.ORDER_CNT AS ORDERCNT  "
			+" , A.UNIT_OID AS UNITOID  "
			+" , B.AVG_PAY*B.ORDER_CNT AS ORDERSUM  "
			+" , B.PROVIDE_QTY AS PROVIDEQTY  "
			+" , B.AVG_PAY*B.PROVIDE_QTY AS PROVIDESUM  "
			+"FROM HMC_PARTS_MASTER A, HMC_CART_DETAIL B  "
			+"WHERE A.PARTS_NUMBER=B.PARTS_NUMBER  "
			+"ORDER BY B.CART_NUMBER ASC  ")
	List<backOrderListVo> findAll();
	
}
