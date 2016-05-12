package co.kr.doosam.cart.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;


public class HmcCart implements Serializable {
	
	private int oid;
	private String cartNumber;
	private String componentCnt;
	private String totalAmount;
	private String 	depositExpireDay;
	private String	depositFianl;
	
	
	
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public String getCartNumber() {
		return cartNumber;
	}
	public void setCartNumber(String cartNumber) {
		this.cartNumber = cartNumber;
	}
	public String getComponentCnt() {
		return componentCnt;
	}
	public void setComponentCnt(String componentCnt) {
		this.componentCnt = componentCnt;
	}
	public String getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getDepositExpireDay() {
		return depositExpireDay;
	}
	public void setDepositExpireDay(String depositExpire) {
		this.depositExpireDay = depositExpireDay;
	}
	public String getDepositFianl() {
		return depositFianl;
	}
	public void setDepositFianl(String depositFianl) {
		this.depositFianl = depositFianl;
	}
	
	
	
	

}
