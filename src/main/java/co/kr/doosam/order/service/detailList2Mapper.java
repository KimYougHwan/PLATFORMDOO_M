package co.kr.doosam.order.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.boot.mybatis.autoconfigure.Mapper;

import co.kr.doosam.order.vo.detailList2Vo;
import co.kr.doosam.order.vo.detailListVo;

@Mapper
public interface detailList2Mapper {

	@Select(" SELECT B.CART_NUMBER AS CARTNUMBER  "
			+", B.PARTS_NUMBER AS PARTSNUMBER "
			+", A.PARTS_NAME_KO AS PARTSNAMEKO "
			+", A.BRAND_CODE AS BRANDCODE "
			+", B.ORDER_CNT AS ORDERCNT "
			+", A.UNIT_OID AS UNITOID "
			+", B.AVG_PAY AS AVGPAY "
			+", B.ORDER_CNT*B.AVG_PAY AS ORDERSUM "
			+", B.PROVIDE_QTY AS PROVIDEQTY "
			+", B.PROVIDE_QTY*AVG_PAY AS PROVIDESUM "
			+", A.MODEL_CODE AS MODELCODE "
			+", A.ITEM_CODE AS ITEMCODE "
			+", A.BULK AS BULK "
			+", A.WEIGHT AS WEIGHT "
			+"FROM HMC_PARTS_MASTER A, HMC_CART_DETAIL B "
			+"WHERE A.PARTS_NUMBER=B.PARTS_NUMBER "
			+"AND B.CART_NUMBER = '${a}' ")
	List<detailList2Vo> findBypartsNumber(@Param("a") String partnum);
	
}
