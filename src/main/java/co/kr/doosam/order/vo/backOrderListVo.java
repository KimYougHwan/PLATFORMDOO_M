package co.kr.doosam.order.vo;

public class backOrderListVo {
	private static final long serialVersionUID = -4665651754723308801L;
	
	public backOrderListVo(){}
	
	private String cartnumber;
	private String partsnumber;
	private String partnameko;
	private String brandcode;
	private String ordercnt;
	private String unitoid;
	private String ordersum;
	private String provideqty;
	private String providesum;

	public String getCartnumber() {
		return cartnumber;
	}
	public void setCartnumber(String cartnumber) {
		this.cartnumber = cartnumber;
	}
	public String getPartsnumber() {
		return partsnumber;
	}
	public void setPartsnumber(String partsnumber) {
		this.partsnumber = partsnumber;
	}
	public String getPartnameko() {
		return partnameko;
	}
	public void setPartnameko(String partnameko) {
		this.partnameko = partnameko;
	}
	public String getBrandcode() {
		return brandcode;
	}
	public void setBrandcode(String brandcode) {
		this.brandcode = brandcode;
	}
	public String getOrdercnt() {
		return ordercnt;
	}
	public void setOrdercnt(String ordercnt) {
		this.ordercnt = ordercnt;
	}
	public String getUnitoid() {
		return unitoid;
	}
	public void setUnitoid(String unitoid) {
		this.unitoid = unitoid;
	}
	public String getOrdersum() {
		return ordersum;
	}
	public void setOrdersum(String ordersum) {
		this.ordersum = ordersum;
	}
	public String getProvideqty() {
		return provideqty;
	}
	public void setProvideqty(String provideqty) {
		this.provideqty = provideqty;
	}
	public String getProvidesum() {
		return providesum;
	}
	public void setProvidesum(String providesum) {
		this.providesum = providesum;
	}
	
}
