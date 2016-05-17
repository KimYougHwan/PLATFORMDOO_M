package co.kr.doosam.order.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.boot.mybatis.autoconfigure.Mapper;

import co.kr.doosam.order.vo.detailListVo;

@Mapper
public interface detailListMapper {
	
	@Select(" SELECT CART_NUMBER AS CARTNUMBER	"
			+", ORDER_DATE AS ORDERDATE "
			+", COUNT(CART_NUMBER) AS CARTSCNT"
			+", SUM(ORDER_CNT) AS ORDERCNT"
			+", SUM(AVG_PAY*ORDER_CNT) AS ORDERSUM	"
			+", SUM(PROVIDE_QTY) AS PROVIDEQTY"
			+", SUM(AVG_PAY*PROVIDE_QTY) AS PROVIDESUM"
			+", CASE "
			+"		WHEN NOW() < date_add(ORDER_DATE, interval +15 day) THEN 'Y'"
			+"	ELSE 'N'"
			+"   END  AS DATESUM "
			+" FROM HMC_CART_DETAIL "
			+" WHERE ORDER_DATE >  DATE_FORMAT(#{startday}, '%Y-%m-%d')  "
			+" AND ORDER_DATE <= DATE_FORMAT(#{endday}, '%Y-%m-%d') "
			+" GROUP BY CART_NUMBER, ORDER_DATE "
			+" LIMIT #{a}, #{b} ")
	List<detailListVo> findAll(@Param("startday") String startday, @Param("endday") String endday, @Param("a") int firstnum, @Param("b") int pagenum);
	
	@Select(" SELECT COUNT(DISTINCT CART_NUMBER) AS CNT FROM HMC_CART_DETAIL WHERE ORDER_DATE > DATE_FORMAT(#{startday}, '%Y-%m-%d') AND ORDER_DATE <= DATE_FORMAT(#{endday}, '%Y-%m-%d') ")
	long countBy(@Param("startday") String startday, @Param("endday") String endday);
	
}
