package co.kr.doosam.order.vo;

public class detailListVo {
	private static final long serialVersionUID = -4665651754723308801L;
	
	public detailListVo(){}
	
	private String cartnumber;
	private String orderdate;
	private String cartscnt;
	private String ordercnt;
	private String ordersum;
	private String provideqty;
	private String providesum;
	private String datesum;

	public String getCartnumber() {
		return cartnumber;
	}
	public void setCartnumber(String cartnumber) {
		this.cartnumber = cartnumber;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public String getCartscnt() {
		return cartscnt;
	}
	public void setCartscnt(String cartscnt) {
		this.cartscnt = cartscnt;
	}
	public String getOrdercnt() {
		return ordercnt;
	}
	public void setOrdercnt(String ordercnt) {
		this.ordercnt = ordercnt;
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
	public String getDatesum() {
		return datesum;
	}
	public void setDatesum(String datesum) {
		this.datesum = datesum;
	}
	
}
