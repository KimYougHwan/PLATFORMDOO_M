package co.kr.doosam.cart.vo;

import java.io.Serializable;


public class HmcCart implements Serializable {
	
	private int oid;
	private String status;
	private String cartNumber;
	private String orderCnt;
	private String 	avgPay;
	private String	totalAmount;
	private String depositDate;
	private String dDay;
	
	private String partsNumber;
	private String partsNameEn;
	private String brandCode;
	private String unitOid;
	private String price;
	private String modelCode;
	private String itemCode;
	private String bulk;
	private String weight;
	
	private String rNum;

	public int getOid() {
		return oid;
	}

	public void setOid(int oid) {
		this.oid = oid;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getCartNumber() {
		return cartNumber;
	}

	public void setCartNumber(String cartNumber) {
		this.cartNumber = cartNumber;
	}

	public String getOrderCnt() {
		return orderCnt;
	}

	public void setOrderCnt(String orderCnt) {
		this.orderCnt = orderCnt;
	}

	public String getAvgPay() {
		return avgPay;
	}

	public void setAvgPay(String avgPay) {
		this.avgPay = avgPay;
	}

	public String getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getDepositDate() {
		return depositDate;
	}

	public void setDepositDate(String depositDate) {
		this.depositDate = depositDate;
	}

	public String getdDay() {
		return dDay;
	}

	public void setdDay(String dDay) {
		this.dDay = dDay;
	}

	public String getPartsNumber() {
		return partsNumber;
	}

	public void setPartsNumber(String partsNumber) {
		this.partsNumber = partsNumber;
	}

	public String getPartsNameEn() {
		return partsNameEn;
	}

	public void setPartsNameEn(String partsNameEn) {
		this.partsNameEn = partsNameEn;
	}

	public String getBrandCode() {
		return brandCode;
	}

	public void setBrandCode(String brandCode) {
		this.brandCode = brandCode;
	}

	public String getUnitOid() {
		return unitOid;
	}

	public void setUnitOid(String unitOid) {
		this.unitOid = unitOid;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getModelCode() {
		return modelCode;
	}

	public void setModelCode(String modelCode) {
		this.modelCode = modelCode;
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public String getBulk() {
		return bulk;
	}

	public void setBulk(String bulk) {
		this.bulk = bulk;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getrNum() {
		return rNum;
	}

	public void setrNum(String rNum) {
		this.rNum = rNum;
	}
}
