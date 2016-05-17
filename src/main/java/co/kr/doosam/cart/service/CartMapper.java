package co.kr.doosam.cart.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.boot.mybatis.autoconfigure.Mapper;

import co.kr.doosam.cart.vo.HmcCart;

@Mapper
public interface CartMapper{
	
	//장바구니 조회
	@Select(  " SELECT OID,"
			+ "        STATUS, "
			+ "        CART_NUMBER AS CARTNUMBER, "
			+ "        SUM(ORDER_CNT) AS ORDERCNT, "
			+ "        SUM(AVG_PAY) AS AVGPAY, "
			+ "        SUM(AVG_PAY) * SUM(ORDER_CNT) AS TOTALAMOUNT, "
			+ "        DATE_ADD(ORDER_DATE, INTERVAL 5 DAY) AS DEPOSITDATE, "
			+ "        DATEDIFF(DATE_ADD(ORDER_DATE, INTERVAL 5 DAY), NOW()) AS DDAY "
			+ "   FROM HMC_CART_DETAIL "
			+ "  WHERE COMPANY_CODE =  'COMPANYCOD' "
			+ "   AND DATE_ADD(ORDER_DATE, INTERVAL 5 DAY) >= NOW() "
			+ "   AND STATUS = 0 "
			+ "GROUP BY CART_NUMBER "
			+ "UNION ALL "
			+ " SELECT OID,"
			+ "        STATUS, "
			+ "        CART_NUMBER AS CARTNUMBER, "
			+ "        SUM(ORDER_CNT) AS ORDERCNT, "
			+ "        SUM(AVG_PAY)  AS AVGPAY, "
			+ "        SUM(AVG_PAY) * SUM(ORDER_CNT) AS TOTALAMOUNT, "
			+ "        DATE_ADD(DEPOSIT_DATE, INTERVAL 10 DAY) AS DEPOSITDATE, "
			+ "        DATEDIFF(DATE_ADD(DEPOSIT_DATE, INTERVAL 10 DAY), NOW()) AS DDAY "
			+ "   FROM HMC_CART_DETAIL "
			+ "  WHERE STATUS = 1 "
			+ "    AND COMPANY_CODE =  'COMPANYCOD' "
			+ "    AND DEPOSIT_DATE != '0000-00-00' "
			+ "    AND DATE_ADD(DEPOSIT_DATE, INTERVAL 10 DAY) >= NOW() GROUP BY CART_NUMBER")
	List<HmcCart> cartList(@Param("userId") String userId);
	
	
	
	
	@Select(  "SELECT TB.PARTS_NUMBER AS PARTSNUMBER, "
			+ "       TB.PARTS_NAME_EN AS PARTSNAMEEN,"
			+ "       TB.BRAND_CODE AS BRANDCODE,"
			+ "       TA.ORDER_CNT AS ORDERCNT,"
			+ "       TB.UNIT_OID AS UNITOID,"
			+ "       TC.PRICE AS PRICE,"
			+ "       ORDER_CNT * TC.PRICE AS TOTALAMOUNT,"
			+ "       TB.MODEL_CODE AS MODELCODE,"
			+ "       TB.ITEM_CODE AS ITEMCODE,"
			+ "       TB.BULK,"
			+ "       TB.WEIGHT "
			+ "  FROM HMC_CART_DETAIL TA, "
			+ "       HMC_PARTS_MASTER TB, "
			+ "       HMC_PARTS_PRICE TC  "
			+ " WHERE STATUS = #{status} "
			+ "   AND CART_NUMBER = #{cartNumber} "
			+ "   AND TA.PARTS_NUMBER = TB.PARTS_NUMBER "
			+ "   AND TA.PARTS_NUMBER = TC.PARTS_NUMBER ")
	List<HmcCart> detailCartList(@Param("cartNumber") String cartNumber,@Param("status") String status);
	
	
	
	@Select(  "SELECT STATUS, "
			+ "       CART_NUMBER AS CARTNUMBER, "
			+ "       SUM(ORDER_CNT) AS ORDERCNT, "
			+ "       SUM(AVG_PAY) * SUM(ORDER_CNT) AS TOTALAMOUNT, "
			+ "       DATE_ADD(ORDER_DATE, INTERVAL 5 DAY) AS DEPOSITDATE, "
			+ "       CASE WHEN STATUS = '0' THEN DATEDIFF(DATE_ADD(ORDER_DATE, INTERVAL 5 DAY), NOW())"
			+ "            WHEN STATUS = '1' THEN DATEDIFF(DATE_ADD(DEPOSIT_DATE, INTERVAL 10 DAY), NOW())"
			+ "       END AS DDAY"
			+ "  FROM HMC_CART_DETAIL"
			+ " WHERE STATUS = #{status}"
			+ "   AND CART_NUMBER = #{cartNumber} ")
	HmcCart detailCartTopList(@Param("cartNumber") String cartNumber,@Param("status") String status);
	
	
	
}